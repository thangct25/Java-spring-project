package com.devpro.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.devpro.enities.Cart;
import com.devpro.enities.CartItem;
import com.devpro.enities.Products;
import com.devpro.enities.SaleOrder;
import com.devpro.enities.SaleOrderProducts;
import com.devpro.enities.Users;
import com.devpro.model.AjaxRespone;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;

@Controller
public class CartController extends BaseController{
	BigDecimal total=BigDecimal.ZERO;
	@Autowired
	private SaleOrderRepo saleOrderRepo;
	
	
	@RequestMapping(value= {"/cart"},method=RequestMethod.GET)
	public String cart(final ModelMap model,final HttpServletRequest request,final HttpServletResponse respone) {
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("GIO_HANG") == null) {
			model.addAttribute("size" ,0);
		}
		return "front-end/cart";
	}
	
	
	@Autowired 
	private ProductRepo productRepo;
	
	@RequestMapping(value = { "/buy-cart" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxRespone> muaHang(@RequestBody CartItem cartItem,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
			HttpSession httpSession = request.getSession();
			
			Cart cart = null;

			// kiểm tra xem SESSION đã có gio hàng chưa ?
			// nếu chưa có thì tạo mới 1 giỏ hàng và lưu vào SESSION.
			if (httpSession.getAttribute("GIO_HANG") != null) {
				cart = (Cart) httpSession.getAttribute("GIO_HANG");
			} else {
				cart = new Cart();
				httpSession.setAttribute("GIO_HANG", cart);
			}
			
			List<CartItem> cartList = cart.getCartList();
			
			boolean isExistProduct = false;
			
			// trường hợp đã có sản phẩm trong giỏ hàng.
			for(CartItem item : cartList) {
				if(item.getMaSanPham() == cartItem.getMaSanPham()) {
					isExistProduct = true;
					item.setSoluong(item.getSoluong() + cartItem.getSoluong());
					cart.setTotalCount(cart.getTotalCount().add(item.getGiaban().multiply(new BigDecimal(cartItem.getSoluong()))));
				}
			}
			
			// nếu sản phẩm chưa có trong giỏ hàng.
			if(!isExistProduct) {
				
				Products product = productRepo.getOne(cartItem.getMaSanPham());
				cartItem.setTenSanPham(product.getTitle());
				cartItem.setGiaban(product.getPrice());
				cartItem.setPath(product.getProductImages().get(0).getPath());
				cartList.add(cartItem);
				cart.setTotalCount(cart.getTotalCount().add(cartItem.getGiaban().multiply(new BigDecimal(cartItem.getSoluong()))));
			}
			return ResponseEntity.ok(new AjaxRespone(200, String.valueOf(cart.getCartList().size())));		
	}
	
//	lưu đơn hàng
	@RequestMapping(value = { "/save-your-order" }, method = RequestMethod.POST)
	public String saveOrder(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		
		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();
		
		Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");;
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Users user=(Users)principal;
		
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		saleOrder.setCreatedDate(LocalDateTime.now());
		saleOrder.setCustomer_name(name);
		saleOrder.setCustomer_address(address);
		saleOrder.setUser_id(user.getId());
		saleOrder.setTotal(cart.getTotalCount());
		saleOrder.setCreatedDate(LocalDateTime.now());
		
		for(CartItem item : cart.getCartList()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productRepo.getOne(item.getMaSanPham()));
			saleOrderProducts.setQuality(item.getSoluong());
			saleOrderProducts.setCreatedDate(LocalDateTime.now());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}
		
		saleOrderRepo.save(saleOrder);
		
		// lưu xong xoá giỏ hàng đi
		httpSession.removeAttribute("GIO_HANG");
		return "redirect:/your-order";
		
	}
	@RequestMapping(value= {"/delete-cart-item"},method=RequestMethod.POST)
	public ResponseEntity<AjaxRespone> xoaHang(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,@RequestBody CartItem data){
		HttpSession httpSession = request.getSession();		
		Cart cart=(Cart) httpSession.getAttribute("GIO_HANG");
		Integer id=data.getMaSanPham();
		for(CartItem c : cart.getCartList()) {
			if(c.getMaSanPham() == id) {
				cart.setTotalCount(cart.getTotalCount().subtract(c.getGiaban().multiply(new BigDecimal(c.getSoluong()))));
			}
		}
		cart.getCartList().removeIf(c-> c.getMaSanPham()==id);
		
		httpSession.setAttribute("GIO_HANG", cart);
		return ResponseEntity.ok(new AjaxRespone(200, "Thành Công"));
		
	}
	
}
