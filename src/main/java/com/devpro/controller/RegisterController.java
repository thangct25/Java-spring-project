package com.devpro.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.enities.Roles;
import com.devpro.enities.Users;
import com.devpro.repositories.RoleRepo;
import com.devpro.repositories.UserRepo;

@Controller
public class RegisterController {
	
	@Autowired UserRepo userRepo;
	@Autowired RoleRepo roleRepo;
	public boolean checkExists(String username,String email,String sdt) {
		List<Users> userList=userRepo.findAll();
		for (Users users : userList) {
			if(users.getUsername().equals(username) || users.getEmail().equals(email) || (users.getSdt() != null && users.getSdt().equals(sdt))) {
				return false;
			}
		}
		return true;
	}
	
	@RequestMapping(value= {"/register"},method=RequestMethod.POST)
	public String register(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,@ModelAttribute("user") Users user) {
			
		  System.out.println(user.getUsername());
		  System.out.println(user.getEmail());
		  System.out.println(user.getSdt());
		  if(!checkExists(user.getUsername(), user.getEmail(),user.getSdt())) { 
			  return "redirect:/register?isFail=true"; 
			  } 
		  else {
		 
			user.setStatus(true);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(8);
			String pass=encoder.encode(user.getPassword());
			user.setPassword(pass);
			List<Roles> role=roleRepo.findAll();
			List<Roles> addRole=new ArrayList<>();
			addRole.add(role.get(1));
			user.setRoles(addRole);
			userRepo.saveAndFlush(user);
			return "redirect:/login";
		}
		
	}
	
}
