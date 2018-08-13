package com.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/OtpLogin")
public class OtpLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sendotp="";
		Cookie[] theCookies = request.getCookies();
		if(theCookies!=null){
			for(Cookie tempCookie : theCookies){
				if("myotp".equals(tempCookie.getName())){
					sendotp=tempCookie.getValue();
					break;
				}
			}
		}
		String enterotp = request.getParameter("eotp");
		if(enterotp.equals(sendotp)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", sendotp);
			response.sendRedirect("admin_dashboard.jsp");
		}
		else {
			response.sendRedirect("admin_login_handler.jsp");
		}
	}

}
