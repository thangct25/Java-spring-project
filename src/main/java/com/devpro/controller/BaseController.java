package com.devpro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.enities.Cart;
import com.devpro.enities.Category;
import com.devpro.repositories.CategoryRepo;
import com.devpro.services.CategoryService;

public abstract class BaseController {
	@Autowired
	CategoryService categoryService;

	@ModelAttribute("menu")
	public String getCategories() {
		return categoryService.CreateMenu();
	}
	@ModelAttribute("cartSize")
	public int getCartSize(final HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession();
		
		Cart cart = null;

		// kiểm tra xem SESSION đã có gio hàng chưa ?
		// nếu chưa có thì tạo mới 1 giỏ hàng và lưu vào SESSION.
		if (httpSession.getAttribute("GIO_HANG") != null) {
			cart = (Cart) httpSession.getAttribute("GIO_HANG");
			return cart.getCartList().size();
		} else {
			return 0;
			
		}
	}
}
