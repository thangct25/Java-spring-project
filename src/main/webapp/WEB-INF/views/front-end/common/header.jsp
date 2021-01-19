<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div class="row mt-3 d-flex justify-content-between">
		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3 image-logo">
			<img
				src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/logo.png?1598934578760"
				alt="">
		</div>

		<div
			class="col-xl-6 col-lg-6 search-input d-flex flex-column justify-content-center">
			<form action="${pageContext.request.contextPath}/products"
									method="get">
									<div class="d-flex">
										<input type="text" name="search_input_box"
											id="search-input-text" placeholder="Tìm kiếm">
										<button id="search-input-btn" type="submit">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</form>
		</div>
		<div
			class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3 d-flex flex-column justify-content-center shop-contact-cart">
			<div class="d-flex justify-content-between shop-contact-info">
				<div class="d-flex flex-column text-center contact-number">
					<span
						style="font-size: smaller; display: inline-block; font-weight: bold;">LIÊN
						HỆ HOTLINE</span> <a style="color: red; font-weight: bold;">0909 090
						009</a>
				</div>
				<div class="d-flex flex-column text-center find-address">
					<span style="font-size: smaller; font-weight: bold;">TÌM ĐỊA
						CHỈ</span> <span style="color: red; font-weight: bold;">CỬA HÀNG</span>
				</div>
				<div class="cart">
										<a href="${pageContext.request.contextPath}/cart"
											style="color: black !important;"> <i
											class="fas fa-search" id="show-search-input"></i> <i
											class="fas fa-shopping-cart"></i> <span id="cart-count">(${cartSize })</span>
										</a>
									</div>
			</div>
		</div>
	</div>
</header>