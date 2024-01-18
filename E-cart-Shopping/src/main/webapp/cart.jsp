<%@page import="java.text.DecimalFormat"%>
<%@page import="com.nvstech.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.nvstech.model.*"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
List<Product> products = ProductDAO.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	cartProduct = ProductDAO.getCartProducts(cart_list);
	double total = ProductDAO.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);

	request.setAttribute("total", total);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Cart page</title>
<%@include file="Includings/head.jsp"%>

<style type="text/css">
.table tbody td {
	vartical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>

</head>

<body>
	<%@include file="Includings/navbar.jsp"%>

	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price: ${ total>0 ? dcf.format(total) : 0 } rupees</h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check out</a>
		</div>
		<table class="table table-light">
			<thead>
			</thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Cancel</th>
			</tr>
			<tbody>

				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=dcf.format(c.getPrice()) %> rupees</td>
					<td>
						<form action="" method="post" class="form-inline">
							<input type="hidden" name="id" value=" <%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn=sm btn=decre"
									href="quantity-Inc-Dec?action=dec&id=<%=c.getId()%>"><i
									class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" class="form-control w-50"
									value=<%=c.getQuantity()%> readonly="readonly"> <a
									class="btn btn=sm btn=incre"
									href="quantity-Inc-Dec?action=inc&id=<%=c.getId()%>"><i
									class="fas fa-plus-square"></i></a>
							</div>
							
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%= c.getId() %>">Remove</a></td>
				</tr>
				<%
				}
				}
				%>

			</tbody>
		</table>
	</div>


	<%@include file="Includings/footer.jsp"%>
</body>
</html>