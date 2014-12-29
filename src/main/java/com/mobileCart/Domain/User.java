package com.mobileCart.Domain;

public class User {

	private Integer id;
	private String password;
	private String userName;
	private String firstName;
	private String lastName;
	private String creditCard;
	
	public String getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(String creditCard) {
		this.creditCard = creditCard;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public void setUser(User user){
		this.id = user.id;
		this.password = user.password;
		this.firstName= user.firstName;
		this.lastName = user.lastName;
		this.userName = user.userName;
	}
}
