package com.devpro.controller.admin;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.controller.BaseController;
import com.devpro.enities.Products;
import com.devpro.enities.SaleOrder;
import com.devpro.model.AjaxRespone;
import com.devpro.repositories.SaleOrderRepo;

@Controller
public class BillController extends BaseController{
	
	@Autowired
	private SaleOrderRepo saleOrderRepo;
	
	@RequestMapping(value= {"/admin/bill"},method=RequestMethod.GET)
	public String billIndex(final ModelMap model,final HttpServletRequest request,HttpServletResponse response) {
		List<SaleOrder> listSaleOrder=saleOrderRepo.findAll();
		Collections.sort(listSaleOrder, Comparator.comparing(SaleOrder::getStatus));
		model.addAttribute("bills",listSaleOrder);
		return "back-end/BillManage";
	}
	@RequestMapping(value= {"/accept-order"},method=RequestMethod.POST)
	public ResponseEntity<AjaxRespone> acceptOrder(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,
			@RequestBody SaleOrder data){
		SaleOrder saleOrder=saleOrderRepo.getOne(data.getId());
		saleOrder.setStatus(true);
		saleOrderRepo.saveAndFlush(saleOrder);
		return ResponseEntity.ok(new AjaxRespone(200,"Thành công"));
	}
	@RequestMapping(value= {"/delete-order"},method=RequestMethod.POST)
	public ResponseEntity<AjaxRespone> deleteOrder(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,
			@RequestBody SaleOrder data){
		saleOrderRepo.deleteById(data.getId());
		return ResponseEntity.ok(new AjaxRespone(200,"Thành công"));
	}
}
