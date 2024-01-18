<nav class="navbar navbar-expand-lg bg-body-tertiary">
<div class="container">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><h3>JustSHOP</h3></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">HOME</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cart.jsp">CART <span class="badge badge-danger px-1"> ${ cart_list.size() }</span></a>
        </li>
        
        <%
        if(auth != null)
        {
        	%>
        	<li class="nav-item"><a class="nav-link" href="orders.jsp">ORDERS</a></li>
            <li class="nav-item"><a class="nav-link" href="user-logout">LOGOUT</a></li>
            <% 
        }else{%>
        	<li class="nav-item"><a class="nav-link" href="login.jsp">LOGIN</a></li>
        <%}
        %>
        
        
        
      </ul>
    </div>
  </div>
 </div> 
</nav>