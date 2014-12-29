package com.mobileCart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.http.client.protocol.ResponseAuthCache;
import org.apache.http.protocol.ResponseContent;

import com.amazonaws.services.s3.model.Bucket;
import com.mobileCart.Dao.DbConnection;
import com.mobileCart.Domain.User;
import com.mobileCart.Domain.catlog;
import com.mobileCart.Domain.contactDetails;
import com.mobileCart.Facade.AmazonSES;
import com.google.gson.Gson;
import com.sun.jersey.api.Responses;
import com.sun.jersey.core.spi.factory.ResponseBuilderHeaders;

@Path("/file")
public class RestfullService {
	
	@POST
	@Path("/adminlogin")
	public Response adminLogin(@FormParam("email") String email, 
			@FormParam("password") String password, 
			@Context HttpServletRequest req) {
	
		System.out.println("admin details are "+email +" and passowrd is "+password);
		
		String adminUsername ="abc@binghamton.edu";
		String adminPassword ="administrator";
		
		if(adminUsername.equalsIgnoreCase(email) && adminPassword.equalsIgnoreCase(password)){
			String output="Admin is successfully logged";
			return Response.status(200).entity(output).build();
		}
		
		System.out.println("User Invalid");
		String invalidadmin="admin invlaid";
		return Response.status(400).entity(invalidadmin).build();
	}
	
	@POST
	@Path("/login")
	public Response userLogin(@FormParam("email") String email, 
			@FormParam("password") String password, 
			@Context HttpServletRequest req) {
		
		String invalidUser = "Invalid User";
		System.out.println("Username is: "+email);
		DbConnection dbcon = new DbConnection();
		
		if(dbcon.loginCheck(email, password))
		{
		String output = "Login Successful for "+ email;
		System.out.println("User Validated");
		HttpSession session= req.getSession(true);
		session.setAttribute("username", email);
		session.setAttribute("sessionId", session.getId());
		
		User user =	dbcon.getUserDetails(email);
		user.getFirstName();
		System.out.println("users firsname"+user.getFirstName());
		
		session.setAttribute("usersfirstname", user.getFirstName());
		session.setAttribute("userslastname", user.getLastName());
		
		return Response.status(200).entity(output).build();
		}
		else{
			System.out.println("User Invalid");
			return Response.status(400).entity(invalidUser).build();	
		}
	}
	
	@POST
	@Path("/signup")
	public Response userprofile(@FormParam("fname") String fname,
			@FormParam("lname") String lname,
			@FormParam("email") String email, 
			@FormParam("password") String password,
			@FormParam("cc") String cc,
			@Context HttpServletRequest req) {
			System.out.println("name is: "+fname);
			User user = new User();
			user.setFirstName(fname);
			user.setLastName(lname);
			user.setUserName(email);
			user.setPassword(password);
			user.setCreditCard(cc);
			System.out.println("surname of the user is"+user.getLastName());
			String output = "Thankyou for registring with us you will recieve email shortly "+ user.getFirstName();
			DbConnection dbcon = new DbConnection();
			dbcon.insertUser(user);
			
			HttpSession session= req.getSession(true);
			session.setAttribute("username", email);
			session.setAttribute("sessionId", session.getId());
			session.setAttribute("usersfirstname", fname);
			session.setAttribute("userslastname", lname);
	
			System.out.println("User added");
		
		return Response.status(200).entity(output).build();
	}
	
	@POST
	@Path("/contact")
	public Response contactUser(@FormParam("contactName") String contactName,
			@FormParam("contactPersonEmail") String contactPersonEmail,
			@FormParam("contactPersonMob") int contactPersonMob, 
			@FormParam("contactSubj") String contactSubj ){
		
			contactDetails cd = new contactDetails();
			cd.setContactName(contactName);
			cd.setContactPersonEmail(contactPersonEmail);
			cd.setContactPersonMob(contactPersonMob);
			cd.setContactSubj(contactSubj);
			
			System.out.println("contact persons email address is: "+cd.getContactPersonEmail());
			
			AmazonSES.sendEmail(cd.getContactPersonEmail(), cd.getContactName(), cd.getContactPersonMob());
			
			String output = "Thankyou for registring with us you will recieve email shortly "+ cd.getContactSubj();
			
			return Response.status(200).entity(output).build();
	}
	
	@POST
	@Path("/logout")
	public Response logout(@Context HttpServletRequest req) {
		
		System.out.println("inside logout function ");
		HttpSession session= req.getSession(false);
		
		System.out.println("inside logout before httpservlet logout");
		try {
			req.logout();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		System.out.println("before session invalidate ");
		session.invalidate();
		System.out.println("User has logged out !");
		String output = "User has succesfully logged out";
		
		return Response.status(200).entity(output).build();
		
	}
	
	@POST
	@Path("/addtocart")
	
	public Response addtocart(@FormParam("companyName") String companyName,
							@FormParam("productName") String productName){
		
		System.out.println("this is the value of Company: " + companyName + " Product: " + productName);
		
		catlog c = new catlog();
		c.setCompany(companyName);
		c.setProduct(productName);
		System.out.println("name of company: " + c.getCompany() + ", product: " + c.getProduct());
		DbConnection.addtocart(c.getCompany(), c.getProduct());
		System.out.println("DB addcart added sucessfully.");
		
		return null;
	}
	
	@GET
	@Path("/cart")
	@Produces(MediaType.APPLICATION_JSON)
	public String productCatlog() {
		System.out.println("Inside productCatlog!");
		List<catlog> allitems=new ArrayList<catlog>();
		allitems = DbConnection.getCart();

		Gson gson = new Gson();
		String catlogJson= gson.toJson(allitems);
		System.out.println("string of json is "+catlogJson);
		
		return catlogJson;
	}
	
}
