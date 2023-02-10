<%
    if(session.getAttribute("name")==null){
        response.sendRedirect("login.jsp");
    }
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BumbleBee - Admin Portal</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<!-- Add a Bootstrap container -->
<div class="container">
  <h1 class="text-center">Welcome to BumbleBee - Admin Portal</h1>
  <h2 class="text-center"><%= session.getAttribute("name") %></h2>

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

<!-- Add Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>