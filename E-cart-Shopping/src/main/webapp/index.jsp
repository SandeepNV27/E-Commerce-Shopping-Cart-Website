<%@page import="com.nvstech.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.nvstech.model.*"%>
<%@page import="java.util.*" %>


<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
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
<title>Welcome to shopping cart</title>
<%@include file="Includings/head.jsp"%>
</head>
<body>
	<%@include file="Includings/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3" >All Products</div>
		<div class="row">
		<%
			if( !products.isEmpty())
			{
				for(Product p:products)
				{ %>
				<div class="col-md-3">
			
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="product-images/<%= p.getImage() %>" alt="image">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: <%=p.getPrice() %> rupees</h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addToCart?id=<%=p.getId() %>" class="btn btn-dark">Add to Cart</a>
							<a href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-primary">Buy now</a>
						</div>
						
					</div>
				</div>

			</div>
				
				
					
			<%	}
			}
		%>
			
		</div>
	</div>
	<%@include file="Includings/footer.jsp"%>
</body>
</html>