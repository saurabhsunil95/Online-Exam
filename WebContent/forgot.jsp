<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
	<%@ page import="javax.servlet.http.*" %>
	<%@ page import="java.io.File" %>
	<%@ page import="java.util.Properties" %>
	<%@ page import="javax.mail.*" %>
	<%@ page import="javax.mail.internet.*" %>
	<%@ page import="javax.mail.internet.MimeMessage.RecipientType" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginHandler</title>
</head>
<body style="background-color: powderblue;">
	
	<form action="forgot_handler.jsp" method="get">

    <div class="row">
      <div class="col-md-12 form-group">
        <label for="name">Email Address</label>
        <input type="email" id="name" name="email" class="form-control ">
      </div>
    </div>
    
    <div class="row">
      <div class="col-md-6 form-group">
        <input type="submit" value="Forgot" class="btn btn-primary">
      </div>
    </div>
  </form>

</body>
</html>