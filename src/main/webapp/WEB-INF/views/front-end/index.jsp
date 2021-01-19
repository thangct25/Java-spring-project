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
<title>Trang chủ</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/owlcarousel/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/owlcarousel/assets/owl.theme.default.min.css">
</head>

<body>
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
	
	<jsp:include page="/WEB-INF/views/front-end/common/Modal.jsp"></jsp:include>
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
						href="${pageContext.request.contextPath}/your-order">Xin chào <%= getUserNameLogined() %></a></span>
					</sec:authorize>
					<sec:authorize access="hasAuthority('ADMIN')">
						<span>&nbsp;<a
						class="text-white"
						href="${pageContext.request.contextPath}/admin">Xin chào <%= getUserNameLogined() %></a></span>
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
						<%-- <sec:authorize access="hasAuthority('ADMIN')">
						<li class="nav-item"><a class="nav-link" href="#">Admin Page</a> </li>
					</sec:authorize>
					<sec:authorize access="hasAuthority('guest')">
						<li class="nav-item"><a class="nav-link" href="#">Users Page</a> </li>
					</sec:authorize> --%>
					</div>
				</div>
				<div class="col-xl-1 col-lg-0"></div>
			</div>
			<div class="row">

				<div
					class="col-xl-10 col-lg-12 col-md-12 col-sm-12 m-auto content pl-3 pr-3">
					<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
					<!-- content -->
					<div class="row mt-5">

						<div class="col-xl-12 col-lg-12 mb-5"
							style="border-bottom: 1px solid #ebebeb;">
							<ul class="menu-type-right">
								<li><span><a
										href="${pageContext.request.contextPath}/">TRANG CHỦ</a></span></li>
								<li><span><a href="">GIỚI THIỆU</a></span></li>
								<li><span><a
										href="${pageContext.request.contextPath}/products?page=1">SẢN
											PHẨM</a></span></li>
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
					<!-- new product -->
					<div class="col-12 text-center new-title mb-5 mt-5">
						<h2>
							<strong>SẢN PHẨM MỚI VỀ</strong>
						</h2>
					</div>
					<div class="row mt-5 new-products owl-carousel owl-theme"
						style="z-index: 0;">
						<c:forEach items="${newProduct}" var="product">
							<div class="item new-product">

								<div class="infor position-relative">
									<c:choose>
										<c:when test="${empty product.productImages }">
											<img
												src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/giuong-ngu-go-chat-luong-cao-cho-gia-dinh-ghs-9071-ava.jpg?v=1565273414883"
												alt="" width="100%" style="max-width: 100%; height: 300px">
										</c:when>
										<c:otherwise>
											<img class="card-img-top"
												src="${pageContext.request.contextPath}/file/upload/${product.productImages.get(0).path }"
												alt="" style="max-width: 100%; height: 300px">
										</c:otherwise>
									</c:choose>
									<div
										class="text-center p-3 d-flex flex-column justify-content-between noi-that-go-detail new-product-detail">
										<a href="" style="color: black; font-weight: bold;">Evo
											Nội thất</a> <a
											href="${pageContext.request.contextPath}/details/${product.seo}"
											style="font-weight: bold;">${product.title} </a>

										<div class="d-flex justify-content-center">
											<a style="color: #f68e2e; font-weight: bold;"> <fmt:formatNumber
													type="currency" currencySymbol="" pattern="###,###,###">
                                    ${product.price }
                                    </fmt:formatNumber>đ
											</a> <span
												style="text-decoration: line-through !important; margin-left: 15px !important; color: gray;">
												<fmt:formatNumber type="currency" currencySymbol=""
													pattern="###,###,###">
                                    ${product.oldPrice } 
                                    </fmt:formatNumber>đ

											</span>
										</div>
										<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"
											onclick="Buy.buyCart(${product.id},1);">Mua Hàng</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- new product -->
					<!-- room-type -->
					<div class="row mt-5 room-type">
						<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 p-3">
							<div class="position-relative type-info">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/evo_banner_index_1.jpg?1598934578760"
									alt="" style="width: 100%;">
								<div class="position-absolute name-type">
									<span>Stylish Divan</span> <span>PHÒNG NGỦ</span>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 p-3">
							<div class="position-relative type-info">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/evo_banner_index_2.jpg?1598934578760"
									alt="" style="width: 100%;">
								<div class="position-absolute name-type">
									<span>Stylish Divan</span> <span>PHÒNG LÀM VIỆC</span>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 p-3">
							<div class="position-relative type-info">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/evo_banner_index_3.jpg?1598934578760"
									alt="" style="width: 100%;">
								<div class="position-absolute name-type">
									<span>Stylish Divan</span> <span>PHÒNG NGỦ</span>
								</div>
							</div>
						</div>
					</div>
					<!--  -->
					<div class="row mt-5 room-type">
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 p-3">
							<div class="position-relative type-info">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/evo_banner_index_4.jpg?1598934578760"
									alt="" style="width: 100%;">
								<div class="position-absolute name-type">
									<span>Stylish Divan</span> <span>PHÒNG NGỦ</span>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 p-3">
							<div class="position-relative type-info">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/evo_banner_index_5.jpg?1598934578760"
									alt="" style="width: 100%;">
								<div class="position-absolute name-type">
									<span>Stylish Divan</span> <span>PHÒNG LÀM VIỆC</span>
								</div>
							</div>
						</div>
					</div>
					<!-- room-type -->

					<!-- nội thất gỗ -->
					<div
						class="col-12 text-center new-title noi-that-go-title mb-5 mt-5">
						<h2>
							<strong>NỘI THẤT GỖ</strong>
						</h2>
					</div>
					<div
						class="row mt-5 new-products noi-that-go owl-carousel owl-theme"
						style="z-index: 0;">
						<c:forEach items="${noiThatGo}" var="product">
							<div class="item new-product">

								<div class="infor position-relative">
									<c:choose>
										<c:when test="${empty product.productImages }">
											<img
												src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/giuong-ngu-go-chat-luong-cao-cho-gia-dinh-ghs-9071-ava.jpg?v=1565273414883"
												alt="" width="100%" style="max-width: 100%; height: 300px">
										</c:when>
										<c:otherwise>
											<img class="card-img-top"
												src="${pageContext.request.contextPath}/file/upload/${product.productImages.get(0).path }"
												alt="" style="max-width: 100%; height: 300px">
										</c:otherwise>
									</c:choose>
									<div
										class="text-center d-flex flex-column justify-content-between noi-that-go-detail new-product-detail">
										<a href="" style="color: black; font-weight: bold;">Evo
											Nội thất</a> <a
											href="${pageContext.request.contextPath}/details/${product.seo}"
											style="font-weight: bold;">${product.title}</a>
										<div class="d-flex justify-content-center">
											<a style="color: #f68e2e; font-weight: bold;"> <fmt:formatNumber
													type="currency" currencySymbol="" pattern="###,###,###">
                                    ${product.price }
                                    </fmt:formatNumber>đ
											</a> <span
												style="text-decoration: line-through !important; margin-left: 15px !important; color: gray;">
												<fmt:formatNumber type="currency" currencySymbol=""
													pattern="###,###,###">
                                    ${product.oldPrice } 
                                    </fmt:formatNumber>đ

											</span>
										</div>
										<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"
											onclick="Buy.buyCart(${product.id},1);">Mua Hàng</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- nội thất gỗ -->

					<!--advertise  -->
					<div class="row advertise mb-5">
						<div class="col-xl-6 ad-1 p-3">
							<div class="position-relative">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/evo_banner_two_1.jpg?1598934578760"
									alt="" srcset="">
								<div class="advertise-infor">
									<b style="color: red;">Phòng Khách</b>
									<div style="font-size: larger;">
										<p>
											<b>Bộ Sưu Tập</b>
										</p>
										<strong>Chao Đèn</strong>
									</div>
									<a href="">Xem thêm</a>
								</div>
							</div>

						</div>
						<div class="col-xl-6 ad-2 p-3">
							<div class="position-relative">
								<img
									src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/evo_banner_two_2.jpg?1598934578760"
									alt="" srcset="">
								<div class="advertise-infor">
									<b style="color: yellow;">Phòng Khách</b>
									<div style="font-size: larger; color: white;">
										<p>
											<b>Bộ Sưu Tập</b>
										</p>
										<strong>Chao Đèn</strong>
									</div>
									<a href="">Xem thêm</a>
								</div>
							</div>

						</div>
					</div>
					<!-- advertise -->
					<!-- NỔI BẬT-BÁN CHẠY-KHUYẾN MÃI -->
					<div class="row features-sells-voucher">
						<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
							<div
								class="col-12 text-center new-title noi-that-go-title mb-5 mt-5">
								<h2>
									<strong>NỔI BẬT</strong>
								</h2>
							</div>
							<div class="row d-flex flex-column voucher-special-product">
								<c:forEach begin="0" end="1" var="i">
									<div class="item new-product">
										<div class="infor position-relative d-flex"
											style="height: 180px;">

											<c:choose>
												<c:when test="${empty listProduct[i].productImages }">
													<img
														src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
														alt="" height="100%" style="max-width: 100%;">
												</c:when>
												<c:otherwise>
													<img
														src="${pageContext.request.contextPath}/file/upload/${listProduct[i].productImages.get(0).path }"
														alt="" height="100%" style="max-width: 100%;">
												</c:otherwise>
											</c:choose>
											<div
												class="text-center pt-3 w-100 d-flex flex-column noi-that-go-detail new-product-detail">
												<a href="" style="color: black; font-weight: bold;">Evo
													Nội thất</a> <a
													href="${pageContext.request.contextPath}/details/${listProduct[i].seo}"
													style="font-weight: bold;">${listProduct[i].title}</a> <a
													style="color: #f68e2e; font-weight: bold;">
													<div class="d-flex justify-content-center">
														<a style="color: #f68e2e; font-weight: bold;"> <fmt:formatNumber
																type="currency" currencySymbol="" pattern="###,###,###">
                                    ${listProduct[i].price }
                                    </fmt:formatNumber>đ
														</a> <span
															style="text-decoration: line-through !important; margin-left: 15px !important; color: gray;">
															<fmt:formatNumber type="currency" currencySymbol=""
																pattern="###,###,###">
                                    		${listProduct[i].oldPrice } 
                                    </fmt:formatNumber>đ

														</span>
													</div>
													<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"
														onclick="Buy.buyCart(${listProduct[i].id},1);">Mua
														Hàng</button>
											</div>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
						<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
							<div
								class="col-12 text-center new-title noi-that-go-title mb-5 mt-5">
								<h2>
									<strong>BÁN CHẠY</strong>
								</h2>
							</div>
							<div class="row d-flex flex-column voucher-special-product">

								<c:forEach begin="2" end="3" var="i">
									<div class="item new-product">
										<div class="infor position-relative d-flex"
											style="height: 180px;">

											<c:choose>
												<c:when test="${empty listProduct[i].productImages }">
													<img
														src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
														alt="" height="100%" style="max-width: 100%;">
												</c:when>
												<c:otherwise>
													<img
														src="${pageContext.request.contextPath}/file/upload/${listProduct[i].productImages.get(0).path }"
														alt="" height="100%" style="max-width: 100%;">
												</c:otherwise>
											</c:choose>
											<div
												class="text-center pt-3 w-100 d-flex flex-column noi-that-go-detail new-product-detail">
												<a href="" style="color: black; font-weight: bold;">Evo
													Nội thất</a> <a
													href="${pageContext.request.contextPath}/details/${listProduct[i].seo}"
													style="font-weight: bold;">${listProduct[i].title}</a>
												<div class="d-flex justify-content-center">
													<a style="color: #f68e2e; font-weight: bold;"> <fmt:formatNumber
															type="currency" currencySymbol="" pattern="###,###,###">
                                    ${listProduct[i].price }
                                    </fmt:formatNumber>đ
													</a> <span
														style="text-decoration: line-through !important; margin-left: 15px !important; color: gray;">
														<fmt:formatNumber type="currency" currencySymbol=""
															pattern="###,###,###">
                                    ${listProduct[i].oldPrice } 
                                    </fmt:formatNumber>đ

													</span>
												</div>
												<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"
													onclick="Buy.buyCart(${listProduct[i].id},1);">Mua
													Hàng</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
							<div
								class="col-12 text-center new-title noi-that-go-title mb-5 mt-5">
								<h2>
									<strong>ƯU ĐÃI</strong>
								</h2>
							</div>
							<div class="row d-flex flex-column voucher-special-product">
								<c:forEach begin="6" end="7" var="i">
									<div class="item new-product">
										<div class="infor position-relative d-flex"
											style="height: 180px;">
											<c:choose>
												<c:when test="${empty listProduct[i].productImages }">
													<img
														src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
														alt="" height="100%" style="max-width: 100%;">
												</c:when>
												<c:otherwise>
													<img
														src="${pageContext.request.contextPath}/file/upload/${listProduct[i].productImages.get(0).path }"
														alt="" height="100%" style="max-width: 100%;">
												</c:otherwise>
											</c:choose>
											<div
												class="text-center pt-3 w-100 d-flex flex-column noi-that-go-detail new-product-detail">
												<a href="" style="color: black; font-weight: bold;">Evo
													Nội thất</a> <a
													href="${pageContext.request.contextPath}/details/${listProduct[i].seo}"
													style="font-weight: bold;">${listProduct[i].title}</a>
												<div class="d-flex justify-content-center">
													<a style="color: #f68e2e; font-weight: bold;"> <fmt:formatNumber
															type="currency" currencySymbol="" pattern="###,###,###">
                                    ${listProduct[i].price }
                                    </fmt:formatNumber>đ
													</a> <span
														style="text-decoration: line-through !important; margin-left: 15px !important; color: gray;">
														<fmt:formatNumber type="currency" currencySymbol=""
															pattern="###,###,###">
                                    ${listProduct[i].oldPrice } 
                                    </fmt:formatNumber>đ
													</span>
												</div>
												<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"
													onclick="Buy.buyCart(${listProduct[i].id},1);">Mua
													Hàng</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- NỔI BẬT-BÁN CHẠY-KHUYẾN MÃI -->
					<!-- news -->
					<div class="row news-design">
						<div
							class="col-12 text-center new-design-title new-title noi-that-go-title mt-5">
							<h2>
								<strong>TIN TỨC THIẾT KẾ</strong>
							</h2>
						</div>
						<div
							class="row mt-5 new-products new-design noi-that-go owl-carousel owl-theme"
							style="z-index: 0;">
							<div class="item new-product">

								<div class="infor">
									<img
										src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
										alt="" width="100%" style="max-width: 100%;">
									<div
										class="p-3 d-flex flex-column noi-that-go-detail new-product-detail">
										<a style="font-weight: bold;">Tủ bếp bằng gỗ tự nhiên nhỏ
											gọn đa năng</a> <span> Phong thủy là một yếu tố quan trọng
											trong văn hóa và đời sống hàng ngày của người phương Đông nói
											chung và... </span>

									</div>
								</div>
							</div>
							<div class="item new-product">

								<div class="infor">
									<img
										src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
										alt="" width="100%" style="max-width: 100%;">
									<div
										class="p-3 d-flex flex-column noi-that-go-detail new-product-detail">
										<a style="font-weight: bold;">Tủ bếp bằng gỗ tự nhiên nhỏ
											gọn đa năng</a> <span> Phong thủy là một yếu tố quan trọng
											trong văn hóa và đời sống hàng ngày của người phương Đông nói
											chung và... </span>

									</div>
								</div>
							</div>
							<div class="item new-product">

								<div class="infor">
									<img
										src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
										alt="" width="100%" style="max-width: 100%;">
									<div
										class="p-3 d-flex flex-column noi-that-go-detail new-product-detail">
										<a style="font-weight: bold;">Tủ bếp bằng gỗ tự nhiên nhỏ
											gọn đa năng</a> <span> Phong thủy là một yếu tố quan trọng
											trong văn hóa và đời sống hàng ngày của người phương Đông nói
											chung và... </span>
									</div>
								</div>
							</div>
							<div class="item new-product">

								<div class="infor">
									<img
										src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
										alt="" width="100%" style="max-width: 100%;">
									<div
										class="p-3 d-flex flex-column noi-that-go-detail new-product-detail">
										<a style="font-weight: bold;">Tủ bếp bằng gỗ tự nhiên nhỏ
											gọn đa năng</a> <span> Phong thủy là một yếu tố quan trọng
											trong văn hóa và đời sống hàng ngày của người phương Đông nói
											chung và... </span>
									</div>
								</div>
							</div>
							<div class="item new-product">

								<div class="infor">
									<img
										src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
										alt="" width="100%" style="max-width: 100%;">
									<div
										class="p-3 d-flex flex-column noi-that-go-detail new-product-detail">
										<a style="font-weight: bold;">Tủ bếp bằng gỗ tự nhiên nhỏ
											gọn đa năng</a> <span> Phong thủy là một yếu tố quan trọng
											trong văn hóa và đời sống hàng ngày của người phương Đông nói
											chung và... </span>
									</div>
								</div>
							</div>
							<div class="item new-product">

								<div class="infor">
									<img
										src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
										alt="" width="100%" style="max-width: 100%;">
									<div
										class="p-3 d-flex flex-column noi-that-go-detail new-product-detail">
										<a href="details" style="font-weight: bold;">Tủ bếp bằng
											gỗ tự nhiên nhỏ gọn đa năng</a> <span> Phong thủy là một
											yếu tố quan trọng trong văn hóa và đời sống hàng ngày của
											người phương Đông nói chung và... </span>
									</div>
								</div>
							</div>
							<div class="item new-product">

								<div class="infor">
									<img
										src="https://bizweb.dktcdn.net/thumb/large/100/360/933/products/ezgif-2-c7f2105dbc1a.jpg?v=1565273733000"
										alt="" width="100%" style="max-width: 100%;">
									<div
										class="p-3 d-flex flex-column noi-that-go-detail new-product-detail">
										<a href="details" style="font-weight: bold;">Tủ bếp bằng
											gỗ tự nhiên nhỏ gọn đa năng</a> <span> Phong thủy là một
											yếu tố quan trọng trong văn hóa và đời sống hàng ngày của
											người phương Đông nói chung và... </span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- news -->
				</div>
			</div>
			<!-- footer -->

			<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
			<!-- footer -->
		</div>

	</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script
	src="${pageContext.request.contextPath}/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/shop.js"></script>

<script>
   
</script>

</html>