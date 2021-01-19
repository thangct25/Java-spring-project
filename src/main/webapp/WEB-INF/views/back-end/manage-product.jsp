<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>ADMIN</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">

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
				<div class="modal-body">Thành Công</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<!-- Modal -->
	<div class="modal fade" id="acceptModal" tabindex="-1"
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
				<div class="modal-body">Đồng Ý Xóa ?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						data-toggle="modal" data-target="#myModal" id="accept" >Đồng
						Ý</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->

	<!-- Modal -->
	<div class="modal fade" id="inputCategory" tabindex="-1"
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
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="formGroupExampleInput">Danh Mục Mới</label> 
							<input type="text" class="form-control" id="categoryInput"
								placeholder="Nhập Tên Danh Mục">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						data-toggle="modal" data-target="#myModal"  id="addNew" onclick="AddCategory.add_category();">Đồng
						Ý</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	
	<!-- Modal -->
	<div class="modal fade" id="changeCategory" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<sf:form action="" method="post" modelAttribute="categoryBeChanged" style="width:100% !important;">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form >
						<div class="form-group">
							<label for="formGroupExampleInput">Sửa Danh Mục</label> 
							<input type="text" class="form-control" id="categoryNamed"
								placeholder="Nhập Tên Danh Mục" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						data-toggle="modal" data-target="#myModal" id="changeCategory" onclick="Change.change_category();">Đồng
						Ý</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
			</sf:form>
			
		</div>
	</div>
	<!-- Modal -->

	<nav class="navbar navbar-expand-xl">
		<div class="container h-100">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/admin">
				<h1 class="tm-site-title mb-0">Admin</h1>
			</a>
			<button class="navbar-toggler ml-auto mr-0" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars tm-nav-icon"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto h-100">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin">
							<i class="fas fa-tachometer-alt"></i> Trang Chính <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="far fa-file-alt"></i> <span>
								Reports <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Daily Report</a> <a
								class="dropdown-item" href="#">Weekly Report</a> <a
								class="dropdown-item" href="#">Yearly Report</a>
						</div></li>
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/admin/product/list"> <i class="fas fa-shopping-cart"></i> Sản Phẩm
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/bill"> <i class="fas fa-shopping-cart"></i> Đơn Hàng
					</a></li>
					<li class="nav-item"><a class="nav-link" href="accounts">
							<i class="far fa-user"></i> Tài Khoản
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-cog"></i> <span>
								Thiết Lập <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Profile</a> <a
								class="dropdown-item" href="#">Billing</a> <a
								class="dropdown-item" href="#">Customize</a>
						</div></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="${pageContext.request.contextPath}/login"> Admin, <b>Logout</b>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container mt-5">
		<div class="row tm-content-row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-products">
					<div class="tm-product-table-container">
						<table class="table table-hover tm-table-small tm-product-table">
							<thead>
								<tr>
									<th scope="col">&nbsp;</th>
									<th scope="col">Tên Sản Phẩm</th>
									<th scope="col">Giá</th>
									<th scope="col">Trạng Thái</th>
									<th scope="col">Ngày Cập Nhập</th>
									<th scope="col">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${products}" var="product">
									<tr id=${product.id }>
										<th scope="row"><input type="checkbox" /></th>
										<td class="tm-product-name"><a style="color: white;"
											href="${pageContext.request.contextPath}/admin/product/${product.id}">
												${product.title} </a></td>
										<td><fmt:formatNumber type="currency" currencySymbol=""
												pattern="###,###,###">
                                    ${product.price }
                                    </fmt:formatNumber> đ</td>
										<td>Còn Hàng</td>
										<td>${product.updatedDate }</td>
										<td><a class="tm-product-delete-link" data-toggle="modal"
											data-target="#acceptModal"
											onclick="deleteProduct(${product.id});"> <i
												class="far fa-trash-alt tm-product-delete-icon del-icon"></i>
										</a></td>
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
					<!-- table container -->
					<a href="${pageContext.request.contextPath}/admin/add-product"
						class="btn btn-primary btn-block text-uppercase mb-3">Thêm Sản
						Phẩm Mới</a>
				</div>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-product-categories">
					<h2 class="tm-block-title">Danh Mục Sản Phẩm</h2>
					<div class="tm-product-table-container">
						<table class="table tm-table-small tm-product-table">
							<tbody>
								<c:forEach items="${categories}" var="category">
									<tr id="${category.id}-category">
										<td class="tm-product-name" id="${category.id }-name" onclick="getCategoryName(${category.id});" data-toggle="modal" data-target="#changeCategory">${category.name }</td>
										<td class="text-center"><a class="tm-product-delete-link"
											data-toggle="modal" data-target="#acceptModal"
											onclick="deleteCategory(${category.id});"> <i
												class="far fa-trash-alt tm-product-delete-icon"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- table container -->
					<button class="btn btn-primary btn-block text-uppercase mb-3"
					data-toggle="modal" data-target="#inputCategory"
						>THÊM MỚI DANH MỤC</button>
				</div>
			</div>
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2018</b> All rights reserved. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Template Mo</a>
			</p>
		</div>
	</footer>

	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/shop.js"></script>
	<script src="${pageContext.request.contextPath}/js/manage-product.js"></script>
	<!--

//-->

	<!-- https://getbootstrap.com/ -->
</body>

</html>