<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
     <%@ page import="com.techno.dao.*" %>
    <%@ page import="java.sql.*" %>
    
  <!-- Handling errors --> 
  <% String err=request.getParameter("error");
  String r1=null;
  HttpSession hs=request.getSession();
      if(err!=null){
    	  if(err.equals("initiate")){			
    	    //hs.setAttribute("remain","5");
    		System.out.println("remain is set to:- "+hs.getAttribute("remain").toString());
  	  		}
    	  if(err.equals("repeat")){
    	   r1=hs.getAttribute("remain").toString();%>
    		<script>alert("you can order "+r1+" More Items.");
    		</script>  
    	  <%}
    	  if(err.equals("extra")){%>
    		<script>alert("The quantity you required is not available\nTry again with less quantity");
    		window.location="quantity.jsp";</script>  
    	  <%}
    	  if(err.equals("noremain")){%>
  		<script>alert("you can order only five items.\nTry again later.");
  		window.location="addproduct.jsp?error=repeat";</script>  
  	  <%}
      }%>  
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
			<div class="container">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 fh5co-logo">
					<a href="#" class="js-fh5co-mobile-toggle fh5co-nav-toggle"><i></i></a>
					<a href="#">Techno-Programming</a>
				</div>
				<div class="col-lg-6 col-md-5 col-sm-5 text-center fh5co-link-wrap">
					<ul data-offcanvass="yes">
                     
					    <li class="active"><a href="">Making Request</a></li>
                        <li><a href="#">About Us</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div> 
				<div class="col-lg-3 col-md-4 col-sm-4 text-right fh5co-link-wrap">
					<ul class="fh5co-special" data-offcanvass="yes">					
						<li><a href="student.jsp">Back To Profile</a></li>
					</ul>
				</div>
			</div>

		</nav>
		<br><br>
		<% if(err.equals("repeat")){%>
		   <br><br> <br><br> <div class="fh5co-project-style-2" style="padding:0px;">
		<br><br><div class="container">
		<div class="row p-b" style="margin:0px;">
			<center><div class="col-md-6 col-md-offset-3 text-center">
		  <p style="float:left;padding:0px;margin:0px;">
		  <input type="button" class="btn btn-success btn-lg" onClick="window.location='removeitem.jsp'" value="Remove Item">
		 <form action="deleterequest" method="post"> <input type="submit" class="btn btn-success btn-lg" value="Delete Request"></form>
		  <form action="completerequest" method="post"><input type="submit" style="float:left;margin-left:160px;" class="btn btn-success btn-lg" value="Submit Request"></form>
	     </p>
			</div></center>
		</div>
	</div>		
	</div>
		<%}%>
<% 	int i=0;
String item[]=new String[5];
int count=0;
String query=null,query1=null;	
ResultSet rs=null,rs1=null;
try{
String email=hs.getAttribute("email").toString();
System.out.println(email);
Dao d=new Dao();
query1="select * from productdetail where email='"+email+"'";
rs1=d.executeQuery(query1);
while(rs1.next()){
	String s=rs1.getString(7).toString();
	item[i]=s;
	System.out.println(item[i]);
	i++;
}

for(String h:item)
	System.out.print(h+" ");
query="select * from product";
 rs=d.executeQuery(query); %>
 		
<!-- Search Food First BLock Starts-->
		<div class="fh5co-pricing-style-2" style="background:rgba(0, 0, 0, 0.0);margin-top:10px;">
			<div class="container">

		      <div class="row" >
		      					<div class="pricing" >

<%while(rs.next())
{ count=0;
	for(String x:item){
		if((rs.getString(2).toString()).equals(x)){
			count++;
		}}
	if(count<=0){ %> 
			<form action="setproduct" method="post">
                  <input type="hidden" name="product" value="<%= rs.getString(1)%>" />  
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s" style="margin-right:15px;">
		                 <img src="product/<%=rs.getString(5) %>" style="width:150px;height:150px;border-bottom:1px solid gray;"/>
		                 <h4 class="pricing-title" style="padding-top:10px;"><%= rs.getString(2) %></h4>
		                 <h5 class="pricing-title" style="color:orange;padding-top:5px;">Qunatity :- <%= rs.getString(3) %></h5>		                
		                 <input class="btn btn-success btn-outline" type="submit" style="margin-top:15px;" value="Add To Request">
		            </div>
</form>		         
		<%}
	}}catch(Exception e){
		        	 e.printStackTrace();
		        	 }%>
		        	 </div>
		      </div>
			</div>
		</div>
<!-- Search Food First BLock Ends -->		


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
	</body>
</html>
