<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.techno.dao.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String err=request.getParameter("error");
   if(err!=null){
	   if(err.equals("itemadded")){
		   %>
		   <script> alert("Item added successfully.");</script>
	   <% }
	   if(err.equals("deleted")){
		   %>
		   <script> alert("You have suuceefully deleted the profile.");</script>
	   <% }
	   if(err.equals("adminadded")){
		   %>
		   <script> alert("You have suuceefully added an admin profile.");</script>
	   <% }
	   if(err.equals("memberadded")){
		   %>
		   <script> alert("You have suuceefully added a member profile.");</script>
	   <% }
   }
%>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Techno-Programming Club &mdash;</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700|Monsterrat:400,700|Merriweather:400,300italic,700' rel='stylesheet' type='text/css'>
	
<link rel="stylesheet" href="login.css">

	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="profile.css">
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Magnific Popup-->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	
	<!-- Cards -->
	<link rel="stylesheet" href="css/cards.css">
	<link rel="stylesheet" href="admin.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<style>
	.button a {
  display: block;
  height: 50px;
  width: 200px;
  background: #00b7ea;
  color:white;
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.button a {
  display: block;
  height: 50px;
  width: 200px;
  background: #00b7ea;
  align-items: center;
  font: 17px/50px Helvetica, Verdana, sans-serif;
  text-decoration: none;
  text-align: center;
  text-transform: uppercase;

}
</style>
	</head>
	<body >
	<div id="fh5co-page" style="background: rgba(0, 0, 0, 0.6);height:auto;
       z-index: 4;">
		<nav class="fh5co-nav-style-1" role="navigation" data-offcanvass-position="fh5co-offcanvass-left">
			<div class="container" >
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 fh5co-logo">
					<a href="#" class="js-fh5co-mobile-toggle fh5co-nav-toggle"><i></i></a>
					<a href="#">Techno-Programming</a>
				</div>
				<div class="col-lg-6 col-md-5 col-sm-5 text-center fh5co-link-wrap">
					<ul data-offcanvass="yes">
					    <li class="active"><a href="">Home Page</a></li>
                        <li><a href="#">About Us</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div> 
				<div class="col-lg-3 col-md-4 col-sm-4 text-right fh5co-link-wrap">
					<ul class="fh5co-special" data-offcanvass="yes">
						<li><a href="Logout.jsp" style="width:100px;text-align:center;" class="call-to-action">Logout</a></li>
					</ul>
				</div>
			</div>

		</nav>
     <br><br><br><br>
     <% 
        HttpSession hs=request.getSession();
        String email=hs.getAttribute("email").toString();
        String query1="select * from ap where email='"+email+"'";
        Dao d=new Dao();
        ResultSet rs=d.executeQuery(query1);
        while(rs.next()){%>
        	<!-- Profile block Starts -->
    		<div class="fh5co-features-style-1" style="background-image: url(images/full_5.jpg);" data-stellar-background-ratio="0.5" >
    			<div class="fh5co-overlay"></div>
    			<div class="container" style="z-index: 3; position: relative;">
    				<div class="row">
    					<div class="fh5co-features">
    						<div class="fh5co-feature wow fadeInUp" data-wow-duration="1s" data-wow-delay=".8s">
    							<div class="icon"><i class="icon-ribbon"></i></div>
    							<h3>Name</h3>
    							<p><%=rs.getString(6) %></p>
    						</div>
    						<div class="fh5co-feature wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
    							<div class="icon"><i class="icon-image22"></i></div>
    							<h3>Designation</h3>
    							<p><%=rs.getString(11) %></p>
    						</div>
    						<div class="fh5co-feature wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
    							<div class="icon"><i class=" icon-monitor"></i></div>
    							<h3>Account Status</h3>
    							<p><%=rs.getString(5) %></p>
    						</div>

    						<div class="fh5co-feature wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.7s">
    							<div class="icon"><i class="icon-video2"></i></div>
    							<h3>Course</h3>
    							<p><%=rs.getString(7) %></p>
    						</div>
    						<div class="fh5co-feature wow fadeInUp" data-wow-duration="1s" data-wow-delay="2s">
    							<div class="icon"><i class="icon-bag"></i></div>
    							<h3>Roll Number</h3>
    							<p><%=rs.getString(3) %></p>
    						</div>
    						<div class="fh5co-feature wow fadeInUp" data-wow-duration="1s" data-wow-delay="2.3s">
    							<div class="icon"><i class="icon-mail2"></i></div>
    							<h3>Email</h3>
    							<p><%=rs.getString(2) %></p>
    						</div>

    					</div>
    				</div>
    			</div>
    		</div>
    <!-- profile content BLock Ends -->	               
       <%  }
        %>
  <!--  Showing work block start  -->   
    
   <div class="fh5co-content-style-6" >
			<div class="container">
				<div class="row p-b text-center">
					<div class="col-md-6 col-md-offset-3">
						<h2 class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">Works For You</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".5s">
						<a href="#" class="link-block">
							<figure><img src="images/adminaddaccount.png" alt="Image" class="img-responsive img-rounded" height="100" width="150"></figure>
							<h3 >Add Account</h3>
							<p style="text-align:center;margin-top:20px;"><a href="addmember.jsp" class="btn btn-primary btn-sm">Explore It</a></p>
						</a>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".8s">
						<a href="#" class="link-block">
							<figure><img src="images/admindeleteaccount.png" alt="Image" class="img-responsive img-rounded" height="100" width="150"></figure>
							<h3>Delete Account</h3>
							<p style="text-align:center;margin-top:20px;"><a href="removeaccount.jsp" class="btn btn-primary btn-sm">Explore It</a></p>
						</a>
					</div>
					<div class="clearfix visible-sm-block"></div>
					<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1.1s">
						<a href="#" class="link-block">
							<figure><img src="images/adminaddimage.png" alt="Image" class="img-responsive img-rounded" height="100" width="150"></figure>
							<h3>Add Item</h3>
							<p style="text-align:center;margin-top:20px;"><a href="signupproduct.jsp" class="btn btn-primary btn-sm">Explore It</a></p>
						</a>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1.4s">
						<a href="#" class="link-block">
							<figure><img src="images/adminremoveitem.png" alt="Image" class="img-responsive img-rounded" height="100" width="150"></figure>
							<h3>Delete Item</h3>
							<p style="text-align:center;margin-top:20px;"><a href="deleteproduct.jsp" class="btn btn-primary btn-sm">Explore It</a></p>
						</a>
					</div><br>
				</div>
			</div>
		</div>
   
   <!-- showing works block end -->  
   
   <!-- Start Footer -->		
		<section id="s3">
		<div class="fh5co-footer-style-3">
			<div class="container">
				<div class="row p-b">
					<div class="col-md-3 col-sm-6 fh5co-footer-widget wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
						<div class="fh5co-logo"><span class="logo">Techno-</span>Programming</div>
						<p class="fh5co-copyright">&copy; 2017 LaVida Cafe. <br>All Rights Reserved. <br>Designed by Deepak and team</a>  <br> 
							Images: <a target="_blank" href="https://images.google.com/">Google Images</a></p>
					</div>
					
					<div class="clearfix visible-sm-block"></div>
					<div class="col-md-3 col-sm-6 fh5co-footer-widget wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
						<h3>Connect</h3>
						<ul class="fh5co-links fh5co-social">
							<li><a target="_blank" href="https://www.facebook.com/"><i class="icon icon-facebook2"></i> Facebook</a></li>
							<li><a target="_blank" href="https://www.twitter.com/"><i class="icon icon-twitter"></i> Twitter</a></li>
							<li><a target="_blank" href="https://www.dribbble.com/"><i class="icon icon-dribbble"></i> Dribbble</a></li>
							<li><a target="_blank" href="https://www.instagram.com/"><i class="icon icon-instagram"></i> Instagram</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 fh5co-footer-widget wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.4s">
						<h3>About</h3>
						<p>Opened in 1990's,LaVida Cafe has grown to become area's premier restaurant delivering top quality food.</p>
						<p><a href="#" class="btn btn-success btn-sm btn-outline">Back to top</a></p>
					</div>
					<div class="clearfix visible-sm-block"></div>
				</div>
			</div>
		</div>
		</section>
		<!-- END footer -->
   
<!-- jQuery Added-->

	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
   <script src="js/jquery.waypoints.min.js"></script>
	<!-- Owl Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- WOW -->
	<script src="js/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<!-- Main -->
	<script src="js/main.js"></script>