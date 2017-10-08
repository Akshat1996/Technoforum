<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.util.*" %>
     <%@ page import="com.techno.dao.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>

	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>La Vida Cafe &mdash; Food is life!</title>
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
	<body>
	
	<div id="fh5co-page" style="height:600px;background: rgba(0, 0, 0, 0.6);
  z-index: 4;">
		<nav class="fh5co-nav-style-1" role="navigation" data-offcanvass-position="fh5co-offcanvass-left">
			<div class="container">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 fh5co-logo">
					<a href="#" class="js-fh5co-mobile-toggle fh5co-nav-toggle"><i></i></a>
					<a href="#">Techno-Programming</a>
				</div>
				<div class="col-lg-6 col-md-5 col-sm-5 text-center fh5co-link-wrap">
					<ul data-offcanvass="yes">
						<li ><a href="index.html">Home</a></li>
						<li class="active"><a href="#">Choose Login Mode</a></li>

					</ul>
				</div> 
				<div class="col-lg-3 col-md-4 col-sm-4 text-right fh5co-link-wrap">
					<ul class="fh5co-special" data-offcanvass="yes">
						<li><a href="removeaccount.jsp">Take Me Back</a></li>
					</ul>
				</div>
			</div>
		</nav>

<br><br>
		<div class="fh5co-pricing-style-2" style="background:rgba(0, 0, 0, 0.0);margin-top:10px;">
			<div class="container" >

		      <div class="row">
		      					<div class="pricing"  >
		 
		 <%String query=null;
		 String check=request.getParameter("mode");
		 HttpSession hs =request.getSession();
		 int count=0;
		 String email=hs.getAttribute("email").toString();
		 if(check.equals("admin"))
		 { query="select * from ap"; 
		 }
		 
		 if(check.equals("member"))
		 { query="select * from mp"; 
		 }
		 Dao d=new Dao();
		 try{
		 ResultSet rs=d.executeQuery(query);
		 while(rs.next()){
			 if(!(rs.getString(2).toString()).equals(email)){
			count++;
				 %>  
		      					
<form action="deleteuser" method="post" style="width:300px;">
                  <input type="hidden" name="pname" value="<%= rs.getString(2)%>" />  
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s" style="margin-right:15px;">
	               <input type="hidden" name="ptype" value="<%=check %>" />  
		             <h4 class="pricing-title" style="padding-top:10px;"><%= rs.getString(6) %></h4>
		                 <h4 class="pricing-title" style="padding-top:10px;"><%= rs.getString(2) %></h4>
                   <input class="btn btn-success btn-outline" type="submit" style="margin-top:15px;" value="Delete Item">
		            </div>
</form>	
<%}
} 
		 if(count==0)
		 {%>
			<center><h1 style="color:white;margin-top:150px;">No admin available to remove</h1></center>
		 <%}
		 
		 }catch(Exception e){
	e.printStackTrace();
}%>
</div>></div></div></div>
</body>
</html>