package com.devpro.enities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Cart {
	
	private List<CartItem> cartList=new	ArrayList<CartItem>();
	private BigDecimal totalCount=BigDecimal.ZERO;
	

	public BigDecimal getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(BigDecimal totalCount) {
		this.totalCount = totalCount;
	}

	public List<CartItem> getCartList() {
		return cartList;
	}

	public void setCartList(List<CartItem> cartList) {
		this.cartList = cartList;
	}
	public BigDecimal TotalCount() {
		BigDecimal total=BigDecimal.ZERO;
		for (CartItem cartItem : cartList) {
			total.add(cartItem.getGiaban().multiply(new BigDecimal(cartItem.getSoluong())));
		}
		return total;
	}
	
}
