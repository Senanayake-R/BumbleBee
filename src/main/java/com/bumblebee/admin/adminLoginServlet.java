package com.bumblebee.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/adminLogin")
public class adminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String adminEmail = request.getParameter("adminusername");
		String adminPwd = request.getParameter("adminpassword");
		
		HttpSession session = request.getSession(); 
		
		Connection con = null;
		
		RequestDispatcher dispatcher = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3308/BumbleBee?useSSL=false","root","1234");
			PreparedStatement pst = con.prepareStatement("select * from administrators where adminEmail = ? AND adminPwd = ?");
			pst.setString(1, adminEmail);
			pst.setString(2, adminPwd);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				session.setAttribute("name",rs.getString("adminName"));
				dispatcher = request.getRequestDispatcher("admin.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("adminLogin.jsp");
			}
			

			dispatcher.forward(request, response);
			
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
}
