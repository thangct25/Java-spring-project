package com.devpro.enities;

import java.math.BigDecimal;

public class CartItem {
	private int maSanPham;
	private String tenSanPham;
	private int soluong;
	private BigDecimal giaban;
	private String path;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getMaSanPham() {
		return maSanPham;
	}
	public void setMaSanPham(int maSanPham) {
		this.maSanPham = maSanPham;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public BigDecimal getGiaban() {
		return giaban;
	}
	public void setGiaban(BigDecimal giaban) {
		this.giaban = giaban;
	}
	
	
}
