package com.devpro.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.enities.SaleOrder;
import com.devpro.enities.Users;
import com.devpro.model.AjaxRespone;
import com.devpro.repositories.SaleOrderRepo;

@Controller
public class OrderBillController {
	
	@Autowired SaleOrderRepo saleOrderRepo;
	
	@RequestMapping(value= {"/your-order"}, method=RequestMethod.GET)
	public String bill(final HttpServletRequest request,final ModelMap model,final HttpServletResponse response) {
		Users user=(Users) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Integer id=user.getId();
		List<SaleOrder> listOrder=saleOrderRepo.findAll();
		List<SaleOrder> userOrdered=new ArrayList<SaleOrder>();
		for (SaleOrder saleOrder : listOrder) {
			if(saleOrder.getUser_id() == id) {
				userOrdered.add(saleOrder);
			}
		}
		Collections.sort(userOrdered, Comparator.comparing(SaleOrder::getStatus));
		model.addAttribute("bill", userOrdered);
		model.addAttribute("size", userOrdered.size());
		
		return "front-end/your-order";
	}
	@RequestMapping(value= {"/delete-order-item"}, method=RequestMethod.POST)
	public ResponseEntity<AjaxRespone> deleteOrder(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,@RequestBody SaleOrder data){
		Integer id=data.getId();
		saleOrderRepo.deleteById(id);
		return ResponseEntity.ok(new AjaxRespone(200,"Thành công"));
	}
}
