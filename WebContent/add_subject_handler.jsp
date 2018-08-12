<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ page import="java.sql.*" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
 String subject = request.getParameter("subject");

  Class.forName("com.mysql.jdbc.Driver");
 
 Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminn","root","9534598529");
 
 Statement st = co.createStatement();
 
 String sql = "create table adminn."+subject+"(id int,question varchar(255),answer1 varchar(255),"+
   "answer2 varchar(255),answer3 varchar(255),answer4 varchar(255),correct varchar(255), primary key(id))";
 
 System.out.println(">>>>"+sql);
 
 int nora = st.executeUpdate(sql);
 
 if(nora >= 0)
 {
  out.println("<i style='color : blue'>subject has been saved</i>");
  out.println("<a href=''>show dashboard</a>");
  out.println("<a href='add_questions.jsp'>add a question</a>");
  out.println("<br><center><a href='login.jsp'><button>LogOut</button></a></center>");
 }
%>
</body>

</html>
