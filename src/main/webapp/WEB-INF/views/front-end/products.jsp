<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.devpro.enities.Users"%>
<%@page
	import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/products.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/owlcarousel/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/owlcarousel/assets/owl.theme.default.min.css">
</head>

<body onload="load()">
<%!public String getEmailUserLogined() {
		String email = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			email = ((Users) principal).getEmail();
		}
		return email;
	}%>
	<%!public String getUserNameLogined(){
		String userName="";
		Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			userName = ((Users) principal).getUsername();
		}
		return userName;
	}%>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body alert-success">Thêm Vào Giỏ Hàng Thành Công</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="wrapper">
		<button onclick="topFunction()" id="myBtn" title="Go to top">
			<i class="fas fa-angle-up"></i>
		</button>
		<div class="position-fixed filter-btn"
			style="right: 0%; top: 50%; z-index: 1;">
			<i style="background: #f68e2e; color: white;"
				class="fa fa-filter p-3" aria-hidden="true"></i>
		</div>

		<div class="container-fluid main">

			<div class="row login-register">
				<div class="col-xl-1 col-lg-0"></div>
				<div
					class="col-xl-5 col-lg-6 slogan font-weight-bold text-white pl-3">
					<span>SIÊU THỊ NỘI THẤT & TRANG TRÍ EVO NỘI THẤT</span>
				</div>
				<div
					class="col-xl-5 col-lg-6 btn-login-register text-right text-white font-weight-bold pr-3">
					<sec:authorize access="hasAuthority('guest')">
						<span>&nbsp;<a 
						class="text-white"
						href="${pageContext.request.contextPath}/your-order"><%= getUserNameLogined() %></a></span>
					</sec:authorize>
					<sec:authorize access="hasAuthority('ADMIN')">
						<span>&nbsp;<a
						class="text-white"
						href="${pageContext.request.contextPath}/admin"><%= getUserNameLogined() %></a></span>
					</sec:authorize>
					<% if(getEmailUserLogined().isEmpty()) { %>
					<span class="border-right"><i class="fas fa-sign-in-alt">&nbsp;</i><a id="loginStatus"
						class="text-white" href="${pageContext.request.contextPath}/login">ĐĂNG NHẬP</a>&nbsp;</span>
					<% } else { %>
					<span class=""><i class="fas fa-sign-in-alt">&nbsp;</i><a
						class="text-white" href="${pageContext.request.contextPath}/logout">ĐĂNG
							XUẤT</a>&nbsp;</span>
					<% } %>
					 
					<div>
						
					</div>
				</div>
				<div class="col-xl-1 col-lg-0"></div>
			</div>
			<div class="row">

				<div
					class="col-xl-10 col-lg-12 col-md-12 col-sm-12 m-auto content pl-3 pr-3">
					<header>
						<div class="row mt-3 d-flex justify-content-between">
							<div
								class=" col-xl-0 col-lg-0 col-sm-3 col-3 hidden d-flex flex-column justify-content-center">
								<div>
									<i id="btn-show-menu" class="fas fa-bars"></i>
								</div>
							</div>
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
											HỆ HOTLINE</span> <a style="color: red; font-weight: bold;">0909
											090 009</a>
									</div>
									<div class="d-flex flex-column text-center find-address">
										<span style="font-size: smaller; font-weight: bold;">TÌM
											ĐỊA CHỈ</span> <span style="color: red; font-weight: bold;">CỬA
											HÀNG</span>
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
					<!-- content -->
					<div class="row mt-5">
						<div class="col-xl-12 col-lg-12 mb-5"
							style="border-bottom: 1px solid #ebebeb;">
							<ul class="menu-type-right">
								<li><span><a
										href="${pageContext.request.contextPath}/">TRANG CHỦ</a></span></li>
								<li><span><a href="">GIỚI THIỆU</a></span></li>
								<li><span><a href="${pageContext.request.contextPath}/products?page=1">SẢN PHẨM</a></span></li>
								<li><span><a href="">HÀNG GIỚI THIỆU</a></span></li>
								<li><span><a href="">TIN TỨC</a></span></li>
								<li><span><a href="">LIÊN HỆ</a></span></li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-3 col-lg-4 col-md-0">
							<div class="all-product-type">
								<a href="${pageContext.request.contextPath}/products?page=1">
									<h6
										style="background-color: orange; padding: 10px !important; color: white; min-width: 100%; display: flex; justify-content: space-between;">
										<i class="fas fa-bars"></i> &nbsp;TẤT CẢ SẢN PHẨM&nbsp; <i
											class="fas fa-chevron-down"></i>
									</h6>
								</a>
							</div>
							${menu}
						</div>
						<div class="col-xl-9 col-lg-8 col-md-12">
							<div class="image-slider">
								<img
									src="https://bizweb.dktcdn.net/thumb/grande/100/360/933/themes/728303/assets/slider_1.jpg?1598934578760"
									alt="" width="100%">
							</div>
						</div>
					</div>
					<!-- type -->
					<div class="row mt-5 new-products owl-carousel owl-theme"
						style="z-index: 0;">
						<div class="item new-product">
							<div class="infor position-relative">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/collections/desk.png?v=1563503909427"
									alt="" width="100%" style="max-width: 100%;">
								<div class="text-center p-3 d-flex flex-column ">
									<a href="">Đồ dùng văn phòng</a>

								</div>
							</div>
						</div>
						<div class="item new-product">

							<div class="infor position-relative">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/collections/work-station-1.png?v=1563504595533"
									alt="" width="100%" style="max-width: 100%;">
								<div class="text-center p-3 d-flex flex-column">
									<a href="">Vật dụng trang trí</a>
								</div>
							</div>
						</div>
						<div class="item new-product">

							<div class="infor position-relative">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/collections/stove.png?v=1563504619867"
									alt="" width="100%" style="max-width: 100%;">
								<div class="text-center p-3 d-flex flex-column">
									<a href="">Bàn ăn</a>

								</div>
							</div>
						</div>
						<div class="item new-product">

							<div class="infor position-relative">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/collections/dinner-table.png?v=1563504581907"
									alt="" width="100%" style="max-width: 100%;">
								<div class="text-center p-3 d-flex flex-column">
									<a href="">Bàn trang điểm</a>

								</div>
							</div>
						</div>
						<div class="item new-product">

							<div class="infor position-relative">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/collections/curtains.png?v=1563504566117"
									alt="" width="100%" style="max-width: 100%;">
								<div class="text-center p-3 d-flex flex-column ">
									<a href="">Dụng cụ nhà bếp</a>

								</div>
							</div>
						</div>
						<div class="item new-product">

							<div class="infor position-relative">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/collections/sofa.png?v=1563504493503"
									alt="" width="100%" style="max-width: 100%;">
								<div class="text-center p-3 d-flex flex-column">
									<a href="">Dụng cụ nhà bếp</a>

								</div>
							</div>
						</div>
						<div class="item new-product">

							<div class="infor position-relative">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/collections/sofa.png?v=1563504493503"
									alt="" width="100%" style="max-width: 100%;">
								<div class="text-center p-3 d-flex flex-column">
									<a href="">Dụng cụ nhà bếp</a>
								</div>
							</div>
						</div>
					</div>

					<!-- content -->
					<div class="row mt-5">
						<div class="col-xl-3 col-lg-3 categories-left">
							<div class="filter-by p-3 mt-5">
								<div class="filter-title pb-2 mb-2"
									style="border-bottom: 1px solid #ebebeb;">
									<h4>TÌM THEO</h4>
								</div>
								<div class="filter-by-price d-flex flex-column">
									<p>GIÁ SẢN PHẨM</p>
									<div class="input-group mb-3">
										<input type="number" class="form-control" id="min"
											aria-label="Amount (to the nearest dollar)" placeholder=" Giá nhỏ nhất">
									</div>

									<div class="input-group">
										<input type="number" class="form-control" id="max"
											aria-label="Amount (to the nearest dollar)" placeholder=" Giá cao nhất">
									</div>
									<button type="button" class="btn btn-primary mt-3" onclick="searchPrice();">Tìm Kiếm</button>
								</div>
							</div>
							<div class="filter-by mt-3 p-3">
								<div
									style="border-bottom: 1px solid #ebebeb; margin-bottom: 20px !important;">
									<b>KHUYẾN MÃI</b>
								</div>
								<img
									src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/aside_banner.jpg?1598934578760"
									alt="" style="max-width: 100%;">
							</div>
						</div>
						<div class="col-xl-9 col-lg-9 col-sm-12 p-3">
							<div class="d-flex filter-by-price pb-2">
								<b>Xếp theo : &nbsp;</b> <select id="sort"
									onchange="sortFunction();">
									<option value="selected">Chọn</option>
									<option value="asc">Từ A-Z</option>
									<option value="des">Từ Z-A</option>
									<option value="up">Giá Tăng Dần</option>
									<option value="down">Giá giảm dần</option>
								</select>
							</div>
							<div class="d-flex flex-wrap">
								<c:forEach items="${listProduct}" var="product">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
										<div class="item new-product">
											<div class="infor position-relative">
												<c:choose>
													<c:when test="${empty product.productImages }">
														<img
															src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/giuong-ngu-go-chat-luong-cao-cho-gia-dinh-ghs-9071-ava.jpg?v=1565273414883"
															alt="" width="100%"
															style="max-width: 100%; height: 300px">
													</c:when>
													<c:otherwise>
														<img class="card-img-top"
															src="${pageContext.request.contextPath}/file/upload/${product.productImages.get(0).path }"
															alt="" style="max-width: 100%; height: 300px">
													</c:otherwise>
												</c:choose>

												<div
													class="text-center p-3 d-flex flex-column  justify-content-between new-product-detail all-products">
													<a href="" style="color: #b2b2b2;">Evo Nội thất</a> <a
														href="${pageContext.request.contextPath}/details/${product.seo}"
														style="font-weight: bold">${product.title}</a> <a
														style="font-weight: bold;"><fmt:formatNumber
															type="currency" currencySymbol="" pattern="###,###,###">
                                    ${product.price } 
                                    </fmt:formatNumber> đ</a>
													<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"
														onclick="Buy.buyCart(${product.id},1);">Mua Hàng</button>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>

							</div>
							<!-- type -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center align-items-center">

									<c:forEach begin="1" end="${pageCount+1 }" var="page">
										<li class="page-item">
										  <c:choose>
												<c:when test="${param.page eq page}">
													<a class="page-link actived" onclick="changePage(${page});">${page}</a>
												</c:when>
												<c:otherwise>
													<a class="page-link" onclick="changePage(${page});">${page}</a>
												</c:otherwise>
											</c:choose></li>
									</c:forEach>
								</ul>
							</nav>
						</div>

					</div>
					<!-- footer -->
					<!-- footer -->
				</div>

			</div>
			<div class="row mt-5 footer-categories">
				<div class="col-xl-10 col-lg-12 col-md-12 col-sm-12 m-auto">
					<div class="row p-5">
						<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
							<h4>VỀ CHÚNG TÔI</h4>
							<ul>
								<li><a href="">Trang chủ</a></li>
								<li><a href="">Giới thiệu</a></li>
								<li><a href="">Sản phẩm</a></li>
								<li><a href="">Hàng mới về</a></li>
								<li><a href="">Tin tức</a></li>
								<li><a href="">Liên hệ</a></li>
							</ul>
						</div>
						<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
							<h4>HỖ TRỢ KHÁCH HÀNG</h4>
							<ul>
								<li><a href="">Trang chủ</a></li>
								<li><a href="">Giới thiệu</a></li>
								<li><a href="">Sản phẩm</a></li>
								<li><a href="">Hàng mới về</a></li>
								<li><a href="">Tin tức</a></li>
								<li><a href="">Liên hệ</a></li>
							</ul>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12 contact-with-us">
							<h4>LIÊN HỆ VỚI CHÚNG TÔI</h4>
							<ul>
								<li>
									<div>
										<span>Địa chỉ</span>
										<p>30 Đường 2/9, Phường Bình Hiên, Quận Hải Châu, Đà Nẵng</p>
									</div>
								</li>
								<li>
									<div>
										<span>Hotline</span>
										<p>090 909 000</p>
									</div>
								</li>
								<li>
									<div>
										<span>Email</span>
										<p>evoteamthemes@gmail.com</p>
									</div>
								</li>

							</ul>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12 submit-email">
							<h4>ĐĂNG KÝ NHẬN BẢN TIN</h4>
							<div class="form-group mt-3 d-flex">
								<input type="email" class="form-control p-2 w-75"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Email của bạn">
								<!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
								<button type="submit" class="btn w-25"
									style="background: #f68e2e; color: white; padding: 0px 20px !important; border-radius: 0 !important; border: 1px solid;">
									<i class="fa fa-paper-plane" aria-hidden="true"></i>
								</button>
							</div>
							<p class="mt-4">Bạn là khách hàng mới. Đăng ký email và nhận
								mã giảm giá 50.000 đ.</p>
							<div class="row d-fex justify-content-between mt-4">
								<div class="col-3">
									<img
										src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/bct.png?1598934578760"
										alt="" style="max-width: 100%;">
								</div>
								<div class="col-3">
									<img
										src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/bct.png?1598934578760"
										alt="" style="max-width: 100%;">
								</div>
								<div class="col-3 ">
									<img
										src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/bct.png?1598934578760"
										alt="" style="max-width: 100%;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/js/shop.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/owlcarousel/owl.carousel.min.js"></script>

<script src="${pageContext.request.contextPath}/js/index.js"></script>

<script src="${pageContext.request.contextPath}/js/product.js"></script>
</html>