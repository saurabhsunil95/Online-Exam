package com.login;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Invite")
public class Invite extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("mail");
		
		String e="";
		Cookie[] theCookies = request.getCookies();
		if(theCookies!=null){
			for(Cookie tempCookie : theCookies){
				if("companyname".equals(tempCookie.getName())){
					e=tempCookie.getValue();
					break;
				}
			}
		}

	
	
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
		  InternetAddress receiver1 = new InternetAddress(uname);
		  //InternetAddress receiver2 = new InternetAddress("yatharthmishra01@gmail.com");
		  InternetAddress[] rcvrs = {receiver1};
		  message.addRecipients(RecipientType.TO,rcvrs);
		  message.setSubject("Invitation For Job Interview!!");
		  MimeBodyPart part1 = new MimeBodyPart();
		  part1.setContent("<i style='color : blue'>"+ "Dear Student,</i><br><i style='color : blue'>"+ "Your are Invited from Interview in "+e+" company through Online Exam Website.</i><br><i style='color : blue'>Thank you!!</i><br>","text/html");
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
		  
		  request.setAttribute("MailSend", "Invitation Mail sended!!");
		  RequestDispatcher rd = request.getRequestDispatcher("companysubject.jsp");
          rd.forward(request, response);
		  
		  }catch (Exception w) {
			   System.out.println("Some error has occured, and error is "+w);
			   request.setAttribute("mailNotSend", "There is problem in sending mail to Student!!");
				  RequestDispatcher rd = request.getRequestDispatcher("companysubject.jsp");
		          rd.forward(request, response);
			  }

	
//		  HttpSession session = request.getSession();
//			session.setAttribute("username", uname);
//			response.sendRedirect("companysubject.jsp");
	}
}
