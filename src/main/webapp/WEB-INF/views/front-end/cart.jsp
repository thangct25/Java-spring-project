<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <div class="row" style="margin:0 !important;">
    
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
	
        <div class="col-xl-10 col-lg-12 col-md-12 col-sm-12 m-auto content pl-3 pr-3">
            <header>
                <div class="row mt-3 d-flex justify-content-between">
                    <div class=" col-xl-0 col-lg-0 col-sm-3 col-3 hidden d-flex flex-column justify-content-center">
                        <div>
                            <i id="btn-show-menu" class="fas fa-bars"></i>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3 image-logo">
                        <img src="https://bizweb.dktcdn.net/100/360/933/themes/728303/assets/logo.png?1598934578760" alt="">
                    </div>
        
                    <div class="col-xl-6 col-lg-6 search-input d-flex flex-column justify-content-center">
                        <form action="">
                            <div class="d-flex">
                                <input type="text" name="search-input-box" id="search-input-text" placeholder="Tìm kiếm">
                                <button id="search-input-btn" type="submit"><i class="fas fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                    <div
                        class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3 d-flex flex-column justify-content-center shop-contact-cart">
                        <div class="d-flex justify-content-between shop-contact-info">
                            <div class="d-flex flex-column text-center contact-number">
                                <span style="font-size: smaller;display: inline-block;font-weight: bold;">LIÊN
                                    HỆ HOTLINE</span>
                                <a style="color: red;font-weight: bold;">0909 090 009</a>
                            </div>
                            <div class="d-flex flex-column text-center find-address">
                                <span style="font-size: smaller;font-weight: bold;">TÌM ĐỊA CHỈ</span>
                                <span style="color: red;font-weight: bold;">CỬA HÀNG</span>
                            </div>
                            <div class="cart">
                                <i class="fas fa-search" id="show-search-input"></i>
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="jumbotron text-center" style="margin-top:30px;">
                    <div class="container">
                        <h1 class="jumbotron-heading">Giỏ Hàng Của Bạn</h1>
                    </div>
                </section>
            </header>
            <div class="row">
                <form action="${pageContext.request.contextPath}/save-your-order" method="POST" style="width: 100%;"> 
                <div class="col-12">
                    <div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Họ và Tên</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="name" aria-describedby="emailHelp"
                                placeholder="Họ và tên" required="required">
                            
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Địa chỉ</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" name="address" placeholder="Địa chỉ" required="required">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Số Điện Thoại</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" name="phone" placeholder="SĐT" required="required">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Email</label>
                            <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Email" name="email" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                    </div>
                </div>
                <c:choose>
                	<c:when test="${size != 0 }">
                	<div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col"> </th>
                                    <th scope="col">Tên Sản Phẩm</th>
                                    <th scope="col">Tình trạng</th>
                                    <th scope="col" class="text-center">Số lượng</th>
                                    <th scope="col" class="text-right">Giá</th>
                                    <th> </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${GIO_HANG.cartList }" var="item" varStatus="loop"> 
						    
								<tr id="${item.maSanPham }">
                                    <td><img src="${pageContext.request.contextPath}/file/upload/${item.path }" style="max-height:50px;"/> </td>
                                    <td>${item.tenSanPham }</td>
                                    <td>Còn hàng</td>
                                    <td><input class="form-control" type="number" value="${item.soluong }" /></td>
                                    <td class="text-right"><fmt:formatNumber
															type="currency" currencySymbol="" pattern="###,###,###">
                                    ${item.giaban } 
                                    </fmt:formatNumber> VNĐ</td>
                                    <td class="text-right"><a class="btn btn-sm btn-danger" data-toggle="modal"
											data-target="#acceptModal" onclick="deleteCart(${item.maSanPham });"><i class="fa fa-trash"></i>
                                        </a> </td>
                                </tr>
								</c:forEach>
                                
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="font-weight-bold">Tổng tiền</td>
                                    <td class="text-right font-weight-bold">
                                    <fmt:formatNumber
															type="currency" currencySymbol="" pattern="###,###,###">
                                    ${GIO_HANG.totalCount } 
                                    </fmt:formatNumber>
                                    VNĐ</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col mb-2">
                    <div class="row">
                        <div class="col-sm-12  col-md-6">
                            <button class="btn btn-block btn-light">
                            <a href="${pageContext.request.contextPath}/">Tiếp Tục Mua Sắm</a>
                            </button>
                        </div>
                        <div class="col-sm-12 col-md-6 text-right">
                            <button type="submit" class="btn btn-lg btn-block btn-success text-uppercase">Thanh Toán</button>
                        </div>
                    </div>
                </div>
                	</c:when>
                	<c:otherwise>
                	<div class="text-center">
                	<h1 style="margin:auto !important;">Bạn chưa chọn sản phẩm nào </h1>
                	<button class="btn btn-block btn-light">
                            <a href="${pageContext.request.contextPath}/">Tiếp Tục Mua Sắm</a>
                            </button>
                	</div>
                		
                	</c:otherwise>
                </c:choose>

                
                
                </form>
            </div>
            <!-- Footer -->
            <jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
    </div>
</body>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/shop.js"></script>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"></script>
</html>