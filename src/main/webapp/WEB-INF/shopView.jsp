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
    <title>Shop View</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="box1" class="container-fluid d-flex flex-row flex-sm-fill align-items-center justify-content-between border border-info col-sm-8 mt-5 h-50">
   		<h3 class="text-center">Shop Name: <c:out value="${shops.shopName}"></c:out></h3>
   		<a href="/home"><button class="btn btn-info w-100 m-2">Home</button></a>
   		<a href="/item/new"><button class="btn btn-success w-100 m-2">+ Add new item</button></a>
   		<a href="/shop/${shops.shop_id}/edit"><button class="btn btn-info m-2">Edit Shop</button></a>
   		<a href="/shop/new"><button class="btn btn-success w-100 m-2">+ Add new shop</button></a>
   		<a href="/logout"><button class="btn btn-danger w-100 m-2">Logout</button></a>
  	</div>
  	<div class="table-responsive-sm col-sm-8 offset-sm-2">
   		<table class="table table-sm align-middle table-info table-striped table-hover col-sm-10 m-2 p-2 w-100 h-100">
   			<thead>
   				<tr scope="row">
   					<th class="text-center" scope="col">ID</th>
   					<th class="text-center" scope="col">Description</th>
   					<th class="text-center" scope="col">Price</th>
   					<th class="text-center" scope="col">Quantity</th>
   					<th class="text-center" scope="col">Actions</th>
   				</tr>
   			</thead>
   			<tbody>
   				<c:forEach var="item" items="${allItems}">
   					<tr scope="row ">
   						<c:if test="${item.shop.shop_id==shops.shop_id}">
   							<td class="text-center"><c:out value="${item.item_id}"/></td>
   							<td class="text-center"><a href="/item/${item.item_id}/view"><c:out value="${item.description}"/></a></td>
   							<td class="text-center">$ <c:out value="${item.price}"/></td>
   							<td class="text-center"><c:out value="${item.quantity}"/></td>
   							<%-- <td><c:out value="${item.shop.shop_id}"/></td> --%>
   							<td>
   								<c:if test="${user.id==item.user.id}">
   									<a href="/item/${item.item_id}/edit"><button class="btn btn-info w-100 m-2">Edit Me</button></a>
   									<form action="/item/${item.item_id}/delete" method="post">
   									<%-- <input type="hidden"  value="${item.item_id}"> --%>
    									<input type="hidden" name="_method" value="delete">
    									<input class="btn btn-danger w-100 m-2" type="submit" value="Delete">
									</form>
								</c:if>
								<!-- brainstorm: 
								make this a link to another form to create cart with items / quantity-->
								<form:form action="/item/${item.item_id}/newCart" method="post" modelAttribute="item">
    								<!-- <input type="hidden" name="_method" value="put"> -->
    								<input type="hidden" value="${item.item_id}">
    								<!-- input for cart id? -->
    								<input class="btn btn-success w-100 m-2" type="submit" value="Add to Cart">
								</form:form>
							</td>
   						</c:if>
   					</tr>
   				</c:forEach>
   			</tbody>
   		</table>
   </div>
</body>
</html>
