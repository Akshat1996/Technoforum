<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.techno.dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%--  String error=null;
error=request.getParameter("error");
if(error!=null){

    String email=session.getAttribute("email").toString();
    String query="update kp set status='inactive',ordertaken='false' where email='"+email+"'";
    Dao d=new Dao();
    d.executeUpdate(query);
}
--%>
<% HttpSession hs=request.getSession();
if(hs!=null){
	String e=(String) hs.getAttribute("email");
	hs.invalidate();
	System.out.print("session ends for "+e);
	response.sendRedirect("index.html");}
%>
</body>
</html>