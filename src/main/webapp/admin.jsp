<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("adminLogin.jsp");
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>BumbleBee - Admin Portal</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet">
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">BumbleBee Admin
			</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#users">Users</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Loans</a></li>
					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>	
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about"><%= session.getAttribute("name") %></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead clr text-white text-center">
		<div class="container d-flex align-items-center flex-column">

			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">BumbleBee Loan Service admin panel</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">cis6003 advanced-programming</p>
		</div>
	</header>

	<!-- About Section-->
	<section class="page-section clr text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">About</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-15">
					<p>"Welcome to the BumbleBee Admin Panel! This portal is designed to provide you with an overview of all the users and loans options within the BumbleBee system. You can easily view, manage user information, and loans."</p>
				</div>
			</div>
		
		</div>
	</section>
	
	<!-- Users Section-->
	<section class="page-section" id="users">
	
	<div class="container">
		<!-- Loan application Section Heading-->
		<h2
			class="page-section-heading text-center text-uppercase text-secondary mb-0">Registered Users</h2>
		<!-- Icon Divider-->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
	  <!-- Add a Bootstrap table -->
	  <table class="table table-bordered">
	    <thead>
	      <tr>
	        <th>User Name</th>
	        <th>User Email</th>
	        <th>User Mobile</th>
	      </tr>
	    </thead>
	    <tbody>
	      <%
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/BumbleBee?useSSL=false", "root", "1234");
	            Statement st = con.createStatement();
	            ResultSet rs = st.executeQuery("SELECT userName, userEmail, UserMobile FROM users");
	            
	            while(rs.next()) {
	      %>
	      <tr>
	        <td><%=rs.getString("userName")%></td>
	        <td><%=rs.getString("userEmail")%></td>
	        <td><%=rs.getString("UserMobile")%></td>
	      </tr>
	      <%
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	      %>
	    </tbody>
	  </table>
	  </div>
	</section>
	
	<!-- loan Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Loan application Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Requested Loans</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			
			<!-- Add a Bootstrap table -->
		  <table class="table table-bordered">
		    <thead>
		      <tr>
		        <th>User Name</th>
		        <th>ID Card Number</th>
		        <th>Started Date</th>
		        <th>DOB</th>
		        <th>Loan Balance</th>
		        <th>Message</th>
		      </tr>
		    </thead>
		    <tbody>
		      <%
		        try {
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/BumbleBee?useSSL=false", "root", "1234");
		            Statement st = con.createStatement();
		            ResultSet rs = st.executeQuery("SELECT full_name, id_number, start_date, date_of_birth, loan_balance, message FROM loans");
		            
		            while(rs.next()) {
		      %>
		      <tr>
		        <td><%=rs.getString("full_name")%></td>
		        <td><%=rs.getString("id_number")%></td>
		        <td><%=rs.getString("start_date")%></td>
		        <td><%=rs.getString("date_of_birth")%></td>
		        <td><%=rs.getString("loan_balance")%></td>
		        <td><%=rs.getString("message")%></td>
		      </tr>
		      <%
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		      %>
		    </tbody>
		  </table>
			
		</div>
	</section>

	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>cis6003 advanced-programming</small>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
</body>
</html>
