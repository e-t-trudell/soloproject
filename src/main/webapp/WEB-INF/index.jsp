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
    <title>Landing</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container d-flex flex-column align-content-center">
		<h2>Welcome <c:out value="${user.userName}"/></h2>
   		<h5>Did you come for the cookies?</h5>
   </div>
   <c:if test="${emailError != null}">
		<div class="alert alert-warning" role="alert">
			<p><c:out value="${emailError}"></c:out></p>
		</div>
	</c:if>
	<c:if test="${regError != null}">
		<div class="alert alert-warning" role="alert" >
			<p>${regError}</p>
		</div>
	</c:if>
	<c:if test="${logError != null}">
		<div class="alert alert-warning" role="alert" >
			<p>${logError}</p>
		</div>
	</c:if>
   <div class="container d-flex flex-row justify-content-between" id="holdMe" style="background-image:url('https://imagewerx.us/wp-content/uploads/2019/03/San-Juan-Mountains-30x40.jpg');">
   		<div class="col-sm-5 border border-success border-3 m-2 p-5 ">
   			<form:form action="/register" method="post" modelAttribute="newUser">
   				<div class="form-group row align-items-end">
   					<form:label path="userName" class="col-sm-3 col-form-label text-light  bg-dark mb-3 p-2">User Name:</form:label>
   					<div class="col-sm-9">
   						<form:input path="userName" class="form-control border border-info mb-2"></form:input>
   					</div>
   					<form:errors path="userName"></form:errors>
   				</div>
   				<div class="form-group row align-items-end">
   					<form:label path="email" class="col-sm-3 col-form-label text-light bg-dark mb-3 p-2">Email:</form:label>
   					<div class="col-sm-9">
   						<form:input path="email" class="form-control border border-info mb-2"></form:input>
   					</div>
   					<form:errors path="email"></form:errors>
   				</div>
   				<div class="form-group row align-items-end">
   					<form:label path="password" class="col-sm-3 col-form-label text-light bg-dark mb-3 p-2">Password:</form:label>
   					<div class="col-sm-9">
   						<form:input path="password" type="password" class="form-control border border-info mb-2"></form:input>
   					</div>
   					<form:errors path="password"></form:errors>
   				</div>
   				<div class="form-group row align-items-end">
   					<form:label path="confirm" class="col-sm-3 col-form-label text-light bg-dark mb-3 p-2">Confirm Password:</form:label>
   					<div class="col-sm-9">
   						<form:input path="confirm" type="password" class="form-control border border-info mb-2"></form:input>
   					</div>
   					<form:errors path="confirm"></form:errors>
   				</div>
   				<button class="btn btn-success border border-3 border-warning">Create User</button>
   			</form:form>
   		</div>
   		<div class="col-sm-5 border border-success border-3 m-2 p-5">
   			<form:form action="/login" method="post" modelAttribute="newLogin">
   				<div class="form-group row align-items-end">
   					<form:label path="email" class="col-sm-3 col-form-label text-light bg-dark mb-3">Email:</form:label>
   					<div class="col-sm-9">
   						<form:input path="email" class="form-control border border-info mb-2"></form:input>
   					</div>
   					<form:errors path="email"></form:errors>
   				</div>
   				<div class="form-group row align-items-end">
   					<form:label path="password" class="col-sm-3 col-form-label text-light bg-dark mb-3">Password:</form:label>
   					<div class="col-sm-9">
   						<form:input path="password" type="password" class="form-control border border-info mb-2"></form:input>
   					</div>
   					<form:errors path="password"></form:errors>
   				</div>
   				<button class="btn btn-success border border-3 border-warning">Login</button>
   			</form:form>
   		</div>
   </div>
   
</body>
</html>
