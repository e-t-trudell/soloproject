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
   		<a href="/"></a>
   	</div>
   	<div id="box1" class="container d-flex flex-row justify-content-between m-2 p-2">
   		<h2>Welcome <c:out value="${user.userName}"/> add an item!</h2>
		<a href="/home"><button class="btn btn-info m-2">Home</button></a>
		<a href="/logout"><button class="btn btn-danger  m-2">Logout</button></a>
   		<a href="/shop/new"><button class="btn btn-success  m-2">+ Add new shop</button></a>
   </div>
   <div id="box5" class="container border border-3 border-info m-3 p-2  d-flex flex-column">
   		<form:form action="/item/${items.item_id}/newCart" method="post" modelAttribute="newCart">
   			<%-- <div>
   				<form:hidden path="item_id" />
   			</div> --%>
   			
		<!-- shop -->
			<div >
   				<form:label path="items" class="form-label text-warning bg-dark mt-3">Shop:</form:label>
   				<form:select path="items" class="form-select border-info border-3 ">
   					<c:forEach var="items" items="${items}">
   						<div>
   							<c:if test="${item.item_id == shop.item.item_id}">
   								<form:option value="${item.item_id}" path="items">
   									<c:out value="${item.description}"/>
   								</form:option>
   							</c:if>
   						</div>
   					</c:forEach>
   				</form:select>
   				<form:errors path="shop"></form:errors>
   			</div> 
   			<button class="btn btn-success mt-3">Add Me!</button>
   		</form:form>
   </div>
</body>
</html>
