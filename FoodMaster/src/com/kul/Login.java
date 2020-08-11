package com.kul;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kul.dao.LoginDao;

@WebServlet("/login")
public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("text/html");  
		
		String name = req.getParameter("uname");
		String pass = req.getParameter("upass");
		
		PrintWriter out = res.getWriter();
		LoginDao ld = new LoginDao();
		if(ld.check(name, pass)) {
			RequestDispatcher rd = req.getRequestDispatcher("index.html");
			rd.forward(req, res);
		}else {
			out.print("Sorry username or password error");  
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, res);
		}

	}

}
