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
    <title>Cart</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div>
   		<a href="/home">Home</a>
   		<h2><c:out value="${userId.userName}"/>'s Cart:</h2>
   </div>
   <table>
   		<thead>
   			<tr>
   				<th>ID</th>
   				<th>Description</th>
   				<th>Price</th>
   				<th>Quantity</th>
   				<th>Shop ID</th>
   				<th>Actions</th>
   			</tr>
   		</thead>
   		<tbody>
   			<c:forEach var="cart" items="${carts}">
   			<c:if test="${cart.user.id==userId.id}">
   				<c:forEach var="item" items="${allItems}">
   				<tr>
   					<c:if test="${item.shop.shop_id==shops.shop_id}">
   						<td><c:out value="${item.item_id}"/></td>
   						<td><a href="/item/${item.item_id}/view"><c:out value="${item.description}"/></a></td>
   						<td>$ <c:out value="${item.price}"/></td>
   						<td><c:out value="${item.quantity}"/></td>
   						<td><c:out value="${item.shop.shop_id}"/></td>
   						<!-- test if user.id is cart user id -->
   						<c:if test="${user.id==item.user.id}">
   							<td>
   								<button>Remove</button>
   								<%-- <form action="/item/${item.item_id}/deleteItem" method="post">
   									<input type="hidden"  value="${item.item_id}">
    								<input type="hidden" name="_method" value="delete">
    								<input type="submit" value="Delete">
								</form>
								<a href="/item/${item.item_id}/addCart"><button>Add To Cart</button></a> --%>
								<%-- <form:form action="/item/${item.item_id}/addCart" method="post" modelAttribute="item">
    								<input type="hidden" name="_method" value="put">
    								<input type="submit" value="Add to Cart">
								</form:form> --%>
							</td>
   						</c:if>
   						<td>
   							<form:form action="/item/${item.item_id}/addCart" method="post" modelAttribute="item">
    							<input type="hidden" name="_method" value="put">
    							<input type="submit" value="Add to Cart">
							</form:form>
   						</td>
   					</c:if>
   					
   				</tr>
   				</c:forEach>
   			</c:if>
   			</c:forEach>
   		</tbody>
   
   </table>
</body>
</html>
