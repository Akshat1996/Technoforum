 <%@ page import="com.techno.dao.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.lang.*" %>
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
						<li><a href="Logout.jsp" style="width:100px;text-align:center;" class="call-to-action">Logout</a></li>
					</ul>
				</div>
			</div>

		</nav>
     <br><br><br><br>
     <% try{
    	 ResultSet rs,rs1;String query1=null;
    	 int total=0;
    	String emailmatch[]=new String[200];
    	String matchemail=null;
    	int i=0;int count=0;
    	String batch=null; 
        HttpSession hs=request.getSession();
        String email=hs.getAttribute("email").toString();
        String query="select batch from mp where email='"+email+"'";
        Dao d=new Dao();
        rs=d.executeQuery(query);
        String err=request.getParameter("error");
        while(rs.next()){
        	batch=rs.getString(1);
            System.out.println("Batch Is :- "+batch);
        }
        %>    	   		<div class="fh5co-pricing-style-2" style="background:rgba(0, 0, 0, 0.0);margin-top:10px;">
			<div class="container">

		      <div class="row" >
		      		 <div class="pricing" ><%
      query1="select email from productdetail where batch='"+batch+"'";
       rs1=d.executeQuery(query1);
       while(rs1.next()){
    	   count=0;

    	   matchemail=rs1.getString(1).toString();
    	   System.out.println("matchemail is :- "+matchemail);
    	   for(String x1:emailmatch){
    		   if(x1!=null)
    			   { 
    			   if(x1.equals(matchemail))
    			   count++;
    	   			}
    	   }
    	   if(count<=0){
        	   total++;
    	   emailmatch[i]=rs1.getString(1).toString();
    	   i++;
            if(err.equals("addpenalty")){%>
	   <form class="login-form" action="setpenalty?error=addpenalty" method="post">
  <%}
            if(err.equals("removepenalty")){%>
	  	   <form class="login-form" action="setpenalty?error=removepenalty" method="post">

  <%}%>
		            <div class="pricing-item wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s" style="margin-right:50px;width:400px;">
		                 <input type="hidden" value="<%=rs1.getString(1).toString() %>" name="penaltyemail" />
		                 <input type="hidden" value="<%=batch%>" name="penaltybatch" />
		                 <h4 class="pricing-title" style="padding-top:10px;"><%= rs1.getString(1) %></h4>	                
		                 <input class="btn btn-success btn-outline" type="submit" style="margin-top:15px;" value="Choose This Email">
		            </div>
            </form>        
    	   <%}
       } 
       if(total==0){%>
    		  <div style="height:400px;width:1000px;"> <h1 style="text-align:center;color:white;margin:40px;">No Items for Changing Penalty!!!</h1></div>
       <%}
       
       for(String x:emailmatch)
    	   System.out.print(x+ " ");
     }catch(Exception e){
    	 e.printStackTrace();
     }
        %>
   	</div>
</div></div>
</body>
</html>