<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.techno.dao.*" %>
    <%@ page import="java.sql.*" %>
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
						<li><a href="addproduct.jsp?error=initiate">Make Order</a></li>		
						<li><a href="Logout.jsp" style="width:100px;text-align:center;" class="call-to-action">Logout</a></li>
					</ul>
				</div>
			</div>

		</nav>
     <br><br><br><br>
     <% 
        HttpSession hs=request.getSession();
        String email=hs.getAttribute("email").toString();
        String query1="select * from sp where email='"+email+"'";
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
		
        
<!-- Older order block starts -->
<div id="older orders" >		 
<% 			
try{
	String em=hs.getAttribute("email").toString();
String query=null;
ResultSet rs1;
query="select * from productdetail where email='"+em+"' and status='complete' and penalty = '0'";
 rs1=d.executeQuery(query); %>
 		
<!-- Search Food First Block Starts-->

		<div class="fh5co-pricing-style-2" style="background:rgba(0, 0, 0, 0.6);margin:0px;height:auto;">
			<div class="container">

		      <div class="row" >
		      					<div class="pricing" >
		      					
		<h3 style="color:white;text-align:center;padding-top:20px;width:1300px;height:100px;">Your Previously Ordered Item :-</h3>	    			
<%while(rs1.next())
{
%>		
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s" style="margin-right:15px;">
		                 <h4 class="pricing-title" style="padding-top:10px;"><%= rs1.getString(7) %></h4>
		                 <h5 class="pricing-title" style="color:orange;padding-top:5px;">Qunatity :- <%= rs1.getString(8) %></h5>	
		                 <% if((rs1.getString(9).toString()).equals("no")){%>	
		                 <h5 class="pricing-title" style="color:orange;padding-top:5px;"><span style="color:Green;">....Pending....</span></h5>
		                 <%}else{ %>                
		                 <h5 class="pricing-title" style="color:orange;padding-top:5px;">Days Left :- <%= rs1.getString(6) %></h5>		                
		                <%} %>
		            </div>         
		         <%}%>
                 <%}catch(Exception e){
		        	 e.printStackTrace();
		        	 }%>
		        	 </div>
		      </div>
			</div>
		</div>
</div> 
<!-- Older order block ends -->


<!-- Penalty block starts -->
			
<div id="older orders">				
		<div class="fh5co-pricing-style-2" style="background:rgba(0, 0, 0, 0.6);margin:0px;height:auto;">
			<div class="container">

		      <div class="row" >
		      					<div class="pricing">
		      					<center><div style="border:1px solid white;width:100%;padding-top:20px;"><h3  style="color:white;text-align:center;width:1300px;">Your Penalty Here :-</h3></div></center>
<br>		      						
<% 			
try{
String em=hs.getAttribute("email").toString();
String query=null;
ResultSet rs2=null,rs3=null;
query="select * from productdetail where email='"+em+"' and penalty > 0 ";
 rs2=d.executeQuery(query);		      					
	int count=0,num;
while(rs2.next())
{   
	num=Integer.parseInt(rs2.getString(4));
	if(num > 0){
	 count++;	
	}
}

if(count>0){
	rs3=d.executeQuery(query);	
	System.out.println("Bda h");
     while(rs3.next()){
     	System.out.println("rs3 :- "+rs3.getString(7));%>		
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s" style="margin-right:15px;">
		                 <h4 class="pricing-title" style="padding-top:10px;"><%= rs3.getString(7) %></h4>
		                 <h5 class="pricing-title" style="color:orange;padding-top:5px;">Penalty :- <%= rs3.getString(4) %></h5>		                
		            </div>	         
		         <%}}
else{%>
	<h4 style="color:white;margin-top:20px;">.....No Penalty Item Found For You.....</h4><br>
<%}
		         %>
                 <%}catch(Exception e){
		        	 e.printStackTrace();
		        	 }%>
		        	 </div>
		      </div>
			</div>
		</div>
</div>
<!-- Penalty block ends -->		
		



</div>		

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
