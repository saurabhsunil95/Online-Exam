package com.login;

import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddQuestions")
public class AddQuestions extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		 String subject = request.getParameter("subject"),
		 ques = request.getParameter("question"),
		 a1 = request.getParameter("ans1"),
		 a2 = request.getParameter("ans2"),
		 a3 = request.getParameter("ans3"),
		 a4 = request.getParameter("ans4"),
		 ca = request.getParameter("correct_ans");

		 try { 
		 Class.forName("com.mysql.jdbc.Driver");

		  Connection co = DriverManager.getConnection
		  ("jdbc:mysql://localhost:3306/adminn","root","9534598529");

		  Statement st = co.createStatement();

		  String sql = "insert into adminn."+subject+" values('"+id+"','"+ques+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+ca+"')";

		  int rec = st.executeUpdate(sql);
		 
		 
			//response.sendRedirect("login.jsp");
				request.setAttribute("questionAdd", "Question Added Sucessfully");
				//response.sendRedirect("login.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("admin_dashboard.jsp");
				rd.forward(request, response);
		 co.close();
		 }catch(Exception e) {
	 			System.out.println(e);
	 		}
		 
		

	}

}
