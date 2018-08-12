package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.File;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.RecipientType;

public class CompanyLoginDao {
	
	String sql = "select * from company where user=? and password=?";
	String url = "jdbc:mysql://localhost:3306/login";
	String username="root";
	String password = "9534598529";
	
	public boolean checkCompany(String uname,String pass) {
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection co = DriverManager.getConnection(url, username, password);
			PreparedStatement st = co.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				
				return true;
			
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

}
