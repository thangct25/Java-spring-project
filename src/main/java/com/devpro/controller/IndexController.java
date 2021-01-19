package com.devpro.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.enities.Category;
import com.devpro.enities.Contact;
import com.devpro.enities.Products;
import com.devpro.model.AjaxRespone;
import com.devpro.model.Email;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;
import com.devpro.services.CategoryService;
import com.devpro.services.ProductService;

/**
 * 
 * @author admin
 *
 */
@Controller // -> tạo ra 1 bean tên webConf và được spring-container quản lí.
			// -> báo module web mapping request cho controller này.
public class IndexController extends BaseController{
	/**
	 * 
	 * @param model: trung gian trao đổi thông tin giữa Controller và View(Jsp)
	 * @param request: Chứa các thông tin Trình Duyệt truy vấn thông qua mẫu: ?abc=xyz
	 * @param response: Dữ liệu trả về Trình Duyệt.
	 * @return
	 * @throws Exception
	 * 
	 */
	@PersistenceContext
	protected EntityManager entityManager;
	@Autowired
	private CategoryRepo categoryRepo;
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductRepo productRepo;

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		ProductSearch searchNoiThatGo=new ProductSearch();
		searchNoiThatGo.setCategoryId(1);
		model.addAttribute("noiThatGo", productService.search(searchNoiThatGo));
		String sql="SELECT * FROM (SELECT * FROM tbl_products ORDER BY id DESC LIMIT 5)Var1 ORDER BY id ASC;";
		model.addAttribute("newProduct", productService.searchByQuery(sql));
		model.addAttribute("listProduct", productService.searchByStatus());
		return "front-end/index";
	}
	
	@RequestMapping(value= {"/subcribe-email"},method=RequestMethod.POST)
	public ResponseEntity<AjaxRespone> saveWithAjax(final ModelMap model,final HttpServletRequest request,final HttpServletResponse response,@RequestBody Email email){
		Contact newContact=new Contact();
		return ResponseEntity.ok(new AjaxRespone(200,"Thành công"));
	}
	
}
