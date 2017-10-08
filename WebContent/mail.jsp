<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
final String from = "siddhesh.kalgaonkar@ves.ac.in"; // change accordingly
final String password = "yourPassword"; // change accordingly
String to = "kalgaonkarsiddhesh@gmail.com"; // change accordingly
String host = "localhost"; // or IP address

// Get system properties
Properties properties = System.getProperties();

// Setup mail server
properties.put("mail.smtp.host", host);
properties.put("mail.smtp.port", 587);
properties.put("mail.smtp.auth", "true");
properties.put("mail.smtp.starttls.enable", "true");
properties.put("mail.user", from);
properties.put("mail.password", password);

// Get the default Session object.
Authenticator auth = new Authenticator()
{
    public PasswordAuthentication getPasswordAuthentication()
    {
        return new PasswordAuthentication(from, password);
    }
};


try
{
	Session s = Session.getInstance(properties, auth);
   // Create a default MimeMessage object.
   MimeMessage message = new MimeMessage(s);

   // Set From: header field of the header.
   message.setFrom(new InternetAddress(from));

   // Set To: header field of the header.
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));

   // Set Subject: header field
   message.setSubject("This is the Subject Line!");

   // Now set the actual message
   message.setText("This is actual message");

   // Send message
   Transport.send(message);
   System.out.println("Sent message successfully....");
}
catch (SendFailedException mex)
{
   mex.printStackTrace();
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
      <center>
         <h1>Send Email using JSP</h1>
      </center>
      
      <p align = "center">
         <% 
            out.println("Result: " +"\n");
         %>
      </p>
   </body>
</html>
