<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
Michael McNulty
CSD - 460 Capstone
Poviso
11/28/2021
References: Some of the code below was taken and adjusted from the site https://www.onlyxcodes.com/2018/01/login-and-register-using-jsp-mysql.html to fit our needs for this project.
-->

<!-- This checks to see if the user is already logged in and 
	directs them back to the new booking page if already logged in. -->
<%
	if (session.getAttribute("login")!=null)
	{
		response.sendRedirect("?action=newBooking");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/site.css">
<title>Login</title>
</head>
<body>

	<div class="logo">
		<img src="../images/logo.jpeg" alt="Proviso Logo" width="200" height="148" style="float:center;clear:both;overflow:auto;">
	</div>
		
	<!-- 2: Create Form to accept new reservation -->
 	<h2 style="float:right;font-size:1em;">Welcome David -- <% /*session.getAttribute("login")*/ %><a href="logout.jsp">Logout?</a></h2>
	
	<!-- Topnav File -->
	<jsp:include page="../topNav.jsp" flush="true" />
	
	<main>
		<!-- Displays an error message for issues with email or password. -->
		<%
			if(request.getAttribute("errorMsg")!=null)
			{
				out.println(request.getAttribute("errorMsg"));
			}
		%>
		<br><br>
		<div class="center-form">
			<form method ="post" name="loginform" onsubmit="return validate();">
	            <label for="user_name">Enter Email/Username: </label>
	            	<input type="text" name="user_name"><br>
	            <label for="password">Enter Password:&emsp;&emsp;&emsp;</label>
	            	<input type="password" name="password"><br>
	            <p>
	            	<input type ="submit" name="login_button" value="Login"> 
	            </p><br>
	            <p>
	            	<a href="/proviso/store/?action=showRegistrationPage">Don't have an account? Click here to sign up</a><br>
	            </p>
	        </form>
        </div>
	
	<!-- The JavaScript below checks to see if the login fields are empty or not before continuing. -->
		<script>
			function validate()
			{
				var user_name = document.loginform.user_name;
				var password = document.loginform.password;
				
				if (user_name.value == null || user_name.value == "")
				{
					window.alert("Email field empty");
					user_name.focus();
					return false;
				}
				if (password.value == null || password.value == "")
				{
					window.alert("Password field empty");
					password.style.background = "#8B0000";
					password.focus();
					return false;
				}
				return true;
			}
		</script>
		
		<!-- This imports the SQL needed to check the login info against the database. -->
		<%@ page import="java.sql.*" %>
		

		
		<%
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				
				/* Credentials below need updated. 
				
				//Edits made by Keegan Jones
				// values from JdbcManager
				jdbcUrl = "jdbc:mysql://localhost:3306/proviso?useSSL=false";
				jdbcUserName = "proviso_user";
				jdbcPassword = "MySQL5IsGreat!";
				*/
				
				//This is how Michael had it
				//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root", "");
				
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/proviso?useSSL=false","proviso_user", "MySQL5IsGreat!");
				
				if (request.getParameter("login_button")!=null)
				{
					String dbuser_name, dbpassword;
					
					String user_name, password;
					
					user_name=request.getParameter("user_name");
					password=request.getParameter("password");
					
					PreparedStatement pstmt=null;
					
					pstmt=con.prepareStatement("SELECT * FROM customer WHERE user_name=? AND password=?");
					pstmt.setString(1,user_name);
					pstmt.setString(2,password);
					
					ResultSet rs=pstmt.executeQuery();
					
					if(rs.next())
					{
						dbuser_name=rs.getString("user_name");
						dbpassword=rs.getString("password");
						
						if(user_name.equals(dbuser_name) && password.equals(dbpassword))
						{
							/* This sets the session name and stores the username (Email address) associated with the session */
							session.setAttribute("login",dbuser_name);
							// TODO: Move all of this before the HTML because this
							// redirect will fail since we've already started sending HTML to the
							// browser
							response.sendRedirect("../reservations/new.jsp");
						}
					}
					else
					{
						request.setAttribute("errorMsg", "invalid username (email) or password");
					}
					con.close();
				}
			}
			catch (Exception e)
			{
				out.println(e);	
			}
		
		%>
		
		
	</main>
	
	<!-- Page Footer File -->
	<jsp:include page="../footer.jsp" flush="true" />
</body>
</html>