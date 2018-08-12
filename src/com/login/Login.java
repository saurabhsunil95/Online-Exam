package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("email");
		String pass = request.getParameter("password");
//		String n="";
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			  Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminn","root","9534598529");
//		  Statement st = co.createStatement();
//		  ResultSet rs = st.executeQuery("select name from students where email='"+uname+"'");
//		  while(rs.next()) {
//			  n=rs.getString("user");
//		  }
//		}catch (Exception e) {
//			System.out.println("exception  "+e);
//		}

		LoginDao dao = new LoginDao();
		
			if(dao.check(uname, pass)) {
				
				//create cookie
				Cookie mailCookie = new Cookie("studentmail",uname);
				//set the life span of cookie
				mailCookie.setMaxAge(60*60*24);
				//send cookie to browser
				response.addCookie(mailCookie);
				
				HttpSession session = request.getSession();
				session.setAttribute("username", uname);
				response.sendRedirect("students_dashboard.jsp");
			}
			else {
				request.setAttribute("errorMessage", "Invalid user or password");
				//response.sendRedirect("login.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
			}
	}

}
