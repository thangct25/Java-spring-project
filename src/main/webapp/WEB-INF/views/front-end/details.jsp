<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.devpro.enities.Users"%>
<%@page
	import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
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
<title>Chi Tiết</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/detail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/owlcarousel/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/owlcarousel/assets/owl.theme.default.min.css">
</head>

<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="E3H2b2tv"></script>
	<%!public String getEmailUserLogined() {
		String email = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			email = ((Users) principal).getEmail();
		}
		return email;
	}%>
	<%!public String getUserNameLogined() {
		String userName = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			userName = ((Users) principal).getUsername();
		}
		return userName;
	}%>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Cảm ơn</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Email của bạn đã được ghi lại</div>
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
		<div class="container-fluid main">
			<div class="row login-register">
				<div class="col-xl-1 col-lg-0"></div>
				<div
					class="col-xl-5 col-lg-6 slogan font-weight-bold text-white pl-3">
					<span>SIÊU THỊ NỘI THẤT & TRANG TRÍ EVO NỘI THẤT</span>
				</div>
				<div class="col-xl-5 col-lg-6 btn-login-register text-right text-white
				font-weight-bold pr-3">
				<sec:authorize access="hasAuthority('guest')">
					<span>&nbsp;<a class="text-white"
						href="${pageContext.request.contextPath}/your-order"><%=getUserNameLogined()%></a></span>
				</sec:authorize>
				<sec:authorize access="hasAuthority('ADMIN')">
					<span>&nbsp;<a class="text-white"
						href="${pageContext.request.contextPath}/admin"><%=getUserNameLogined()%></a></span>
				</sec:authorize>
				<%
					if (getEmailUserLogined().isEmpty()) {
				%>
				<span class="border-right"><i class="fas fa-sign-in-alt">&nbsp;</i><a
					id="loginStatus" class="text-white"
					href="${pageContext.request.contextPath}/login">ĐĂNG NHẬP</a>&nbsp;</span>
				<%
					} else {
				%>
				<span class=""><i class="fas fa-sign-in-alt">&nbsp;</i><a
					class="text-white" href="${pageContext.request.contextPath}/logout">ĐĂNG
						XUẤT</a>&nbsp;</span>
				<%
					}
				%>

				<div></div>
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
							<form action="">
								<div class="d-flex">
									<input type="text" name="search-input-box"
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
										style="color: black !important;"> <i class="fas fa-search"
										id="show-search-input"></i> <i class="fas fa-shopping-cart"></i>
										<span id="cart-count">(${cartSize })</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</header>
				<!-- content -->
				<div class="row mt-5">
					<div class="col-xl-3 col-lg-4 all-product-type">
						<h6
							style="background-color: orange; padding: 10px !important; color: white;">
							<i class="fas fa-bars"></i> &nbsp;TẤT CẢ SẢN PHẨM&nbsp; <i
								class="fas fa-chevron-down"></i>
						</h6>
					</div>
					<div class="col-xl-9 col-lg-8">
						<ul class="menu-type-right">
							<li><span><a href="${pageContext.request.contextPath}/">TRANG CHỦ</a></span></li>
							<li><span><a href="">GIỚI THIỆU</a></span></li>
							<li><span><a href="${pageContext.request.contextPath}/products?page=1">SẢN PHẨM</a></span></li>
							<li><span><a href="">HÀNG GIỚI THIỆU</a></span></li>
							<li><span><a href="">TIN TỨC</a></span></li>
							<li><span><a href="">LIÊN HỆ</a></span></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 pt-3">
						<div class=""
							style="border-bottom: 1px solid #ebebeb; padding-bottom: 20px !important;">
							<a style="color: black;" href="">Trang chủ ></a> <a href=""
								style="color: black;">Tất cả sản phẩm ></a> <a href=""
								style="color: #f68e2e;">${product.title }</a>
						</div>
						<div class="pt-5"
							style="border-bottom: 1px solid #ebebeb; padding-bottom: 20px !important;">
							<h4>
								<b>${product.title }</b>
							</h4>
							<div class="d-flex">
								<div
									style="border-right: 1px solid red; height: 16px; width: fit-content; line-height: 16px; margin: 8px !important; padding-right: 8px !important; margin-left: 0 !important;">
									<span>SKU:</span> <span style="color: #f68e2e;">4367</span>
								</div>
								<div style="line-height: 16px; margin: 8px !important;">
									<span>Thương hiệu:</span> <span style="color: #f68e2e;">Evo
										Nội thất</span>
								</div>
							</div>
						</div>
						<div class="row p-4" style="height: fit-content;">
							<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12">
								<img
									src="${pageContext.request.contextPath}/file/upload/${product.productImages.get(0).path }"
									alt="" width="100%" style="max-width: 100%" height="100%">

							</div>

							<div
								class="col-xl-7 col-lg-7 col-md-12 col-sm-12 pl-5 all-product-infor">

								<div class="product-infor"
									style="display: flex; flex-direction: column; justify-content: space-around;">
									<span class="product-price d-inline-block"
										style="font-size: 24px; color: red; font-weight: bold;"><fmt:formatNumber
											type="currency" currencySymbol="" pattern="###,###,###">
                                    ${product.price } 
                                    </fmt:formatNumber> ₫</span>
									<div style="font-weight: bolder;">
										<span>Tình trạng: </span><span style="color: #f68e2e;">Còn
											hàng</span> <span id="idProduct" style="display: none !important;">${product.id }</span>
									</div>
									<div class="d-flex pt-4">
										<b
											style="padding-top: 10px !important; padding-right: 15px !important;">Số
											lượng :</b>
										<div class="border product-number">
											<input type="number" class="form-control" id="quality"
												aria-describedby="basic-addon3" value="1">

										</div>
									</div>
									<div class="buy-now"
										style="width: 100%; text-align: center; background: red; padding: 15px !important; font-weight: bold; color: white;">
										<a id="btnBuy">
											<h5>
												MUA NGAY VỚI GIÁ
												<fmt:formatNumber type="currency" currencySymbol=""
													pattern="###,###,###">
                                    ${product.price } 
                                    </fmt:formatNumber>
												₫
											</h5>
										</a>

										<p>Đặt mua giao hàng tận nơi</p>
									</div>
								</div>
								<div class="mt-3">
									<b>Gọi điện để được tư vấn: <span>0900 090 090</span></b>
									<div class="mt-3 share d-flex align-items-center" style="height: 30px !important;">
									<b>Chia sẻ lên: </b>
										<div class="sharethis-inline-share-buttons pl-3"></div>
									</div>
									 
									<div class="mt-3" style="height: 30px !important;">
										<b>Hình thức thanh toán :</b> <img
											src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/ppayment-1.svg?1598934578760"
											alt=""
											style="height: 50px !important; padding-left: 10px !important;">
										<img
											src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/ppayment-2.svg?1598934578760"
											alt="" style="height: 50px; padding-left: 10px !important;">
										<img
											src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/ppayment-3.svg?1598934578760"
											alt="" style="height: 50px; padding-left: 10px !important;">
									</div>
									<div class="mt-3">
										<img
											src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/size_image.svg?1598934578760"
											alt="" style="height: 25px;"> <a href=""
											style="color: black !important;"><b>Hướng dẫn thanh
												toán</b></a>
									</div>
								</div>
							</div>
						</div>
						<!--  -->
						<div class="row mt-5" style="margin-bottom: 30px;">
							<div class="col-xl-7 w3-bar p-0"
								style="border-bottom: 1px solid #e5e5e5;">
								<div class="w-100 d-flex justify-content-center"
									style="font-size: 18px;">
									<button class="w3-bar-item w3-button  p-4"
										style="color: black; float: none !important; text-align: center;border-bottom:2px solid black;"
										onclick="openDes('description')  ">Description</button>
									<button class="w3-bar-item w3-button p-4"
										style="color: #f68e2e; float: none !important;"
										onclick="openDes('additional')">Additional
										information</button>
									<button class="w3-bar-item w3-button p-4"
										style="color: #f68e2e; float: none !important;"
										onclick="openDes('comment')">Comment
										</button>	
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-xl-7">

								<div id="description" class="w3-container description-product">
									${product.detail_description }</div>

								<div id="additional" class="w3-container description-product"
									style="display: none">
									<div class="size-product">${product.short_description }</div>
								</div>
								<div id="comment" class="w3-container description-product"
									style="display: none">
									<div class="fb-comments" data-href="http://localhost:8080/details/" data-width="" data-numposts="10" data-lazy="true"></div>
								</div>
							</div>
						</div>
						<!--  -->
					</div>
					<!-- type -->
					<!-- content -->
					<!-- footer -->
					<!-- footer -->
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script type="text/javascript"
    src="https://platform-api.sharethis.com/js/sharethis.js#property=5fef5e1bc6ae2f001213ea19&product=inline-share-buttons"
    async="async"></script>	
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/owlcarousel/owl.carousel.min.js"></script>

<script src="${pageContext.request.contextPath}/js/details.js"></script>
<script src="${pageContext.request.contextPath}/js/shop.js"></script>
</html>