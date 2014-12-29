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

	$.ajax({
	
		url : "mob/file/cart",
		type : "GET",
	
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
    row.append($("<td><a id = \"as\" onclick=\"myFunction()\">"  + rowData.company + "</a></td>"));
    row.append($("<td>" + rowData.product + "</td>"));
    row.append($("<td>" + rowData.price + "</td>"));
    row.append($("<td>" + rowData.quantity + "</td>"));
}

function myFunction(){
	var companyname = $('#as').html();
	 if (confirm("Do you want to add this product to cart ?") == true) {
		 $.ajax({
				url : "mob/file/addtocart",
				type : "POST",
				data : "companyname=" + companyname ,

				success : function(data, textStatus, jqXHR) {
					alert('success');
					window.location.href = "cart.jsp";
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('Could not process request.. ' + errorThrown);
					window.location.href = "login.jsp";
				}
			});
	    } else {
	        alert("choose another product");
	    }
}

</script>

</head>
<body onload="addCatlog();">
<%@include file="layout/header.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>
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