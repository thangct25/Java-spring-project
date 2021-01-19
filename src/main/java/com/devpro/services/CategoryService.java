package com.devpro.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devpro.enities.Category;
import com.devpro.enities.Products;
import com.devpro.repositories.CategoryRepo;
import com.github.slugify.Slugify;

@Service
public class CategoryService {
	
	@PersistenceContext
	protected EntityManager entityManager;
	
	@Autowired
	private CategoryRepo categoryRepo;
	
	public static HttpSession session;
	public static HttpServletRequest request;
	
	public List<Category> ListCategory(){
		String sql="select * from tbl_category";
		Query query = entityManager.createNativeQuery(sql, Category.class);
		return query.getResultList();
	}
	

	public String CreateChildMenu(Integer parentID,List<Category> listCategory) {
		
		List<Integer> idChildMenu=new ArrayList<Integer>();
		List<String> nameChildMenu=new ArrayList<String>();
		List<String> seoChildMenu=new ArrayList<String>();
		for (Category x : listCategory) {
			if(x.getParent_id() == parentID) {
				idChildMenu.add(x.getId());
				nameChildMenu.add(x.getName());
				seoChildMenu.add(x.getSeo());
			}
		}
		StringBuilder childMenu=new StringBuilder("");
		if(idChildMenu.size()>0) {
			childMenu.append("<ul>");
			for(int i=0;i<idChildMenu.size();i++) {
				childMenu.append("<li class=\"\">");
				childMenu.append(" <i class=\"fas fa-chevron-right\"></i>");
				childMenu.append("<a "+"" + " id=\""+idChildMenu.get(i) +"\" href=\"/category/"+seoChildMenu.get(i)+  "\">"+nameChildMenu.get(i)+"</a>");
				childMenu.append(CreateChildMenu(idChildMenu.get(i),listCategory));
				
			}
			childMenu.append("</ul>");
		}
		else {
			childMenu.append("</li>");
		}
		return childMenu.toString();
	}
	public String CreateMenu() {
		List<Category> listCategory=ListCategory();
		StringBuilder menu=new StringBuilder("");
		menu.append("<ul class=\"list-group list-group-left\">");
		for(Category x: listCategory) {
			if(x.getParent_id() == null) {
				menu.append("<li class=\"list-group-item  have-submenu\">");
				menu.append("<i class=\"fas fa-chevron-right\"></i>\r\n" + 
						"<a"+""+ " id=\""+x.getId() +"\" href=\"/category/"+x.getSeo()+  "\">"+x.getName()+"</a>");
				menu.append(CreateChildMenu(x.getId(),listCategory));
			}
		}
		menu.append("</ul>");
		return menu.toString();
	}
	
	
}
