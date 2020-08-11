package com.kul.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SignUpDao {
	
	public boolean insert(String name, String pass)
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "1234");
			PreparedStatement st = con.prepareStatement("insert into  userfoodlog values(?, ?)");
			st.setString(1, name);
			st.setString(2, pass);
			int rs = st.executeUpdate();
			if(rs != 0) {
				System.out.println("done");
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return false;
	}
	
}
