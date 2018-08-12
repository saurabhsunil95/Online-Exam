package com.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.CompanyLoginDao;
import com.login.dao.LoginDao;

@WebServlet("/CompanyLogin")
public class CompanyLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("user");
		String pass = request.getParameter("password");

		CompanyLoginDao dao = new CompanyLoginDao();
		
			if(dao.checkCompany(uname, pass)) {
				//create cookie
				Cookie companyCookie = new Cookie("companyname",uname);
				//set the life span of cookie
				companyCookie.setMaxAge(60*60*24);
				//send cookie to browser
				response.addCookie(companyCookie);
				
				
				HttpSession session = request.getSession();
				session.setAttribute("username", uname);
				response.sendRedirect("company_handler.jsp");
			}
			else {
				//response.sendRedirect("company.jsp");
				request.setAttribute("errorMessageAdmin", "Invalid Company Id or Password!!");
				RequestDispatcher rd = request.getRequestDispatcher("company.jsp");
                rd.forward(request, response);
			}
	}
	

	

}
