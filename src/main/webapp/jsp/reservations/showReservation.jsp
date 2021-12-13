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
    <h1 >Your Reservation</h1><br><br>
    	
    	<div class="center-form width-35">
		
    	<%
    	
    	
    	String id = request.getParameter("searchReservation");
    	
    	System.out.println(id);
    	long looong_id = Long.parseLong(id);
		
		
    	proviso.service.impl.JdbcReservationDao reservationDao = new proviso.service.impl.JdbcReservationDao(); 
    	proviso.model.Reservation res = reservationDao.find(looong_id);
		
		
    	// TODO: If res not found, display error
    	
    	// TODO: Fill out the rest of the res stuff
    	
    	%>
    	
    	<p>Reservation id: <%=res.getReservation_id()%> </p>
    	<br><br>
    	<p>Check In: <%=res.getCheckIn() %> </p>
    	<p>Check Out: <%=res.getCheckOut() %> </p>
    	<p>Room Size: <%=res.getRoomSize() %> </p>
    	<p>Amenities: <%=res.getAmenities() %> </p>
    	<p>Guests: <%=res.getGuests() %> </p>
    	<p>Loyalty Points: <%=res.getLoyaltyPoints() %> </p>
    	<p></p>
    	</div>
    	
          
        
    	
    	<!-- Page footer	 -->
		<jsp:include page="../footer.jsp" flush="true" />	
		
	</body>
	</html>
	