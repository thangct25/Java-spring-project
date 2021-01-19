package com.devpro.model;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

public class ProductSearch {

	public static int SIZE_ITEMS_ON_PAGE = 9;

	private String seoProduct;
	private String seoCategoty;
	private String name;
	private Integer id;
	private Integer currentPage;
	private Integer categoryId;
	private BigDecimal minPrice;
	private BigDecimal maxPrice;

	public void parseRequest(final HttpServletRequest request) {
		Integer currentPage = null;

		String strPage = request.getParameter("page");
		if (strPage != null && !strPage.isEmpty()) {
			currentPage = Integer.parseInt(strPage);
		}

		this.setCurrentPage(currentPage);
	}

	public String getSeoProduct() {
		return seoProduct;
	}

	public void setSeoProduct(String seoProduct) {
		this.seoProduct = seoProduct;
	}

	public String getSeoCategoty() {
		return seoCategoty;
	}

	public void setSeoCategoty(String seoCategoty) {
		this.seoCategoty = seoCategoty;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public BigDecimal getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(BigDecimal minPrice) {
		this.minPrice = minPrice;
	}

	public BigDecimal getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(BigDecimal maxPrice) {
		this.maxPrice = maxPrice;
	}
	
}
