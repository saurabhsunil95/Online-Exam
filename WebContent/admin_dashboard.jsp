<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
	%>


	<center>
				  <li><a href="add_subject.jsp">To add a subject click here</a></li>
				  <li><a href="add_questions.jsp">To add a question click here</a></li>
				 
				  
				  <form action="Logout">
	<input type="submit" value="logout">
	
</form>
			 </center>	
			   


</body>
</html>