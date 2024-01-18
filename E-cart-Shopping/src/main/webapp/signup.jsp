<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.nvstech.model.*" %>

<%
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth != null)
	{
		response.sendRedirect("index.jsp");
	}
	
	ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list != null)
	{
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Shopping cart Registration</title>
<%@include file="Includings/head.jsp" %>
</head>
<body>
<%@include file="Includings/navbar.jsp" %>

<div class="container">
<div class="card w-50 mx-auto my-5">
<div class="card-header text-center">New User Registration</div>
<div class="card-body">
	<form action="new-user" method="post">
		
		<div class="form-group">
			<label>Name</label>
			<input type="text" class="form-control" name="reg-name" placeholder="Enter your Full Name" required>
		</div>
	
		<div class="form-group">
			<label>Email Address</label>
			<input type="email" class="form-control" name="reg-email" placeholder="Enter your Email" required>
		</div>
		
		<div class="form-group">
			<label>Password</label>
			<input type="password" class="form-control" name="reg-password" placeholder="********" required>
		</div>
		
		<div class="text-center">
		<button type="submit" class="btn-btn-primary">Register</button>
		</div>
		<br>
		
	
	</form>
</div>
</div>
</div>

<%@include file="Includings/footer.jsp" %>
</body>
</html>