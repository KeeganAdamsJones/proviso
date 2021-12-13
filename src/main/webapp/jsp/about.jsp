<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
Michael McNulty
CSD - 460 Capstone
Poviso
11/28/2021
 -->

<!--  
	Image references 
	hotel bedroom image: https://www.usatoday.com/picture-gallery/travel/hotels/2020/05/18/coronavirus-how-transform-your-bedroom-into-luxury-hotel-suite/5214698002/
	
-->


<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8">
	<title>Proviso</title>
	</head>
	
	<link rel="stylesheet" href="../css/site.css">
			
	
	<body>
	
		<div class="logo">
			<img src="../images/logo.jpeg" alt="Proviso Logo" width="200" height="148" style="float:center;clear:both;overflow:auto;">
		</div>
		
		<!-- 2: Create Form to accept new reservation -->
   		<h2 style="float:right;font-size:1em;">Welcome David -- <% /*session.getAttribute("login")*/ %><a href="/proviso/store/?action=logoutUser">Logout?</a></h2>
		
			
		<!-- Tie in the topNav file and where I want it. -->
		<jsp:include page="topNav.jsp" flush="true" />	
	
		
		<main id="about_us_page">
			<h1>About Us</h1>
			<h2 style="text-align:center;">Get to Know Proviso</h2>
			
			<p style="text-align:center; width:60%;">
				Welcome to Proviso! Our company Proviso has been in business for over 50 years and is a trusted and well known name 
				in the travel industry. Our new Proviso site has been designed to allow all our customers to be able to register an account
				with us and then log in and book any of their vacations at our incredible number of supported hotels across the globe.
				
			</p>

		</main>
		
		<!-- Page footer	 -->
	  	<jsp:include page="footer.jsp" flush="true" />
	
		 
	
	</body>
</html>