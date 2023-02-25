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
    <title>Item View</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body >
	<div id="box4" class="container border border-success border-5 col-sm-6 offset-sm-3 p-5 mt-5 d-flex flex-column justify-content-center align-items-center">
   		<!-- IMAGE? -->
   		<div id="box8" class="container border border-2 border-danger rounded">
   			<h3>Name: <c:out value="${item.description}"/></h3>
   			<p>ID: <c:out value="${item.item_id}"/></p>
   			<p>$ <c:out value="${item.price}"/></p>
   			<p>Quantity: <c:out value="${item.quantity}"/></p>
   			<p>To Shop: <a href="/shop/${item.shop.shop_id}/view"><button class="btn btn-success"><c:out value="${item.shop.shopName}"/></button></a></p>
   			<div class="container d-flex flex-row col-sm-6 justify-content-around">
   				<c:if test="${user.id==item.user.id}">
   					<a href="/item/${item.item_id}/edit"><button class="btn btn-primary">Edit Item</button></a>
   					<form action="/item/${item.item_id}/delete" method="post">
   									<%-- <input type="hidden"  value="${item.item_id}"> --%>
    					<input type="hidden" name="_method" value="delete">
    					<input class="btn btn-danger" type="submit" value="Delete Item">
					</form> 
				</c:if>
				<a href="/home"><button class="btn btn-info">Home</button></a>
			</div>
   			
   		<%-- <div>
   			<form:form action="/item/${item.item_id}/addCart" method="post" modelAttribute="item">
    			<input type="hidden" name="_method" value="put">
    			<input type="submit" value="Add to Cart">
			</form:form> 
		</div> --%>
   		</div>
   </div>
</body>
</html>
