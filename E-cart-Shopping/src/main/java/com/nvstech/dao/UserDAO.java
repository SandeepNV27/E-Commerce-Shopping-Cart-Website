package com.nvstech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nvstech.model.User;

public class UserDAO 
{
	private static Connection cn=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
	private static String query=null;
	
	
	public static User userLogin(String email, String password)
	{ 
		User user=null;
		
		try 
		{
			
			query="select * from users where email=? and password=?";
			cn = DBcon.getMyConnection();
			ps=cn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return user;
		
	}
	public static boolean registerUser(String name, String email, String password)
	{
		boolean flag = false;
		query = "insert into users(name,email,password) values (?,?,?)";
		cn = DBcon.getMyConnection();
		try 
		{
			ps=cn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			int x = ps.executeUpdate();
			if(x>0)
			{
				flag = true;
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return flag;
		
	}
	

}
