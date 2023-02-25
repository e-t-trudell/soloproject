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
    <title>New Shop</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   	<div id="box1" class="container d-flex flex-row justify-content-around mt-5">
   		<h2>Welcome <c:out value="${userId.userName}"/> add a shop!</h2>
   		<a href="/logout"><button class="btn btn-danger m-2">Logout</button></a>
   		<a href="/shop/new"><button class="btn btn-info m-2">+ Add new shop</button></a>
   		<a href="/"><button class="btn btn-primary m-2">+ Add new user</button></a>
   		<a href="/item/new"><button class="btn btn-success m-2">+ Add new item</button></a>
		<a href="/home"><button class="btn btn-info m-2">Home</button></a>
	</div>
	<div id="box6" class="container border border-3 border-primary col-sm-6 offset-sm-3 mt-3">
   		<form:form action="/shop/create" method="post" modelAttribute="newShop">
   			<div>
   				<form:hidden path="shop_id" />
   				<form:hidden path="user.id" />
   				
   			</div>
   			<div class="container m-2">
   				<form:label path="shopName" class="form-label text-warning bg-dark">Title: </form:label>
   				<form:input path="shopName" class="form-control border-info border-3 text-center text-dark"></form:input>
   				<form:errors path="shopName"></form:errors>
   				<button class="btn btn-success mt-3 border border-3 border-dark">Add Me!</button>
			</div>
		<%-- Add this back in once you have items model created --%>
		<%-- <div >
   			<form:label path="items">Author:</form:label>
   			<form:select path="items">
   				<c:forEach var="items" items="${items}">
   					<form:option value="${items.item_id}" path="author">
   						<c:out value="${items.name}"/> <c:out value="${author.lName}"/>
   					</form:option>
   				</c:forEach>
   			</form:select>
   			<form:errors path="items"></form:errors>
   		</div> --%>
			
   			
   </form:form>
   </div>
</body>
</html>
