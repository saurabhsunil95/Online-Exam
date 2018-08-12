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

  Class.forName("com.mysql.jdbc.Driver");

  Connection co = DriverManager.getConnection
  ("jdbc:mysql://localhost:3306/adminn","root","9534598529");

  Statement st = co.createStatement();
 Statement st2 = co.createStatement();

  String sql = "show tables in adminn";

  ResultSet rs = st.executeQuery(sql);
 ResultSet rs2 = st2.executeQuery(sql);
 
 int records = 0;
 
 while(rs.next())
 {
  records++;
 }
 
 String[] tables = new String[records];

  int i = 0;
 
 while(rs2.next())
 {
  tables[i] = rs2.getString(1);
  i++;
 }
 
 co.close();
%>
<fieldset>
<legend>Add-Question</legend>
<form action="add_question_handler.jsp" method="post">

<select name="subject">
 <%
  for(int index = 0; index < tables.length; index++)
  {
 %>
  <option><%=tables[index]%></option>
 <%   
  }
 %> 
</select>
<br>

Input a question id<br>
<input type="text" name="id" required><br>

Input a question<br>
<textarea rows="3" cols="40" name="question"></textarea><br>

Input answer one<br>
<textarea rows="3" cols="40" name="ans1"></textarea><br>

Input answer two<br>
<textarea rows="3" cols="40" name="ans2"></textarea><br>

Input answer three<br>
<textarea rows="3" cols="40" name="ans3"></textarea><br>

Input answer four<br>
<textarea rows="3" cols="40" name="ans4"></textarea><br>

Input correct answer<br>
<textarea rows="3" cols="40" name="correct_ans"></textarea><br>

<input type="submit" value="add-a-question">
</form>
</fieldset>
<br><center><a href='login.jsp'><button>LogOut</button></a></center>
</body>

</html>