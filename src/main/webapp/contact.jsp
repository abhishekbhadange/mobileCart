<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Contact Us</title>

<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<meta name="keywords" content="Mobilestore iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<link href='http://fonts.googleapis.com/css?family=Londrina+Solid|Coda+Caption:800|Open+Sans' rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript">
function contactDetails(){
	var contactName = $("#contactName").val();
	var contactPersonEmail = $("#contactPersonEmail").val();
	var contactPersonMob = $("#contactPersonMob").val();
	var contactSubj = $("#contactSubj").val();
	
	$.ajax({
		
		url : "mob/file/contact",
		type : "POST",
		data : "contactName=" + contactName + "&contactPersonEmail=" + contactPersonEmail + "&contactPersonMob=" + contactPersonMob
				+ "&contactSubj=" + contactSubj,
		dataType:"text",
		success : function() {
			alert('success');
			window.location.href = "index.jsp";
		},
		error : function(errorThrown) {
			alert('Thankyou for contacting us you will recieve and email shortly !');
			window.location.href = "login.jsp";
		}
		
	});
	
	
}

</script>

</head>
<body>

<%@include file="layout/header.jsp"%>
<br><br>

   <div class="clear"> </div>
		    <div class="wrap">
		    <div class="content">
		    	<div class="section group">				
				<div class="col span_1_of_3">
					<div class="contact_info">
			    	 	<h2>Find Us Here</h2>
			    	 		<div class="map">
					   			<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2960.870317369434!2d-75.96697200000001!3d42.088828!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89daeeb8741e3169%3A0x73e79cf1ee693edf!2sBinghamton+University!5e0!3m2!1sen!2sus!4v1417387841389" width="379" height="300" frameborder="0" style="border:0"></iframe>
					   		</div>
      				</div>
      			<div class="company_address">
				     	<h2>Company Information :</h2>
						    	<p>Binghamton University,</p>
						   		<p>4400 Vestal Pkwy E, Binghamton, NY</p>
						   		<p>USA</p>
				   		<p>Phone:(607) 123 4567</p>
				   		<p>Fax: (000) 000 00 00 0</p>
				 	 	<p>Email: <span>xyz@binghamton.edu</span></p>
				   		<p>Follow on: <span>Facebook</span>, <span>Twitter</span></p>
				   </div>
				</div>				
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h2>Contact Us</h2>
					    <form>
					    	<div>
						    	<span><label>NAME</label></span>
						    	<span><input type="text" id="contactName"></span>
						    </div>
						    <div>
						    	<span><label>E-MAIL</label></span>
						    	<span><input type="text" id="contactPersonEmail"></span>
						    </div>
						    <div>
						     	<span><label>MOBILE.NO</label></span>
						    	<span><input type="text" id="contactPersonMob"></span>
						    </div>
						    <div>
						    	<span><label>SUBJECT</label></span>
						    	<span><textarea id="contactSubj"> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="submit" value="Submit"></span>
						  </div>
					    </form>
				    </div>
  				</div>				
			  </div>
			  	 <div class="clear"> </div>
	</div>
	<div class="clear"> </div>
		    </div>
		   
<%@include file="layout/footer.jsp"%>

</body>
</html>