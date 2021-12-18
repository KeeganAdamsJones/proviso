<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
Keegan Jones
CSD - 460 Capstone
Poviso
11/16/2021
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
	
	<link rel="stylesheet" href="/proviso/css/site.css">
			
	
	<body>
		
		<div class="logo">
			<img src="./images/logo.jpeg" alt="Proviso Logo" width="200" height="148" style="float:center;clear:both;overflow:auto;">
		</div>
		<!-- This checks to see if the user is logged in to determine if it should show their login name or a "login" button. -->
		
		<!-- Either this script or the other line beneath it need to be used to check if the user is logged in and determine what will be displayed. -->
		<script>
			if(session.getAttribute("login")==null || session.getAttribute("login")==" ")
				{
					document.getElementById('logoutButton').style.display'none';
				}
		</script>
		
		<%
			if(session.getAttribute("login")==null || session.getAttribute("login")==" ")
			{
				// this doesn't work yet, it's a formatting issue.
				// document.getElementById('logoutButton').style.display='none';
			}
		%>
		
		<h2 style="float:right;font-size:1em;">Welcome -- <% session.getAttribute("login"); %><a href="/proviso/store/?action=logoutUser" id="logoutButton">Logout?</a></h2>
   		
		
			
		<!-- Tie in the topNav file and where I want it. -->
		<jsp:include page="topNav.jsp" flush="true" />	
	
		
		<%	
			if(request.getParameter("reservation_id")!=null)
			{
				// TODO: Make it purdy
				out.println(" WOOOOOOOOOOHOO:");
				out.println(request.getParameter("reservation_id"));
			}
		%>
		<main>
				<h1>Book your stay in our first class luxury suites today!</h1>
			
				
				<div class='hotelImg'>
					<img src="images/hotelRoom.jpeg" alt="hotel room photo" width="500" >
				</div>
		
		
	
		
		</main>
		
		<!-- Page footer	 -->
	  	<jsp:include page="footer.jsp" flush="true" />
	
		 
	
	</body>
</html>