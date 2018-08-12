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

					<%
	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("admin.jsp");
	}
	%>

				  <% //String e = request.getParameter("mail");
				  //String otp = request.getParameter("ootp");
				  String e="";
Cookie[] theCookies = request.getCookies();
if(theCookies!=null){
	for(Cookie tempCookie : theCookies){
		if("email".equals(tempCookie.getName())){
			e=tempCookie.getValue();
			break;
		}
	}
}
				  
				  %>
				  <center>
				  <form action="OtpLogin">
                  <div class="row">
                    <div class="col-md-12 form-group">
                      <label for="name">Email</label>
                      <input type="text" id="name" name="user" value=<%=e %>class="form-control " readonly>
                    </div>
                  </div>
                  <div class="row mb-5">
                    <div class="col-md-12 form-group">
                      <label for="name">OTP</label>
                      <input type="password" id="name" name="eotp" class="form-control " required="true">
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-6 form-group">
                      <input type="submit" value="Login" class="btn btn-primary">
                      <br>
                      <br>
                      <li><a href="admin.jsp">Admin Login</a></li>
                        <li><a href="company.jsp">Company Login</a></li>
                   </div>
                  </div>
                </form>
				  </center>
				  


</body>
</html>