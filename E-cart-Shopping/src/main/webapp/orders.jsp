<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<%@page import="com.nvstech.model.*" %>
<%@page import="com.nvstech.dao.*" %>
<%@page import="com.nvstech.servlet.*" %>
<%@page import="java.text.DecimalFormat"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if(auth != null)
	{
		request.setAttribute("auth", auth);
		orders = OrderDAO.userOrders(auth.getId());
		
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
	
	List<Product> products = ProductDAO.getAllProducts();
	
	ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list != null)
	{
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/Includings/head.jsp"%>
<title>E-Commerce Cart</title>
</head>
<body>
	<%@include file="/Includings/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>

			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>

			</tbody>
		</table>
	</div>
	<%@include file="/Includings/footer.jsp"%>
</body>
</html>