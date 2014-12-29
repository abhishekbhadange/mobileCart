<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">



<link href="bootstrap/bootstrap.min.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap-responsive.css" rel="stylesheet"
	media="screen" type="text/css">
<link href="bootstrap/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen" type="text/css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="jsbootstrap/bootstrap.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap.min.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-dropdown.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-alert.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-button.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-carousel.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-scrollspy.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-modal.js" /></script>

<!-- trial version -->

<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<meta name="keywords" content="Mobilestore iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<link href='http://fonts.googleapis.com/css?family=Londrina+Solid|Coda+Caption:800|Open+Sans' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/responsiveslides.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="js/responsiveslides.min.js"></script>


<!-- trial version end -->
<body>
<%@include file="layout/header.jsp"%>

 <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/Nexus5.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h2 style="color: white;">Nexus 5 </h2>
              <p class="lead">Capture the everyday and the epic in fresh new ways.</p>
              <br>
              <a class="btn btn-large btn-primary" href="#">Sign up today</a>
            </div>
          </div>
        </div>
        
        <div class="item">
          <img src="img/samsung-galaxy-s4.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1 style="color: white;">Samsung galaxy S4</h1>
              <p >The next big thing is here</p>
              <br>
              <a class="btn btn-large btn-primary" href="#">Browse gallery</a>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div><!-- /.carousel -->

<hr class="featurette-divider">

<!-- Thumbnails -->

<div class="row-fluid">
            <ul class="thumbnails">
              <li class="span4">
                <div class="thumbnail">
                  <img data-src="holder.js/300x200" alt="">
                  <div class="caption">
                    <h3>Hot Deals !</h3>
                    <p>Buy Iphone 5s @ $199 only. </p>
                    <p>Samsung just for $299.</p>
                    <p> <a href="#" class="btn">Details >></a></p>
                  </div>
                </div>
              </li>
              <li class="span4">
                <div class="thumbnail">
                  <img data-src="holder.js/300x200" alt="">
                  <div class="caption">
                    <h3>Trending Picks</h3>
                    <p>1. Iphone 6</p>
                    <p>2. Samsung Galaxy S5</p>
                    <p>3. Nexus 5</p>
                    <p>4. HTC one(M7)</p>
                    <p>5. Sony xperia Z1s</p>
                    <p>6. LG G2</p>
                     <p> <a href="#" class="btn">Details >></a></p>
                  </div>
                </div>
              </li>
              <li class="span4">
                <div class="thumbnail">
                  <img src="img/images.jpeg" alt="">
                  <div class="caption">
                    <h3>Coming soon</h3>
                    <p><a href="#" class="btn">Details >></a></p>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          
          
    <!-- thumnails finish -->      

