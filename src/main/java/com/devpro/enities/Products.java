package com.devpro.enities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_products")
public class Products extends BaseEnity{
	@Column(name = "avatar", nullable = true)
	private String avatar;
	@Lob
	@Column(name="detail_description",nullable=false,columnDefinition = "LONGTEXT")
	private String detail_description;
	@Column(name="price",nullable=true)
	private BigDecimal price;
	@Column(name="seo",nullable=false)
	private String seo;
	@Column(name="short_description",nullable=true,columnDefinition = "LONGTEXT")
	private String short_description;
	@Column(name="title",length = 500,nullable=false)
	private String title;
	@Column(name="oldPrice",nullable = true)
	private BigDecimal oldPrice;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="category_id")
	private Category category;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.EAGER, orphanRemoval = true)
	private List<Products_images> productImages = new ArrayList<Products_images>();

	
	public void addProductImages(Products_images _productImages) {
		_productImages.setProduct(this);
		productImages.add(_productImages);
	}
	
	public void removeProductImages(Products_images _productImages) {
		_productImages.setProduct(null);
		productImages.remove(_productImages);
	}

	public void removeProductImages() {
		for(Products_images productImages : productImages) {
			removeProductImages(productImages);
		}
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getDetail_description() {
		return detail_description;
	}
	public void setDetail_description(String detail_description) {
		this.detail_description = detail_description;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getSeo() {
		return seo;
	}
	public void setSeo(String seo) {
		this.seo = seo;
	}
	public String getShort_description() {
		return short_description;
	}
	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public List<Products_images> getProductImages() {
		return productImages;
	}

	public void setProductImages(List<Products_images> productImages) {
		this.productImages = productImages;
	}

	public BigDecimal getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(BigDecimal oldPrice) {
		this.oldPrice = oldPrice;
	}

	
}
