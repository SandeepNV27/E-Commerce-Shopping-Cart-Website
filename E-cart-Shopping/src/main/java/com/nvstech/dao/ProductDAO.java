package com.nvstech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import com.nvstech.model.*;

public class ProductDAO 
{
	private static Connection cn=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
	private static String query=null;
	
	public static List<Product> getAllProducts()
	{
		List<Product> products= new ArrayList<Product>();
		
		query = "select * from products";
		
		
		try 
		{
			cn=DBcon.getMyConnection();
			ps=cn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return products;
		
		
	}
	public static List<Cart> getCartProducts(ArrayList<Cart> cartList)
	{
		List<Cart> products  = new ArrayList<Cart>();
		
		if(cartList.size() > 0)
		{
			for(Cart item: cartList )
			{
				query = "select * from products where id=?";
				
				try 
				{
					cn = DBcon.getMyConnection();
					ps = cn.prepareStatement(query);
					ps.setInt(1, item.getId());
					rs=ps.executeQuery();
					while(rs.next())
					{
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price") * item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
						
					}
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		return products;
	}
	
	public static double getTotalCartPrice(ArrayList<Cart> cartList)
	{
		double sum = 0;
		if(cartList.size()>0)
		{
			for(Cart item : cartList)
			{
				query = "select price from products where id=?";
				try 
				{
					cn = DBcon.getMyConnection();
					ps = cn.prepareStatement(query);
					ps.setInt(1, item.getId());
					rs = ps.executeQuery();
					while(rs.next()) 
					{
						sum = sum + rs.getDouble("price") * item.getQuantity();
					}
							
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
				
			}
		}		
		return sum;
	}
	
	public static Product getSingleProduct(int id) {
		 Product row = null;
	        try {
	            query = "select * from products where id=? ";
	            cn = DBcon.getMyConnection();
	            ps = cn.prepareStatement(query);
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }

}
