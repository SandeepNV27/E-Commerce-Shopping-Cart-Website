package com.nvstech.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nvstech.model.Cart;


@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		response.getWriter().println("product id: " + id);
		//from above lines we get the product id of removed product from cart page
		
		if(id != null)
		{
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			if(cart_list != null)
			{
				for(Cart c:cart_list)
				{
					if(c.getId() == Integer.parseInt(id))
					{
						cart_list.remove(cart_list.indexOf(c));
						break;
					}
				}
				response.sendRedirect("cart.jsp");
			}
		}
		else
		{
			response.sendRedirect("cart.jsp");
		}
		
	}

}
