package com.bumblebee.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoanServlet
 */
@WebServlet("/loanForm")
public class LoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fullName = request.getParameter("fname");
		String idNumber = request.getParameter("nid");
		String startDate = request.getParameter("sdate");
		String dateOfBirth = request.getParameter("dob");
		String loanBalance = request.getParameter("bal");
		String message = request.getParameter("msg");
		
		HttpSession session = request.getSession();
		
		String username = (String) session.getAttribute("name");
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3308/BumbleBee?useSSL=false","root","1234");
			PreparedStatement pst = con.prepareStatement("insert into loans(user_name, full_name, id_number, start_date, date_of_birth, loan_balance, message) values(?,?,?,?,?,?,?)");
			pst.setString(1, username);
			pst.setString(2, fullName);
			pst.setString(3, idNumber);
			pst.setString(4, startDate);
			pst.setString(5, dateOfBirth);
			pst.setString(6, loanBalance);
			pst.setString(7, message);
			
			int rowCount = pst.executeUpdate();
			
			
			if(rowCount>0) {
				request.setAttribute("status", "success");
				
			}
			else{
				request.setAttribute("status", "failed");
			}
			

		}
		catch (Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(con != null) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		
	}

	}
}