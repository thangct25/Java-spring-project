package com.devpro.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.enities.Category;
import com.devpro.enities.Products;
import com.devpro.model.Product;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.CategoryService;
import com.devpro.services.ProductService;

@Controller
public class AdminController {

	@Autowired
private ProductService productService;
	
	@Autowired
	private ProductRepo productRepo;
	
	@Autowired
	private CategoryRepo categoryRepo;
	
	@Autowired 
	private CategoryService categoryServices;
	
	
	@RequestMapping(value = { "/admin/product/list" }, method = RequestMethod.GET)
	public String list(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("products", productService.searchByStatus());
		model.addAttribute("categories",categoryRepo.findAll());
		model.addAttribute("categoryBeChanged", new Category());
		return "back-end/manage-product";
	}
		
	@RequestMapping(value= {"/admin"},method=RequestMethod.GET)
	public String admin(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response) {
		return "back-end/admin";
	}
	
	@RequestMapping(value = { "/accessDenied" }, method = RequestMethod.GET)
	public String accessDenied(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		return "back-end/accessDenied";
	}

	

}
