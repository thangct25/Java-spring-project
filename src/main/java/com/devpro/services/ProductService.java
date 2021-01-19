package com.devpro.services;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.enities.Products;
import com.devpro.enities.Products_images;
import com.devpro.model.Product;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.ProductRepo;
import com.github.slugify.Slugify;

@Service
public class ProductService {
	@PersistenceContext
	protected EntityManager entityManager;
	@Autowired
	private ProductRepo productRepo;

	public void save(MultipartFile[] productImages, Products products) {
		productRepo.save(products);
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;
		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;
		return false;
	}
	
	
	
public void saveEdit(MultipartFile[] productImages1, Products product) throws IllegalStateException, IOException {
		
		if(product.getId() != null) {
			// chỉnh sửa
			// lấy dữ liệu cũ của sản phẩm
			Products productInDb = productRepo.findById(product.getId()).get();
			
			if(!isEmptyUploadFile(productImages1)) { // nếu admin sửa ảnh sản phẩm
				// lấy danh sách ảnh cũ của sản phẩm
				List<Products_images> oldProductImages = productInDb.getProductImages();
				
				// xoá ảnh cũ trên vật lí(host)
//				for(Products_images _images : oldProductImages) {
//					new File("C:\\\\Users\\\\Cao The Thang\\\\Downloads\\\\com.devpro.shop11\\\\upload\\\\" + _images.getPath()).delete();
//				}
				
				// xoá ảnh trên database
				product.removeProductImages();
				
			} else { // ảnh phải giữ nguyên
				product.setProductImages(productInDb.getProductImages());
			}
			
		}
		
		if(!isEmptyUploadFile(productImages1)) { // có upload ảnh lên.
			for(MultipartFile productImage : productImages1) {
				
				// lưu vật lí
				productImage.transferTo(new File("C:\\\\Users\\\\Cao The Thang\\\\Downloads\\\\com.devpro.shop11\\\\upload\\\\" + productImage.getOriginalFilename()));
				
				Products_images _productImages = new Products_images();
				_productImages.setPath(productImage.getOriginalFilename());
				_productImages.setTitle(productImage.getOriginalFilename());
				product.addProductImages(_productImages);
			}
		}
		Slugify slg = new Slugify();
		String seo = slg.slugify(product.getTitle() + "-" + System.currentTimeMillis());
		product.setSeo(seo);
		product.setStatus(true);
		product.setUpdatedDate(LocalDateTime.now());
		productRepo.save(product);
	}
	
	
	public void saveImages(MultipartFile[] productImages, Products product) throws IllegalStateException, IOException {

		if (!isEmptyUploadFile(productImages)) { // cÃ³ upload áº£nh lÃªn.
			for (MultipartFile productImage : productImages) {

				// lÆ°u váº­t lÃ­
				productImage.transferTo(new File("C:\\Users\\Cao The Thang\\Downloads\\com.devpro.shop11\\upload\\"
						+ productImage.getOriginalFilename()));

				Products_images _productImages = new Products_images();
				_productImages.setPath(productImage.getOriginalFilename());
				_productImages.setTitle(productImage.getOriginalFilename());
				product.addProductImages(_productImages);
			}
		}

		productRepo.save(product);
	}

	public List<Products> search(final ProductSearch productSearch) {
//		String jpql = "Select caijcungduoc from Product caijcungduoc";
//		Query query = entityManager.createQuery(jpql, Product.class);

		String sql = "select * from tbl_products where 1=1";

		if(productSearch != null && productSearch.getCategoryId() != null) {
			sql = sql + " and category_id=" + productSearch.getCategoryId();
		} 
		if(productSearch != null && productSearch.getId() != null) {
			sql = sql + " and id=" + productSearch.getId();
		}
		if(productSearch != null && productSearch.getSeoCategoty() != null) {
			sql = sql + " and category_id in (select id from tbl_category where seo='"+productSearch.getSeoCategoty()+"')";
		}
		if(productSearch != null && productSearch.getSeoProduct() != null) {
			sql = sql + " and seo=\'"+productSearch.getSeoProduct()+"\'";
		}
		if(productSearch != null && productSearch.getName() != null) {
			sql = sql + " and title LIKE \'%"+productSearch.getName()+"%"+ "\'";
		}
		if(productSearch != null && productSearch.getMinPrice() != null && productSearch.getMaxPrice() != null) {
			sql = sql + " and price >="+productSearch.getMinPrice()+" and price <="+ productSearch.getMaxPrice();
		}
		Query query = entityManager.createNativeQuery(sql, Products.class);
		if(productSearch.getCurrentPage() != null && productSearch.getCurrentPage() > 0) {
			query.setFirstResult((productSearch.getCurrentPage()-1) * ProductSearch.SIZE_ITEMS_ON_PAGE);
			query.setMaxResults(ProductSearch.SIZE_ITEMS_ON_PAGE);
		}
		return query.getResultList();
	}
	public List<Products> searchByStatus() {
//		String jpql = "Select caijcungduoc from Product caijcungduoc";
//		Query query = entityManager.createQuery(jpql, Product.class);

		String sql = "select * from tbl_products where status=1";
		
		Query query = entityManager.createNativeQuery(sql, Products.class);
		
		return query.getResultList();
	}
	public List<Products> searchByQuery(String sql){
		return entityManager.createNativeQuery(sql, Products.class).getResultList();
	}
}
