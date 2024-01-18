package com.nvstech.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nvstech.model.Cart;


@WebServlet("/addToCart")
public class addToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		ArrayList<Cart> cartList = new ArrayList<>();
		PrintWriter out = response.getWriter();
		
		//accessing id from Home(index) page product after clicking add to cart in index page
		int id = Integer.parseInt(request.getParameter("id"));
		//cart object
		Cart cm= new Cart();
		cm.setId(id);
		cm.setQuantity(1);
		
		//need to pass the object by setting session
		//now need to check the session
		HttpSession session = request.getSession(); 
	
		//till now I haven't have any attribute with cart-list 
		//now if it exist then means that cart-list is present
		
		//if attribute is present then it will be stored in to this ArrayList(cart_list)
		//cart_list is the list of products we get for cart from index
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
		
		//so now I use if else for this checking
		if(cart_list == null)
		{
			//means no product added(no object is passed with attribute cart-list
			//so I add cm(with id and quantity Cart object) to ArrayList cartList
			cartList.add(cm);
			//now for this latest "cart-list" attribute, I add this cartList arraylist
			session.setAttribute("cart-list", cartList);
			response.sendRedirect("index.jsp");
			
		}
		else
		{
			cartList = cart_list;
			boolean exist = false;
			
			
			for(Cart c:cart_list)
			{
				if(c.getId() == id)
				{
					exist = true;
					out.println("<h3 style='color: crimson; text-align:center'>Item already exist in cart.<a href='cart.jsp'>Cart page</a> </h3>");
				}
				
			}
			if(!exist)
			{
				cartList.add(cm);
				response.sendRedirect("index.jsp");
			}
		}
	}


}
