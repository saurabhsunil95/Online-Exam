package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Register")
public class Register extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;

        String name = request.getParameter("name");
        String mail = request.getParameter("email");
        String pass = request.getParameter("password");
        String city = request.getParameter("city");
        String mob = request.getParameter("mobile");
        //String usr = request.getParameter("userid");
        //String inf = request.getParameter("info");
        
        String queryText = "insert into students values('"+name+"','"+city+"','"+mob+"','"+ mail+"','"+pass+"')";

 		try{
 			Class.forName("com.mysql.jdbc.Driver");
 		
 		Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "9534598529");
 		Statement st = co.createStatement();
 		int rst = st.executeUpdate(queryText);
 		//out.println("Data is saved "+rst);
		co.close();
		
		//response.sendRedirect("login.jsp");
		request.setAttribute("registerMsg", "You are Register Sucessfully");
		//response.sendRedirect("login.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
 		}catch(Exception e) {
 			System.out.println(e);
 		}
	}

}
