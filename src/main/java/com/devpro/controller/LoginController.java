package com.devpro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	@RequestMapping(value = {"/login"},method=RequestMethod.GET)
	public String login(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response)throws Exception {
		return "front-end/login";
	}
}