<!-- trial version -->
<hr class="featurette-divider">

  <div class="content-grids">
		    	<h4>Deals of the day</h4>
		    	<div class="section group">
				<div class="grid_1_of_4 images_1_of_4 products-info">
					 <img src="images/m1.jpg">
					 <div id = "device1"><a href="#">Ascend G730</a></div>
					 <h3>$260</h3>
					 <ul>
					 	<li><a  class="cart" data_device="device1" OnClick="deviceDetails(this)"> </a></li>
					 	<li><a  class="i" href="view.jsp"> </a></li>
					 	<li><a  class="Compar" href="#"> </a></li>
					 	<li><a  class="Wishlist" href="#"> </a></li>
					 </ul>
				</div>
				<div class="grid_1_of_4 images_1_of_4 products-info">
					 <img src="images/m2.jpg">
					  <div id = "device2"><a href="#">iPhone 4s</a></div>
					 <h3>$300</h3>
					 <ul>
					 	<li><a  class="cart" data_device="device2" OnClick="deviceDetails(this)"> </a></li>
					 	<li><a  class="i" href="#"> </a></li>
					 	<li><a  class="Compar" href="#"> </a></li>
					 	<li><a  class="Wishlist" href="#"> </a></li>
					 </ul>
				</div>
				<div class="grid_1_of_4 images_1_of_4 products-info">
					 <img src="images/m7.jpg">
					  <div id = "device3"><a href="#">HTC One</a></div>
					 <h3>$280</h3>
					 <ul>
					 	<li><a  class="cart"  data_device="device3" OnClick="deviceDetails(this)"> </a></li>
					 	<li><a  class="i" href="#"> </a></li>
					 	<li><a  class="Compar" href="#"> </a></li>
					 	<li><a  class="Wishlist" href="#"> </a></li>
					 </ul>
				</div>
				<div class="grid_1_of_4 images_1_of_4 products-info">
					 <img src="images/m4.jpg">
					  <div id = "device4"><a href="#">BlackBerry Torch</a></div>
					 <h3>$200</h3>
					 <ul>
					 	<li><a  class="cart" data_device="device4" OnClick="deviceDetails(this)"> </a></li>
					 	<li><a  class="i" href="#"> </a></li>
					 	<li><a  class="Compar" href="#"> </a></li>
					 	<li><a  class="Wishlist" href="#"> </a></li>
					 </ul>
				</div>
			</div>
			<div class="section group">
				<div class="grid_1_of_4 images_1_of_4 products-info">
					 <img src="images/m2.jpg">
					 <div id = "device5"><a href="#">iPhone 4</a></div>
					 <h3>$200</h3>
					 <ul>
					 	<li><a  class="cart" data_device="device5" OnClick="deviceDetails(this)"> </a></li>
					 	<li><a  class="i" href="#"> </a></li>
					 	<li><a  class="Compar" href="#"> </a></li>
					 	<li><a  class="Wishlist" href="#"> </a></li>
					 </ul>
				</div>
				<div class="grid_1_of_4 images_1_of_4 products-info">
					 <img src="images/m6.jpg">
					  <div id = "device6"><a href="#">Samsung Guru</a></div>
					 <h3>$100</h3>
					 <ul>
					 	<li><a  class="cart" data_device="device6" OnClick="deviceDetails(this)"> </a></li>
					 	<li><a  class="i" href="#"> </a></li>
					 	<li><a  class="Compar" href="#"> </a></li>
					 	<li><a  class="Wishlist" href="#"> </a></li>
					 </ul>
				</div>
				<div class="grid_1_of_4 images_1_of_4 products-info">
					 <img src="images/m7.jpg">
					  <div id = "device7"><a href="#">HTC OneX</a></div>
					 <h3>$350</h3>
					 <ul>
					 	<li><a  class="cart" data_device="device7" OnClick="deviceDetails(this)"> </a></li>
					 	<li><a  class="i" href="#"> </a></li>
					 	<li><a  class="Compar" href="#"> </a></li>
					 	<li><a  class="Wishlist" href="#"> </a></li>
					 </ul>
				</div>
				<div class="grid_1_of_4 images_1_of_4 products-info">
					 <img src="images/m1.jpg">
					  <div id = "device8"><a href="#">Ascend G550</a></div>
					 <h3>$100</h3>
					 <ul>
					 	<li><a  class="cart" data_device="device8" OnClick="deviceDetails(this)"> </a></li>
					 	<li><a  class="i" href="#"> </a></li>
					 	<li><a  class="Compar" href="#"> </a></li>
					 	<li><a  class="Wishlist" href="#"> </a></li>
					 </ul>
				</div>
			</div>
		    
		    	</div>
		    	<div class="content-sidebar">
		    		<h4>Categories</h4>
						<ul>
							<li><a href="#">Accord Mobiles</a></li>
							<li><a href="#">Ace Mobile</a></li>
							<li><a href="#">Acer Mobile</a></li>
							<li><a href="#">Airfone</a></li>
							<li><a href="#">Apple</a></li>
							<li><a href="#">Blackberry</a></li>
							<li><a href="#">Byond Tech</a></li>
							<li><a href="#">Celkon Mobiles</a></li>
							<li><a href="#">Dell Mobile Phones </a></li>
							<li><a href="#">Fly Mobile</a></li>
							<li><a href="#">Fujezone Mobiles </a></li>
							<li><a href="#">HTC</a></li>
							<li><a href="#">LG Mobiles</a></li>
							<li><a href="#">Longtel Mobile</a></li>
							<li><a href="#">Maxx</a></li>
							<li><a href="#">Micromax Mobiles </a></li>
							<li><a href="#">Samsung Mobiles</a></li>
							<li><a href="#">Sony Ericsson Mobiles</a></li>
							<li><a href="#">Wynncom Mobiles</a></li>
						</ul>
		    	</div>
		    </div>
		    <div class="clear"> </div>
		    </div>
		    
		    
<hr class="featurette-divider">


<%@include file="layout/footer.jsp"%>


<!-- trial version finish -->
 <script>
 	function deviceDetails(obj) {
 		var temp = document.getElementById(obj.attributes.data_device.nodeValue).getElementsByTagName('a')[0].innerHTML;
 		var name = temp.split(" ");
 		var cName = name[0];
 		var pName = name[1];
 		
 		$.ajax({
			
			url : "mob/file/addtocart",
			type : "POST",
			data : "companyName=" + cName + "&productName=" + pName ,
			
			
			success : function(data, textStatus, jqXHR) {
				alert('success');
				window.location.href = "cart.jsp";
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('Could not process request.. ' + errorThrown);
				window.location.href = "login.jsp";
			}
		});
 	}
 
      !function ($) {
        $(function(){
          // carousel demo
       $('.myCarousel').carousel({
 	 interval: 2000
		})
        })
      }(window.jQuery)
    </script>
</body>
</html>
