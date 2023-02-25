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
    <title>Add Item</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div id="box1" class="container d-flex flex-row justify-content-between m-2 p-2">
   		<h2>Welcome <c:out value="${userId.userName}"/> add an item!</h2>
		<a href="/home"><button class="btn btn-info m-2">Home</button></a>
		<a href="/logout"><button class="btn btn-danger  m-2">Logout</button></a>
   		<a href="/shop/new"><button class="btn btn-success  m-2">+ Add new shop</button></a>
   </div>
   <div id="box5" class="container border border-3 border-info m-3 p-2  d-flex flex-column">
   		<form:form action="/item/create" method="post" modelAttribute="newItem">
   			<div>
   				<form:hidden path="item_id" />
   			</div>
   			<div>
   				<form:label path="description" class="form-label text-warning bg-dark mt-3">Description: </form:label>
   				<form:input path="description" class="form-control border-info border-3 "></form:input>
   				<form:errors path="description"></form:errors>
			</div>
			<div>
   				<form:label path="price" class="form-label text-warning bg-dark mt-3">Price: $ </form:label>
   				<form:input path="price" class="form-control border-info border-3 "></form:input>
   				<form:errors path="price"></form:errors>
			</div>
			<div>
   				<form:label path="quantity" class="form-label text-warning bg-dark mt-3">Quantity:  </form:label>
   				<form:input path="quantity" type="number" class="form-control border-info border-3 "></form:input>
   				<form:errors path="quantity"></form:errors>
			</div>
		<!-- shop -->
			<div >
   				<form:label path="shop" class="form-label text-warning bg-dark mt-3">Shop:</form:label>
   				<form:select path="shop" class="form-select border-info border-3 ">
   					<c:forEach var="shop" items="${shops}">
   						<div>
   							<c:if test="${userId.id == shop.user.id}">
   								<form:option value="${shop.shop_id}" path="shop">
   									<c:out value="${shop.shopName}"/>
   								</form:option>
   							</c:if>
   						</div>
   					</c:forEach>
   				</form:select>
   				<form:errors path="shop"></form:errors>
   			</div> 
		<%-- 
		<div>
   			<form:label path="filePath">Image: </form:label>
   			<form:input path="filePath" type="file" name="file" id="file" class="border border-3 border-info"></form:input>
   			<form:errors path="filePath"></form:errors>
		</div> 
		--%>
		<%-- <div>
   			<form:hidden path="shop.id" />
   		</div>  --%>
   			<button class="btn btn-success mt-3">Add Me!</button>
   		</form:form>
   </div>
</body>
</html>
