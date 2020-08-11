package com.kul.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	public boolean check(String uname, String upass) {
		String sql = "select * from userfoodlog where uname = ? and upass = ?";
		boolean status = false;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "1234");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, upass);
			
			int rs = ps.executeUpdate();
			if(rs != 0) {
				return true;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
