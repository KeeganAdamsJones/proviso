<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
    <!--  page where I can search for reservation by id-->
    
 <!-- 
Keegan Jones
CSD - 460 Capstone
Poviso
12/7/2021
 -->   
 
<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8">
	<title>Proviso Search</title>
	</head>
	
	<link
		rel="stylesheet" href="../css/site.css">
			
	
	<body>
	
		<div class="logo">
			<img src="../images/logo.jpeg" alt="Proviso Logo" width="200" height="148" style="float:center;clear:both;overflow:auto;">
		</div>
		
		<!-- 2: Create Form to accept new reservation -->
   		<h2 style="float:right;font-size:1em;">Welcome -- <% /*session.getAttribute("login")*/ %><a href="logout.jsp">Logout?</a></h2>
		
			
	<!-- Tie in the topNav file and where I want it. -->
	<jsp:include page="../topNav.jsp" flush="true" />	
	
    
   
    <!--  1: Create a form that takes in the ReservationID -->
    <h1 >Your Reservation</h1>
    	
    	<div class="center-form width-35">
			<form>
		    	<%
		    	
		    	
		    	String id = request.getParameter("searchReservation");
		    	
		    	System.out.println(id);
		    	long looong_id = Long.parseLong(id);
				
				
		    	proviso.service.impl.JdbcReservationDao reservationDao = new proviso.service.impl.JdbcReservationDao(); 
		    	proviso.model.Reservation res = reservationDao.find(looong_id);
				
				
		    	// TODO: If res not found, display error
		    	
		    	// TODO: Fill out the rest of the res stuff
		    	
		    	%>
	    	
		 
		    	<h2>Reservation ID: <%=res.getReservation_id()%></h2><br><br>
		    
		    	
		    	<h3 class="center-form">Dates:</h3>
		    	<p>Check In: <%=res.getCheckIn() %> </p>
		    	<p>Check Out: <%=res.getCheckOut() %> </p>
		    	
		    	<h3 class="center-form">Room Size:</h3>
		    	<p>Beds: <%=res.getRoomSize() %> </p>
		    	
		    	<h3 class="center-form">Amenities:</h3>
		    	<p>You Chose: <%=res.getAmenities() %> </p>
		    	
		    	<h3 class="center-form">Guests</h3>
		    	<p>Number of Guests: <%=res.getGuests() %> </p>
		    	
		    	<h3 class="center-form">You Earned Points!</h3>
		    	<p>Loyalty Points: <%=res.getLoyaltyPoints() %> </p>
		    	<p></p>
    		</form>
    	</div>
    	
          
        
    	
    	<!-- Page footer	 -->
		<jsp:include page="../footer.jsp" flush="true" />	
		
	</body>
	</html>
	