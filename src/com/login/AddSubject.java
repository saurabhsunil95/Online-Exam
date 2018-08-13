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


@WebServlet("/AddSubject")
public class AddSubject extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject = request.getParameter("subject");
		try {
		  Class.forName("com.mysql.jdbc.Driver");
		 
		 Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminn","root","9534598529");
		 
		 Statement st = co.createStatement();
		 
		 String sql = "create table adminn."+subject+"(id int,question varchar(255),answer1 varchar(255),"+
		   "answer2 varchar(255),answer3 varchar(255),answer4 varchar(255),correct varchar(255), primary key(id))";
		 
		 //System.out.println(">>>>"+sql);
		 
		 int nora = st.executeUpdate(sql);
		 
		
		//response.sendRedirect("login.jsp");
		request.setAttribute("subjectAdd", "Subject Added Sucessfully");
		//response.sendRedirect("login.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("admin_dashboard.jsp");
        rd.forward(request, response);
 		}catch(Exception e) {
 			System.out.println(e);
 		}
	}

}
