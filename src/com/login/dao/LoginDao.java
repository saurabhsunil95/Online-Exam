package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	
	String sql = "select * from students where email=? and password=?";
	String url = "jdbc:mysql://localhost:3306/login";
	String username="root";
	String password = "9534598529";
	
	public boolean check(String uname,String pass) {
		
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
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}

}
