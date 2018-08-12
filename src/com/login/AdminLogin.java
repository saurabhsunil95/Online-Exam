package com.login;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

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

import com.login.dao.AdminLoginDao;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("mail");

		AdminLoginDao dao = new AdminLoginDao();
		
			if(dao.checkAdmin(uname)) {
				
				//generate otp using random function
				Random r = new Random();
				String otpp="";
				//System.out.print("Generated OTP :: ");
				for(int i = 1;i<=4;i++) {
					char otp = (char)(65+r.nextInt(26));
					//System.out.print(otp);
					otpp=otpp+otp;
				}
				for(int i=5;i<=8;i++) {
				int otp = r.nextInt(10);
				//System.out.print(otp);
				otpp=otpp+otp;
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
					  message.setSubject("Online Test Admin Login Verification");
					  MimeBodyPart part1 = new MimeBodyPart();
					  part1.setContent("<i style='color : blue'>"+ "OTP = "+otpp+"</i>","text/html");
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
					  
					  }catch (Exception w) {
						   System.out.println("Some error has occured, and error is "+w);
						  }
					  
				String otp = otpp;
				//create cookie
				Cookie theCookie = new Cookie("myotp",otp);
				Cookie mailCookie = new Cookie("email",uname);
				//set the life span of cookie
				theCookie.setMaxAge(60*5);
				mailCookie.setMaxAge(60*60*24);
				//send cookie to browser
				response.addCookie(theCookie);
				response.addCookie(mailCookie);
					  
				HttpSession session = request.getSession();
				session.setAttribute("username", uname);
				response.sendRedirect("admin_login_handler.jsp");
			}
			else {
				//response.sendRedirect("admin.jsp");
				request.setAttribute("errorMessageAdmin", "Invalid Email Id!!");
				RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
			}
	}
}
