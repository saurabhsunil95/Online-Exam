<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
	<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUpHandler</title>
</head>
<body style="background-color: powderblue;">
<%
Connection con = null;

        String name = request.getParameter("name");
        String mail = request.getParameter("email");
        String pass = request.getParameter("password");
        String city = request.getParameter("city");
        String mob = request.getParameter("mobile");
        //String usr = request.getParameter("userid");
        //String inf = request.getParameter("info");
        
        String queryText = "insert into students values('"+name+"','"+city+"','"+mob+"','"+ mail+"','"+pass+"')";

 		Class.forName("com.mysql.jdbc.Driver");
 		Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "9534598529");
 		Statement st = co.createStatement();
 		int rst = st.executeUpdate(queryText);
 		//out.println("Data is saved "+rst);
		co.close();
		%>
		


	<center>
Your Account Created Successfully!<br>
 Please Click Here For Login.
	<a href="login.jsp"><p>Login</p></a>
	</center>
</body>
</html>