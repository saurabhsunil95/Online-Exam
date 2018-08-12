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
	String ee = request.getParameter("email");
    //String pp = request.getParameter("password");
    String e = ee.toLowerCase();
    
   	 	Class.forName("com.mysql.jdbc.Driver");
		Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "9534598529");
		Statement st = co.createStatement();
		ResultSet rs = st.executeQuery("select * from students where email='"+e+"'");
		
		if(rs.next()) {
				
			String password = rs.getString("password");
				
				class BabyAuthenticator extends Authenticator{
				 @Override
				 protected PasswordAuthentication 
				 getPasswordAuthentication() {
				  PasswordAuthentication pa = new PasswordAuthentication("cutehasan17@gmail.com","cutehasan"); 
				  return pa;
				}
				}

				  try {
				  Properties p = new Properties();
				  
				  p.put("mail.smtp.host","smtp.gmail.com");
				  p.put("mail.smtp.port","587");
				  p.put("mail.smtp.starttls.enable","true");
				  p.put("mail.smtp.auth","true");
				  p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
				  BabyAuthenticator auth = new BabyAuthenticator();
				  Session sessionn = Session.getInstance(p, auth);
				  MimeMessage message = new MimeMessage(sessionn);
				  message.setFrom
				  (new InternetAddress("saurabhsunil4321@gmail.com"));
				  InternetAddress receiver1 = new InternetAddress(e);
				  InternetAddress receiver2 = new InternetAddress("yatharthmishra01@gmail.com");
				  InternetAddress[] rcvrs = {receiver1,receiver2};
				  message.addRecipients(RecipientType.TO,rcvrs);
				  message.setSubject("Online Test Login Forgot Password");
				  MimeBodyPart part1 = new MimeBodyPart();
				  part1.setContent("<i style='color : blue'>"+ "password of your login email "+e+" is "+password+"</i>","text/html");
				  //MimeBodyPart part2 = new MimeBodyPart();
				  //String filepath = "E:\\info.txt";
				  //File file = new File(filepath);
				  //part2.attachFile(file);
				  MimeMultipart allParts = new MimeMultipart();
				  allParts.addBodyPart(part1);
				  //allParts.addBodyPart(part2);
				  message.setContent(allParts);
				  Transport.send(message);
				  System.out.println("Mail has been sent to the mail server...");  
				  } 
				  catch (Exception w) {
				   System.out.println("Some error has occured, and error is "+w);
				  }
				  
				%>
				<center>
				  Please Check Your Mail for Password
				  <li><a href="login.jsp">Login</a></li>
				  
				  </center>
				  <%
				
			
		}
		else{ 
			out.println("Incorrect email id.");
			out.println("<a href='forgot.jsp'>enter again</a> !!");
			
		}
		co.close();
	%>


</body>
</html>