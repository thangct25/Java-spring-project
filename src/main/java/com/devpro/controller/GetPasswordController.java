package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GetPasswordController {
	@RequestMapping(value= {"/get-password"},method=RequestMethod.GET)
	public String get_password(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response) {
		return "front-end/get-password";
	}
}
