package com.devpro.model;

public class Product {
	public Integer id;
	public String namePro;
	public String description;
	public String category;
	public String expire_date;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNamePro() {
		return namePro;
	}
	public void setNamePro(String namePro) {
		this.namePro = namePro;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}
	
	@Override
	public String toString() {
		return "Product [nameProduct=" + namePro + ", description=" + description + ", category=" + category
				+ ", expire_date=" + expire_date + ", stock="   + "]";
	}
	
	
	
	
	
}
