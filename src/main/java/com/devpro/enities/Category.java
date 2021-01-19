package com.devpro.enities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_category")
public class Category extends BaseEnity{
	@Column(name = "description", nullable = false)
	private String description;
	@Column(name = "parent_id", nullable = true)
	private Integer parent_id;
	@Column(name = "seo", nullable = true)
	private String seo;
	@Column(name = "name", nullable = false)
	private String name;
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "category",fetch = FetchType.LAZY)
	private List<Products> products=new ArrayList<Products>();
	public void addProduct(Products product) {
		products.add(product);
		product.setCategory(this);
	}
	
	public void removeProduct(Products product) {
		products.remove(product);
		product.setCategory(null);
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getParent_id() {
		return parent_id;
	}


	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public List<Products> getProducts() {
		return products;
	}

	public void setProducts(List<Products> products) {
		this.products = products;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	
}
