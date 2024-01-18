package com.nvstech.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcon 
{
	private static Connection cn=null;
	private static String URL = "jdbc:mysql://localhost:3306/ECART";
	private static String user="root";
	private static String pw="admin";
	
	
	public static Connection getMyConnection()
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			cn=DriverManager.getConnection(URL,user,pw);
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
		return cn;
	}
	
	

}
