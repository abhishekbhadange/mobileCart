package com.mobileCart.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mobileCart.Domain.User;
import com.mobileCart.Domain.addcart;
import com.mobileCart.Domain.catlog;

public class DbConnection {

	private static String connectionString = "jdbc:mysql://localhost:3306/mobileCart";
	private static String dbUsername = "root";
	private static String dbPassword = "root";
	
	public boolean loginCheck(String username, String password){
	    String query;
	    boolean login = false;

	    try {
	        Class.forName("com.mysql.jdbc.Driver").newInstance();
	        Connection con = DriverManager.getConnection(connectionString, dbUsername, dbPassword);
	        Statement stmt = (Statement) con.createStatement();
	        query = "SELECT username, password FROM user_details WHERE username='" + username + "' AND password='" + password + "';";
	        System.out.println("username"+username+"pwd"+password);
	        stmt.executeQuery(query);
	        ResultSet rs = stmt.getResultSet();
	        login = rs.first(); 
	        con.close();
	    } catch (InstantiationException e) {
	        e.printStackTrace();
	    } catch (IllegalAccessException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return login;
	}
	
	public User getUserDetails (String uname){
		String query;
		String first_name, last_name,username, password, credit_card;
		User userD = new User();
	    try {
	        Class.forName("com.mysql.jdbc.Driver").newInstance();
	        Connection con = DriverManager.getConnection(connectionString, dbUsername, dbPassword);
	        Statement stmt = (Statement) con.createStatement();
	        query = "SELECT * FROM user_details WHERE username ='"+uname+"';";
	        ResultSet rs = stmt.executeQuery(query);
	        if ( rs.next() ) {
	        	 first_name = rs.getString("first_name");
	        	 last_name = rs.getString("last_name");
	        	 username = rs.getString("username");
	        	 password = rs.getString("password");
	        	 credit_card = rs.getString("credit_card");
	             userD.setFirstName(first_name);
	             userD.setLastName(last_name);
	             userD.setUserName(username);
	             userD.setPassword(password);
	             userD.setCreditCard(credit_card);
	        } else{
	        	return null;
	        }
	        con.close();
	       
	    } catch (InstantiationException e) {
	        e.printStackTrace();
	    } catch (IllegalAccessException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return userD;
	}
	
	public static String details(String companyName, int price, int quantity, String productName){
	String Cname = companyName;
	String Pname =  productName;
	int prc = price;
	int qt = quantity;
		
		System.out.println(" qt "+qt);
		final String query= "INSERT into details(Cname, Pname, prc, qt)values(?,?,?,?) ";

		try {
	        Class.forName("com.mysql.jdbc.Driver").newInstance();
	        Connection con = DriverManager.getConnection(connectionString, dbUsername, dbPassword);
	       
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setString(1, Cname);
	        pstmt.setString(2, Pname);
	        pstmt.setInt(3, prc);
	        pstmt.setInt(4, qt);
	        pstmt.executeUpdate();
	        
	        System.out.println("details Inserted successfully");
	        con.close();
	       
	    } catch (InstantiationException e) {
	        e.printStackTrace();
	    } catch (IllegalAccessException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	 
		return null;
	}
	
	public static addcart addtocart(String companyName, String productName){
		String cName = companyName;
		String pName = productName;
		
		 final String query = "SELECT * FROM details WHERE Cname ='"+cName+"' AND Pname = '"+pName+"';";
		
		 addcart ad = new addcart();
		 try {
		        Class.forName("com.mysql.jdbc.Driver").newInstance();
		        Connection con = DriverManager.getConnection(connectionString, dbUsername, dbPassword);
		        Statement stmt = (Statement) con.createStatement();
		        ResultSet rs = stmt.executeQuery(query);
		        if ( rs.next() ) {
		        	 String c = rs.getString("Cname");
		        	 String p = rs.getString("Pname");
		        	 int pr = rs.getInt("prc");
		        	 int q = rs.getInt("qt");
		        
		        	 ad.setCompany(c);
		        	 ad.setProduct(p);
		        	 ad.setPrice(pr);
		        	 ad.setQuantity(q);
		        }else{
		        	return null;
		        }
		        con.close();
		        System.out.println("after ad fill close conn and now add addcart");
		        DbConnection.insertaddcart(ad.getCompany(),ad.getProduct(),ad.getPrice(),ad.getQuantity());
		       
		 } catch (InstantiationException e) {
		        e.printStackTrace();
		    } catch (IllegalAccessException e) {
		        e.printStackTrace();
		    } catch (ClassNotFoundException e) {
		        e.printStackTrace();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		 return ad;
	}
	
	public static String insertaddcart(String companyName, String productName, int price, int quantity){
		
		String Cname = companyName;
		String Pname =  productName;
		int prc = price;
		int qt = quantity;
			
			System.out.println(" qt "+qt);
			final String query= "INSERT into addcart(Cname, Pname, prc, qt)values(?,?,?,?) ";
			
			try {
		        Class.forName("com.mysql.jdbc.Driver").newInstance();
		        Connection con = DriverManager.getConnection(connectionString, dbUsername, dbPassword);
		        
		        PreparedStatement pstmt = con.prepareStatement(query);
		        pstmt.setString(1, Cname);
		        pstmt.setString(2, Pname);
		        pstmt.setInt(3, prc);
		        pstmt.setInt(4, qt);
		        pstmt.executeUpdate();
		        
		        System.out.println("cart Inserted successfully");
		        con.close();
		       
		    } catch (InstantiationException e) {
		        e.printStackTrace();
		    } catch (IllegalAccessException e) {
		        e.printStackTrace();
		    } catch (ClassNotFoundException e) {
		        e.printStackTrace();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		return null;
	}
	
	public static List<catlog> getDetails(){
		
		final String query= "SELECT *FROM details ;";
		String Cname, Pname;
		int prc,qt;
		List<catlog> ctloglist = new ArrayList<catlog>();
		catlog ct ;
		try {
	        Class.forName("com.mysql.jdbc.Driver").newInstance();
	        Connection con = DriverManager.getConnection(connectionString, dbUsername, dbPassword);
	        Statement stmt = (Statement) con.createStatement();
	     
		  ResultSet rs = stmt.executeQuery(query);
		  while ( rs.next() ) {
	        	 Cname = rs.getString("Cname");
	        	 Pname = rs.getString("Pname");
	        	 prc = rs.getInt("prc");
	        	 qt = rs.getInt("qt");
	        	 ct = new catlog();
	        	 ct.setCompany(Cname);
	        	 ct.setProduct(Pname);
	        	 ct.setPrice(prc);
	        	 ct.setQuantity(qt);
	        	 
	        	 ctloglist.add(ct);
	        	 
	        	 System.out.println(" company name is ");
		  }
		     
			    } catch (InstantiationException e) {
			        e.printStackTrace();
			    } catch (IllegalAccessException e) {
			        e.printStackTrace();
			    } catch (ClassNotFoundException e) {
			        e.printStackTrace();
			    } catch (SQLException e) {
			        e.printStackTrace();
			    }
			   
		return ctloglist;
	}
	
	public static List<catlog> getCart(){
		final String query= "SELECT *FROM addcart ;";
		String Cname, Pname;
		int prc,qt;
		List<catlog> ctloglist = new ArrayList<catlog>();
		catlog ct ;
		try {
	        Class.forName("com.mysql.jdbc.Driver").newInstance();
	        Connection con = DriverManager.getConnection(connectionString, dbUsername, dbPassword);
	        Statement stmt = (Statement) con.createStatement();
	     
		  ResultSet rs = stmt.executeQuery(query);
		  while ( rs.next() ) {
	            
	        	Cname = rs.getString("Cname");
	        	 Pname = rs.getString("Pname");
	        	 prc = rs.getInt("prc");
	        	 qt = rs.getInt("qt");
	        	 ct = new catlog();
	        	 ct.setCompany(Cname);
	        	 ct.setProduct(Pname);
	        	 ct.setPrice(prc);
	        	 ct.setQuantity(qt);
	        	 
	        	 ctloglist.add(ct);
	        	 
	        	 System.out.println(" company name is ");
		  }
		     
			    } catch (InstantiationException e) {
			        e.printStackTrace();
			    } catch (IllegalAccessException e) {
			        e.printStackTrace();
			    } catch (ClassNotFoundException e) {
			        e.printStackTrace();
			    } catch (SQLException e) {
			        e.printStackTrace();
			    }
			   
		return ctloglist;
	
	}
	
	public void insertUser(User user){
	    final String query= "INSERT into user_details(first_name, last_name, username, password, credit_card)values(?,?,?,?,?) ";
		Connection con=null;
	    try {
	        Class.forName("com.mysql.jdbc.Driver").newInstance();
	         con = DriverManager.getConnection(connectionString, dbUsername, dbPassword);
	       
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setString(1, user.getFirstName());
	        pstmt.setString(2, user.getLastName());
	        pstmt.setString(3, user.getUserName());
	        pstmt.setString(4, user.getPassword());
	        pstmt.setString(5, user.getCreditCard());
	        
	        pstmt.executeUpdate();
	      
	        System.out.println("User Inserted successfully");
	        con.close();
	    } catch (InstantiationException e) {
	        e.printStackTrace();
	    } catch (IllegalAccessException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally
	    {
	    	if(con!=null)
	    	{
	    		try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
	    	}
	    }
	    
	}
}
