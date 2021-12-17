<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
Michael McNulty
CSD - 460 Capstone
Poviso
11/28/2021
References: Some of the code below was taken and adjusted from the site https://www.onlyxcodes.com/2018/01/login-and-register-using-jsp-mysql.html to fit our needs for this project.
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/site.css">
<title>Registration</title>
</head>
<body>
	<div class="logo">
		<img src="../images/logo.jpeg" alt="Proviso Logo" width="200" height="148">
	</div>
	
	<!-- Topnav File -->
	<jsp:include page="../topNav.jsp" flush="true" />
	
	<main>
		<!-- This displays a message if the user is successfully registered. -->
		<%
			if (request.getAttribute("successfulMsg")!=null)
			{
				out.println(request.getAttribute("successfulMsg"));
			}
		%>
		<br><br>
		<form method="post" onsubmit="return validate();">
        <p>
            <label for="fname">First Name: </label>
                <input type="text" name="fname" placeholder="Enter first name"><br>
            <label for="lname">Last Name: </label>
                <input type="text" name="lname" placeholder="Enter last name"><br>
            <label for="email">Email Address (Username): </label>
                <input type="email" name="email" placeholder="Enter email address"><br>
            <label for="password">Password: </label>
            	<input type="password" name="password" placeholder="enter password"><br>
        </p>
        <p>
            <input type="reset" value="Reset">
            <input type="submit" name="register_button" value="Register">
        </p><br>
        <p>
        	<a href="/proviso/store/?action=showLoginPage">Already have an account? Click here to sign in instead</a><br>
        </p>
    </form>
    
    <script>
    	function validate()
    	{
    		// this sets the allowed entries for the first name to only be lowercase or capital letters.
    		var first_name= /^[a-z A-Z]+$/;
    		
    		// this sets the allowed entries for the last name to only be lowercase or capital letters.
    		var last_name= /^[a-z A-Z]+$/;
    		
    		// this sets the valid email patterns that a user can enter.
    		var email_address= /^[\w\d\.]+\@[a-z A-Z\.]+\.[A-Z a-z]{1,4}$/;
    		
    		// this sets the allowed entries for the password for the user to enter.
    		var password_choice=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/;
    		
    		if(!first_name.test(fname.value) || fname.value=="")
   			{
   				alert("Please enter a valid first name using only letters and no numbers or symbols.");
   				fname.focus();
   				fname.style.background = "#8B0000";
   				return false;
   			}
    		if(!last_name.test(lname.value) || lname.value=="")
   			{
    			alert("Please enter a valid last name using only letters and no numbers or symbols.");
    			lname.focus();
    			lname.style.background = "#8B0000";
    			return false;
   			}
    		if(!email_address.test(email.value) || email.value=="")
   			{
   				alert("Invalid email entered. Please enter a valid email address.");
   				email.focus();
   				email.style.background = "#8B0000";
   				return false;
   			}
    		if(!password_choice.test(password.value) || password.value=="")
   			{
   				alert("Password must be 6 to 12 characters and can be any characters, numbers, or any of the following symbols: !@#$%&*()<>");
   				password.focus();
   				password.style.background = "#8B0000";
   				return false;
   			}
    	}
    </script>
    
    <%@ page import="java.sql.*" %>
    
    <%
    	if(session.getAttribute("login")!=null)
    	{
    		response.sendRedirect("new.jsp");
    	}
    %>
    
    <%
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    		
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/proviso?useSSL=false","proviso_user","MySQL5IsGreat!");
    		
    		if(request.getParameter("register_button")!=null)
    		{
    			String first_name, last_name, user_name, password;
    			
    			first_name=request.getParameter("fname");
    			last_name=request.getParameter("lname");
    			user_name=request.getParameter("email");
    			password=request.getParameter("password");
    			
    			PreparedStatement pstmt=null;
    			
    			pstmt=con.prepareStatement("INSERT into customer(first_name,last_name,user_name,password) values(?,?,?,?)");
    			pstmt.setString(1,first_name);
    			pstmt.setString(2,last_name);
    			pstmt.setString(3,user_name);
    			pstmt.setString(4,password);
    			
    			pstmt.executeUpdate();
    			
    			request.setAttribute("successfulMsg", "You've been registered successfully! Please login now.");
    		
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