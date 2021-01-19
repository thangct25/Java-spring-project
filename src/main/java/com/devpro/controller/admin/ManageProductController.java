package com.devpro.controller.admin;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.controller.BaseController;
import com.devpro.enities.Category;
import com.devpro.enities.Products;
import com.devpro.model.AjaxRespone;
import com.devpro.model.Product;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.CategoryService;
import com.devpro.services.ProductService;
import com.github.slugify.Slugify;

@Controller
public class ManageProductController extends BaseController {
	@PersistenceContext
	protected EntityManager entityManager;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductRepo productRepo;
	
	@Autowired
	private CategoryRepo categoryRepo;
	@Autowired CategoryService categoryService;
	
	@RequestMapping(value= {"/admin/edit-product"},method=RequestMethod.POST)
	public String saveProduct(@RequestParam("productimages") MultipartFile[] productImages,
			@ModelAttribute("product") Products product,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		
		productService.saveEdit(productImages, product);
		
		return "redirect:/admin/product/list";
	}
	@RequestMapping(value = { "/admin/product/{id}" }, method = RequestMethod.GET)
	public String editProduct(@PathVariable("id") Integer id,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		Products product = productRepo.getOne(id);
		model.addAttribute("product", product);
		model.addAttribute("categories",categoryRepo.findAll());
		return "back-end/add-product";
	}
	@RequestMapping(value= {"/delete-product"},method=RequestMethod.POST)
	public ResponseEntity<AjaxRespone> deleteProduct(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,
			@RequestBody Products data){
		//String idPro=String.valueOf(data.getId());
		Products productDeleted=productRepo.getOne(data.getId());
		productDeleted.setStatus(false);
		productRepo.save(productDeleted);
		model.addAttribute("products", productService.searchByStatus());
		return ResponseEntity.ok(new AjaxRespone(200,"Thành công"));
	}
	@RequestMapping(value= {"/add-category"},method=RequestMethod.POST)
	public ResponseEntity<AjaxRespone> addCategory(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,
			@RequestBody Category data){
		//String idPro=String.valueOf(data.getId());
		Category category=new Category();
		category.setName(data.getName());
		category.setDescription("new Category");
		Slugify slg = new Slugify();
		String result = slg.slugify(category.getName() + "-" + System.currentTimeMillis());
		category.setSeo(result);
		categoryRepo.saveAndFlush(category);
		return ResponseEntity.ok(new AjaxRespone(200,"Thành công"));
	}
	@RequestMapping(value= {"/delete-category"},method=RequestMethod.POST)
	public ResponseEntity<AjaxRespone> deleteCategory(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,
			@RequestBody Category data){
		Integer id=data.getId();
		categoryRepo.deleteById(id);
		model.addAttribute("categories", categoryRepo.findAll());
		return ResponseEntity.ok(new AjaxRespone(200,"Thành công"));
	}
	
	@RequestMapping( value= {"/change-category"} ,method=RequestMethod.POST)
	public ResponseEntity<AjaxRespone> changeCategory(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,@RequestBody Category data){
		Category cate=categoryRepo.getOne(data.getId());
		cate.setName(data.getName());
		categoryRepo.saveAndFlush(cate);
		return ResponseEntity.ok(new AjaxRespone(200, "Thành công"));
	}
}
