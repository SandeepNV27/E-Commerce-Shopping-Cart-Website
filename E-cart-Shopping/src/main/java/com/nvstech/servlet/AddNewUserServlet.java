package com.nvstech.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nvstech.dao.UserDAO;

@WebServlet("/new-user")
public class AddNewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name = request.getParameter("reg-name");
		String email = request.getParameter("reg-email");
		String password = request.getParameter("reg-password");
		boolean b = UserDAO.registerUser(name, email, password);
		if(b)
		{
			response.sendRedirect("login.jsp");
		}
		else
		{
			response.sendRedirect("signup.jsp");
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
