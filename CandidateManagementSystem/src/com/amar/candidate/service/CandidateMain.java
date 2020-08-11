package com.amar.candidate.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.amar.candidate.bean.CandidateBean;
import com.amar.candidate.dao.CandidateDAO;
import com.amar.candidate.util.WrongDataException;

public class CandidateMain {
	
	public String addCandidate(CandidateBean bean)throws WrongDataException, SQLException {
		try {
			if(bean == null || bean.getName() == " " || bean.getName().length() < 2 || bean.getM1() < 0 ||bean.getM1() > 100 || bean.getM2() < 0 || bean.getM2() > 100 || bean.getM3() < 0 || bean.getM3() > 100) {
				throw new WrongDataException();
			}
		}catch(WrongDataException e)
		{
			return "DATA INCORRECT";
		}
		
		CandidateDAO dao = new CandidateDAO();
		String id = dao.generateCandidateId(bean.getName());
		bean.setId(id);
		int totalMark = bean.getM1() + bean.getM2() + bean.getM3();
		if(totalMark >= 240)
		{
			bean.setResult("Pass");
			bean.setGrade("Distinct");
		}
		
		else if(totalMark >= 180 && totalMark < 240)
		{
			bean.setResult("Pass");
			bean.setGrade("First Class");
		}
		
		else if(totalMark >= 150 && totalMark < 180)
		{
			bean.setResult("Pass");
			bean.setGrade("Second Class");
		}
		
		else if (totalMark >= 105 && totalMark < 150)
		{
			bean.setResult("Pass");
			bean.setGrade("Third Class");
		}
		
		else {
			bean.setResult("Fail");
			bean.setGrade("No Grade");
		}
		
		dao.addCandidate(bean);
		String result;
		if(totalMark >= 105) {
			result = "Pass";
		}else {
			result = "Fail";
		}
		
		return id + " : " + result;
	}
	
	public ArrayList<CandidateBean> displayAll(String criteria) throws SQLException
	{
		ArrayList<CandidateBean> res = new ArrayList<CandidateBean>();
		if(criteria.equals("Pass")||criteria.equals("Fail")||criteria.equals("All"))
		{
			CandidateDAO dao = new CandidateDAO();
			res = dao.getByResult(criteria);
		}
		else
		{
			try{
				throw new WrongDataException();
			}
			catch(WrongDataException e)
			{
				return null;
			}
		}
		return res;
	}

	public static void main(String[] args) throws SQLException, WrongDataException {
		
		CandidateMain cm = new CandidateMain();
		String res = " ";
		try {
			CandidateBean cb = new CandidateBean();
			cb.setName("Kuldeep");
			cb.setM1(80);
			cb.setM2(100);
			cb.setM3(80);
			res = cm.addCandidate(cb);
			
			ArrayList<CandidateBean> al = cm.displayAll("Pass");
			Iterator<CandidateBean> i =al.iterator();
			while(i.hasNext())
			{
				CandidateBean bean = i.next();
				System.out.println(bean.getId()+" "+bean.getName()+" "+bean.getResult()+" "+bean.getGrade());
				
			}
		}catch (NullPointerException e) {
			System.out.println("wrong value select ALL/PASS/FAIL");
		}
		System.out.println(res);
	}
}