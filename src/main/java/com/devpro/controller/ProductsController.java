package com.devpro.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devpro.enities.Cart;
import com.devpro.enities.Products;
import com.devpro.model.AjaxRespone;
import com.devpro.model.Email;
import com.devpro.model.Product;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.CategoryService;
import com.devpro.services.ProductService;

@Controller
public class ProductsController extends BaseController {

	@Autowired
	private CategoryRepo categoryRepo;

	@Autowired
	private ProductRepo productRepo;

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	

	@RequestMapping(value = { "/products" }, method = RequestMethod.GET)
	public String products(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		List<Products> all = productService.searchByStatus();
		model.addAttribute("listProduct", all);
		HttpSession httpSession = request.getSession();
		Cart cart = null;
		model.addAttribute("menu", categoryService.CreateMenu());
		// kiểm tra xem SESSION đã có gio hàng chưa ?
		// nếu chưa có thì tạo mới 1 giỏ hàng và lưu vào SESSION.
		if (httpSession.getAttribute("GIO_HANG") != null) {
			cart = (Cart) httpSession.getAttribute("GIO_HANG");
			model.addAttribute("cartSize", cart.getCartList().size());
		} else {
			model.addAttribute("cartSize", 0);

		}
		ProductSearch productSearch = new ProductSearch();
		Integer currentPage = 0;
		String strCurrentPage = request.getParameter("page");
		if (strCurrentPage != null) {
			currentPage = Integer.parseInt(strCurrentPage);
		}
		productSearch.setCurrentPage(currentPage);
		String searchInput = request.getParameter("search_input_box");
		if (searchInput != null)
			productSearch.setName(searchInput);
		String minPrice=request.getParameter("min");
		String maxPrice=request.getParameter("max");
		if(minPrice != null && maxPrice != null) {

			BigDecimal min=new BigDecimal(minPrice);
			BigDecimal max=new BigDecimal(maxPrice);
			productSearch.setMinPrice(min);
			productSearch.setMaxPrice(max);
		}
		ArrayList<Products> result = (ArrayList<Products>) productService.search(productSearch);
		if (request.getParameter("sort") != null) {
			
			String sortType = request.getParameter("sort");
			switch (sortType) {
			case "asc":
				Collections.sort(result, Comparator.comparing(Products::getTitle));
				break;
			case "des":
				Collections.sort(result, Collections.reverseOrder(Comparator.comparing(Products::getTitle)));
				break;
			case "up":
				Collections.sort(result, Comparator.comparing(Products::getPrice));
				break;
			case "down":
				Collections.sort(result, Collections.reverseOrder(Comparator.comparing(Products::getPrice)));
				break;
			default:
				break;
			}
			
		}
		
			model.addAttribute("listProduct", result);


		if (searchInput != null && result.size() != 0) {
			model.addAttribute("pageCount", 0);
		} else
			model.addAttribute("pageCount", all.size() / productSearch.SIZE_ITEMS_ON_PAGE);
		return "front-end/products";
	}

	@RequestMapping(value = { "/category/{seo}" }, method = RequestMethod.GET)
	public String searchByCategory(@PathVariable("seo") String seo, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {

		ProductSearch productSearch = new ProductSearch();
		productSearch.setSeoCategoty(seo);
		String minPrice=request.getParameter("min");
		String maxPrice=request.getParameter("max");
		if(minPrice != null && maxPrice != null) {

			BigDecimal min=new BigDecimal(minPrice);
			BigDecimal max=new BigDecimal(maxPrice);
			productSearch.setMinPrice(min);
			productSearch.setMaxPrice(max);
		}
		List<Products> products = productService.search(productSearch);
		if (request.getParameter("sort") != null) {
			String sortType = request.getParameter("sort");
			switch (sortType) {
			case "asc":
				Collections.sort(products, Comparator.comparing(Products::getTitle));
				break;
			case "des":
				Collections.sort(products, Collections.reverseOrder(Comparator.comparing(Products::getTitle)));
				break;
			case "up":
				Collections.sort(products, Comparator.comparing(Products::getPrice));
				break;
			case "down":
				Collections.sort(products, Collections.reverseOrder(Comparator.comparing(Products::getPrice)));
				break;
			default:
				break;
			}
		}
		
		model.addAttribute("listProduct", products);
		model.addAttribute("pageCount", products.size() / productSearch.SIZE_ITEMS_ON_PAGE);
		HttpSession session = request.getSession();
		session.setAttribute("currentSeo", seo);
		return "front-end/products";
	}

}
