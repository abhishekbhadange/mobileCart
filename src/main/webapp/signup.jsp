
<html lang="en">
<head>
<meta charset="utf-8">
<title>Login &amp; mobileCart</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap-responsive.css" rel="stylesheet"
	media="screen" type="text/css">
<link href="bootstrap/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen" type="text/css">
<script type="text/javascript" src="jsbootstrap/bootstrap.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap.min.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-dropdown.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-alert.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-button.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-carousel.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-scrollspy.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-modal.js" /></script>

<script type="text/javascript">
	function checkPasswordMatch() {
		//var checkPasswordMatch = function() {
		var password = $("#password").val();
		var rePassword = $("#reEnterPasswordInput").val();
		if (password != rePassword)
			$("#divCheckPasswordMatch").html("Passwords do not match!");
		else {
			$("#divCheckPasswordMatch").html("");
		}
	}

	function uploadFormData() {
		$("#reEnterPasswordInput").keyup(checkPasswordMatch());

		var fname = $('#login-firstname').val();
		var lname = $('#login-lastname').val();
		var email = $('#login-email').val();
		var password = $('#password').val();
		var cc= $('#cc').val();

		$.ajax({
			url : "mob/file/signup",
			type : "POST",
			data : "fname=" + fname + "&lname=" + lname + "&email=" + email
					+ "&password=" + password + "&cc=" + cc,

			success : function(data, textStatus, jqXHR) {
				alert('success');
				window.location.href = "index.jsp";
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('Could not process request.. ' + errorThrown);
				window.location.href = "login.jsp";
			}
		});
	}
</script>
</head>
<body>
	<%@include file="layout/header.jsp"%>
	<div>
		<div>
			<div
				style="background-color: ghostwhite; margin-top: 100px; margin-left: 100px; margin-right: 200px; height: auto; -webkit-box-shadow: 3px 0px 5px #888888; -moz-box-shadow: 3px 0px 5px #888888; box-shadow: 3px 0px 5px #888888; padding: 30px;">
				<div id="container" style="padding-top: 40px;">
					<div class="container-fluid">
						<div class="row-fluid">
							<div id="sidebar" class="span2">
								<!--Sidebar content-->
								<ul id="sidebar-list" class="nav nav-list">
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane active" id="NewUserSignUp">
									<table cellpadding="5px">
										<!--Body content-->
										<tr>
											<h3>Create your account here</h3>
										</tr>
										<tr>
											<td><h5>First Name</h5></td>
											<td></td>
											<td><div class="input-group">
													<input type="text" id="login-firstname" class="required"
														placeholder="First Name">
												</div></td>
										</tr>
										<tr></tr>
										<tr>
											<td><h5>Last Name</h5></td>
											<td></td>
											<td><div class="input-group">
													<input type="text" id="login-lastname" class="required"
														placeholder="Last Name">
												</div></td>
										</tr>
										<tr></tr>
										<tr>
											<td><h5>Email</h5></td>
											<td></td>
											<td><div class="input-group">
													<input type="email" id="login-email" class="required email"
														placeholder="Email ID">
												</div></td>
										</tr>
										<tr></tr>
										<tr>
											<td><h5>Password</h5></td>
											<td></td>
											<td><div class="input-group">
													<input type="password" id="password" name="passwordInput"
														class="required" placeholder="Password">
												</div></td>
										</tr>
										<tr></tr>
										<tr>
											<td><h5>Re-enter Password</h5></td>
											<td></td>
											<td><div class="input-group">
													<input type="password" id="reEnterPasswordInput"
														name="reEnterPasswordInput" class="required"
														placeholder="Re-enter Password"
														onChange="checkPasswordMatch();">
												</div></td>
											<td><div class="registrationFormAlert"
													id="divCheckPasswordMatch"></div></td>
										</tr>
										<tr></tr>
										<tr>
											<td><h5>Credit Card</h5></td>
											<td></td>
											<td><div class="input-group">
													 <input type="tel" pattern="^\d{4}-\d{4}-\d{4}-\d{4}$" placeholder="xxxx-xxxx-xxxx" id="cc">
												</div></td>
										</tr>
										<tr></tr>
										<tr>
											<td></td>
											<td></td>
											<td><div class="col-sm-offset-2 col-sm-10">
													<button id="signup" class="btn btn-primary" type="button"
														onclick="uploadFormData()">Register</button>
												</div></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function PassVerify() {
			var pass1 = $('#password').val();
			var pass2 = $('#confirmpassword').val();
			var message = document.getElementById('confirmMessage');
			var badColor = "red";
			if (password == confirmpassword) {
				message.innerHTML = "";
			} else {
				message.style.color = badColor;
				message.innerHTML = "Passwords Do Not Match..";
			}
		}
		function EmailVerify() {
			var email = document.getElementById('email').value;
			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			var message = document.getElementById('emailMessage');
			var badColor = "red";
			message.style.color = badColor;

			if (!filter.test(email)) {
				$('#emailMessage').html("Please Enter valid Email");
				return false;
			} else {
				$('#emailMessage').html("");
				$.get('/check_email?email=' + email, function(data) {
					if (data == "true")
						$('#emailMessage').html("Email already exists");
				});
			}
			return true;
		}
		function validateAndSubmit() {

		}
	</script>

</body>
</html>



