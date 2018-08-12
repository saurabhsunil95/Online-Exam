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
 String id = request.getParameter("id");
 String subject = request.getParameter("subject"),
 ques = request.getParameter("question"),
 a1 = request.getParameter("ans1"),
 a2 = request.getParameter("ans2"),
 a3 = request.getParameter("ans3"),
 a4 = request.getParameter("ans4"),
 ca = request.getParameter("correct_ans");

  Class.forName("com.mysql.jdbc.Driver");

  Connection co = DriverManager.getConnection
  ("jdbc:mysql://localhost:3306/adminn","root","9534598529");

  Statement st = co.createStatement();

  String sql = "insert into adminn."+subject+" values('"+id+"','"+ques+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+ca+"')";

  int rec = st.executeUpdate(sql);
 
 if(rec > 0)
 {
  out.println("<i>question added</i>");
  out.println("<a href='add_questions.jsp'>add more questions</a>");
  out.println("<br><center><a href='login.jsp'><button>LogOut</button></a></center>");
 }
 
 co.close();

%>
</body>
</html>