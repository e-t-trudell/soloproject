<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
 
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home!</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
	<!-- <script src="https://cdn.tailwindcss.com"></script> -->
	
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="box7" class="container-fluid d-flex justify-content-center m-2 p-2 text-light">
		<h2>Welcome <c:out value="${userId.userName}"/> to Trippy Tuesdays!</h2>
	</div> 
	<!-- Add background image to this div -->
   <div id="holdMe" style="background-image:url('https://wallpapers.com/images/featured/qm880qoivnph7k2b.jpg');">
   		<div class="container-fluid d-flex flex-row justify-content-sm-between h-100 w-100 m-2 p-2 ">
   			<div id="box1" class="container-fluid d-flex flex-column flex-sm-fill align-items-end border border-info col-sm-2 col-md-4 col-lg-2 h-50 overflow-auto">
   				<h3 class="border border-3 border-primary shadow bg-body rounded w-100 text-sm-center">Navigation</h3>
   				<a href="/logout"><button class="btn btn-danger w-100 m-2">Logout</button></a>
   				<a href="/shop/new"><button class="btn btn-info w-100 m-2">+ Add new shop</button></a>
   				<a href="/"><button class="btn btn-primary w-100 m-2">+ Add new user</button></a>
   				<a href="/item/new"><button class="btn btn-success w-100 m-2">+ Add new item</button></a>
   			</div>
   			<div  class="container-fluid d-flex flex-column justify-content-between h-100">
   				<div id="box2" class="container-fluid d-flex col-sm-6 flex-sm-wrap flex-row w-100 overflow-auto flex-sm-fill border border-3 border-success justify-content-sm-between align-content-sm-top p-2 m-2">
   					<h3 class="text-light">Your shops: </h3>
   					<c:forEach var="shop" items="${shops}">
   						<c:if test="${user.id == shop.user.id}">
   							<!-- Add background image for stores via css -->
   							<div id="store" class="border border-3 border-warning d-flex flex-column  align-items-center justify-content-center has-bg-image mb-3 p-2" >
   								<a href="/shop/${shop.shop_id}/view" class="border border-3 border-warning"><c:out value="${shop.shopName}"></c:out></a>
   									<div class="overflow-auto">
   										<c:forEach var="item" items="${allItems}">
   											<c:if test="${item.shop.shop_id==shop.shop_id}">
   												<ul>
   													<li ><c:out value="${item.description}"></c:out></li>
   												</ul>
   											</c:if>
   										</c:forEach>
   									</div>
   								<div class=" container d-flex flex-row col-sm-6 p-2 justify-content-center align-items-center h-50">
   									<a  href="/shop/${shop.shop_id}/edit"><button class="btn btn-info m-2">Edit Shop</button></a>
   									<form action="/shop/${shop.shop_id}/delete" method="post">
    									<input type="hidden" name="_method" value="delete">
    									<input class="btn btn-danger " type="submit" value="Delete Shop">
									</form> 	
   								</div>
   							</div>
   						</c:if>
   					</c:forEach>
   				</div>
   				<div id="box3" class="container-fluid d-flex flex-sm-wrap overflow-auto col-sm-6 w-100 flex-row flex-sm-fill border border-3 border-success justify-content-sm-between align-content-sm-top  p-2 m-2">
   					<h4 class="text-light">All Shops: </h4>
   					<c:forEach var="shop" items="${shops}">
   					<!-- Add c if test here to change color of owned stores -->
   						<div id="store" class="border border-3 border-warning d-flex flex-column align-items-center justify-content-center has-bg-image mb-3" >
   							<a href="/shop/${shop.shop_id}/view"><button class="btn btn-info m-2 border border-3 border-warning"><c:out value="${shop.shopName}"></c:out></button></a>
   								<div class="overflow-auto">
   									<c:forEach var="item" items="${allItems}">
   										<c:if test="${item.shop.shop_id==shop.shop_id}">
   											<ul>
   												<li><c:out value="${item.description}"></c:out></li>
   											</ul>
   										</c:if>
   									</c:forEach>
   								</div>
   						</div>
   					</c:forEach>
   				</div>
   			</div>
   		</div>
   </div>
</body>
</html>
