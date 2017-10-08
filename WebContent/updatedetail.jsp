   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.techno.dao.*" %> 
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="table.css">
<link rel="stylesheet" href="login.css">
<title>Update Detail</title>
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
#login{
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background-image: url(images/full_2.jpg);
  width: 300px;
  border: 0;
  padding: 15px;
  color: white;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
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

<br><br><br><br><br><br><br><br>
    <%
    Dao d=new Dao();
    ResultSet rs=null;String query=null;
    try{ 
    	 query="select * from sp order by name ASC";
    	 rs=d.executeQuery(query);%>
    	      <div class="table-title">
			 		<h2 style="color:white;font-family:"Roboto";">Total Records Available :-</h2>
				</div>
   				<center><form action="deletestudent" method="post">
   				 <input type="hidden" name="up" value="food" />
   				<table class="table-fill">
	 				 <thread> <tr ><th class="text-left">Check Here</th>
	  							<th class="text-left">Name</th>
								<th class="text-left">Email Id</th>
								<th class="text-left">Batch</th>	
								<th class="text-left">Branch</th>	
								<th class="text-left">Roll Number</th>
							</thread>
    <% while(rs.next()){%>
    <tbody class="table-hover">
		<td class="text-left" ><input type="radio" name="demail" value="<%=rs.getString(2)%>" /></td>
		<td class="text-left"><%= rs.getString(6)%></td>
		<td class="text-left"><%=rs.getString(2)%></td>
		<td class="text-left"><%=rs.getString(9)%></td>
	     <td class="text-left"><%=rs.getString(8)%></td>
	     <td class="text-left"><%=rs.getString(3)%></td>             
</tbody>
    	</form>
     <% 
     }
     %> <br>
     </table ><br><br><input id="login" type="submit" value="Delete This Record"/><br><br><br>    
   				<% }catch(Exception e){
   			e.printStackTrace();
	}%>