package com.amar.candidate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.amar.candidate.bean.CandidateBean;
import com.amar.candidate.util.DBUtils;

//create sequence candidate_SEQ start With 5000 minvalue 5000 maxvalue 7000 increment by 1

public class CandidateDAO {
	
	public String addCandidate(CandidateBean CandidateBean) throws SQLException {
			Connection con = DBUtils.getDbConn();
			try {
				PreparedStatement ps = con.prepareStatement(" insert into CMS values (?, ?, ?, ?, ?, ?, ?)");
				ps.setString(1, CandidateBean.getId());
				ps.setString(2, CandidateBean.getName());
				ps.setInt(3, CandidateBean.getM1());
				ps.setInt(4, CandidateBean.getM2());
				ps.setInt(5,CandidateBean.getM3());
				ps.setNString(6, CandidateBean.getResult());
				ps.setNString(7, CandidateBean.getGrade());
				if(ps.execute()) {
					return "Success";
				}else {
					return "Fail";
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return "fail";
	}
		
	public ArrayList<CandidateBean> getByResult(String criteria) throws SQLException{
		Connection con = DBUtils.getDbConn();
		ArrayList<CandidateBean> res = new ArrayList<CandidateBean>();
		ResultSet rs ;
		try {
			
			if(criteria.equals("all")) {
				PreparedStatement ps = con.prepareStatement(" select * from CMS ");
				rs = ps.executeQuery();
			}
			
			else 
			{
				PreparedStatement ps = con.prepareStatement(" select * from CMS where result = ?");
				ps.setString(1, criteria);
				rs = ps.executeQuery();
			}
			
			while(rs.next())
			{
				CandidateBean cb = new CandidateBean();
				cb.setId(rs.getString(1));
				cb.setName(rs.getString(2));
				cb.setM1(rs.getInt(3));
				cb.setM2(rs.getInt(4));
				cb.setM3(rs.getInt(5));
				cb.setResult(rs.getString(6));
				cb.setGrade(rs.getString(7));
				res.add(cb);
			}
			
			if(res.isEmpty()) {
				return null;
			}else {
				return res;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String generateCandidateId (String name) {
		Connection con = DBUtils.getDbConn();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select candidate_SEQ.nextval from dual");
			String s = name.substring(0, 2).toUpperCase();
			while(rs.next())
			{
				s += rs.getString(1);
			}
			
			return s;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}