<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Add Catlog</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>

function addCatlog(){
	var companyname = $('#company-name').val();
	var productname = $('#product-name').val();
	var price = $('#price').val();
	var quantity = $('#quantity').val();

	$.ajax({
	
		url : "mob/catlog/addCatlog",
		type : "POST",
		data : "companyname=" + companyname + "&productname=" + productname + "&price=" + price
		+ "&quantity=" + quantity,
		dataType:"text", 

		success : function(data,textStatus, jqXHR) {
			alert('success');
			var obj= jQuery.parseJSON(data);
			drawTable(obj);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('Could not process request.. ' + errorThrown);
			window.location.href = "login.jsp";
		}
	});
}
function drawTable(data) {
    for (var i = 0; i < data.length; i++) {
        drawRow(data[i]);
    }
}
function drawRow(rowData) {
    var row = $("<tr />");
    $("#example").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
    row.append($("<td>" + rowData.company + "</td>"));
    row.append($("<td>" + rowData.product + "</td>"));
    row.append($("<td>" + rowData.price + "</td>"));
    row.append($("<td>" + rowData.quantity + "</td>"));
   
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
											<h3>Add products here</h3>
										</tr>
										<tr>
											<td><h5>Company Name</h5></td>
											<td></td>
											<td><div class="input-group">
													<input type="text" id="company-name" class="required"
														placeholder="Name of Company">
												</div></td>
										</tr>
										<tr></tr>
										<tr>
											<td><h5>Product</h5></td>
											<td></td>
											<td><div class="input-group">
													<input type="text" id="product-name" class="required"
														placeholder="Name of Product">
												</div></td>
										</tr>
										<tr></tr>
										<tr>
											<td><h5>Price</h5></td>
											<td></td>
											<td><div class="input-group">
													<input type="email" id="price" class="required email"
														placeholder="Price">
												</div></td>
										</tr>
										<tr></tr>
										
										<tr>
											<td><h5>Quantity</h5></td>
											<td></td>
											<td><div class="input-group">
													<input type="password" id="quantity" class="required"
														placeholder="Quantity">
												</div></td>
											<td></td>
										</tr>
										<tr></tr>
										
										<tr></tr>
										<tr>
											<td></td>
											<td></td>
											<td><div class="col-sm-offset-2 col-sm-10">
													<button id="signup" class="btn btn-primary" type="button"
														onclick="addCatlog()">Add</button>
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
		<table id="example" class="table table-hover">
					<thead>
						<tr>
							<th>Company Name</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Quantity</th>
						</tr>
					</thead>
				</table>
</body>
</html>