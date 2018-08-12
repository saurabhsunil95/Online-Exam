<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend>Add-Subject</legend>
<form action="add_subject_handler.jsp" method="post">
Input the title for subject<br>
<input type="text" name="subject" required><br>
<input type="submit" value="add-subject">
</form>
</fieldset>
<br><center><a href='login.jsp'><button>LogOut</button></a></center>
</body>

</html>