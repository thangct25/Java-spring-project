package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.enities.Users;
import com.devpro.model.AjaxRespone;
import com.devpro.model.Contact;
import com.devpro.model.Email;

@Controller
public class ContactController {
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("user",new Users());
		return "front-end/register";
	}
	
//	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
//	public String saveContact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,@ModelAttribute("contact") Contact contact)
//			throws Exception {
//		
//		String firstname = contact.getFirstName();
//		String lastname = contact.getLastName();
//		model.addAttribute("contact",new Contact());
//		System.out.println(firstname + " " + lastname);
//		
//		return "redirect:/login";
//	}
	

}
