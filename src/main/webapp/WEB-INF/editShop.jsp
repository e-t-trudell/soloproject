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
    <title>Edit Shop</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   	<div id="box1" class="container d-flex flex-row justify-content-between m-2 p-2">
   		<h2>Welcome <c:out value="${user.userName}"/> to the edit shop page!</h2>
		<a href="/home"><button class="btn btn-info">Home</button></a>
   </div>
   <div class="container d-flex flex-row col-sm-10 off-set-3">
   <div id="box4" class="container border border-3 border-info m-3 p-2  col-sm-10 d-flex flex-column">
   		<form:form action="/shop/${shop.shop_id}/update" method="post" modelAttribute="shop" >
   			<div>
   				<form:hidden path="shop_id" />
   				<input type="hidden" name="_method" value="put">
   			</div>
   			<div>
   				<form:label path="shopName" class="form-label text-warning bg-dark">Name: </form:label>
   				<form:input path="shopName" value="${shop.shopName}" class="form-control border-info border-3 text-center text-dark"></form:input>
   				<form:errors path="shopName"></form:errors>
			</div>
   			<button class="btn btn-success">Save!</button>
   		</form:form>
   		<div>
   			<h4 class="text-warning bg-dark">Items in this shop:</h4>
   			<c:forEach var="item" items="${allItems}">
   				<c:if test="${item.shop.shop_id==shop.shop_id}">
   					<div class="table-responsive-sm col-sm-10">
   						<table class="table table-sm align-middle table-info table-striped table-hover col-sm-10 m-2 p-2 w-100 h-100">
   							<thead>
   								<tr scope="row">
   									<th class="text-center" scope="col">Item: </th>
   									<th class="text-center" scope="col">Quantity</th>
   									<th class="text-center" scope="col">Price:</th>
   								</tr>
   							</thead>
							<tbody class="overflow-y:auto">
								<tr scope="row">
									<td class="text-center"><c:out value="${item.description}"></c:out></td>
									<td class="text-center"><c:out value="${item.quantity}"></c:out></td>
									<td class="text-center"><c:out value="${item.price}"></c:out></td>
								</tr>
							</tbody>   				
 			   			</table>
 					</div>
   				</c:if>
   			</c:forEach>
  		</div>
   </div>
   
   </div>
</body>
</html>
