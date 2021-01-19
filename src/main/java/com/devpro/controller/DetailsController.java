
package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.enities.Cart;
import com.devpro.enities.Products;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.ProductService;

@Controller
public class DetailsController {
	
	@Autowired
	private ProductRepo productRepo;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = {"/details/{seo}"},method=RequestMethod.GET)
	public String detail(@PathVariable("seo") String seo,final ModelMap model,final HttpServletRequest request,final HttpServletResponse response)throws Exception {
		HttpSession httpSession = request.getSession();
		Cart cart = null;
		if (httpSession.getAttribute("GIO_HANG") != null) {
			cart = (Cart) httpSession.getAttribute("GIO_HANG");
			model.addAttribute("cartSize", cart.getCartList().size());
		} else {
			model.addAttribute("cartSize", 0);

		}
		ProductSearch productSearch=new ProductSearch();
		productSearch.setSeoProduct(seo);
		Products productSelected=productService.search(productSearch).get(0);
		model.addAttribute("product", productSelected);
		return "front-end/details";
	}
}
