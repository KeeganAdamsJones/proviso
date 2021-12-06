<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
    <!--  page where I can search for reservation by id-->
    
 <!-- 
Keegan Jones
CSD - 460 Capstone
Poviso
11/23/2021
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
			<img src="../images/logo.jpeg" alt="Proviso Logo" width="200" height="148">
		</div>
		
			
	<!-- Tie in the topNav file and where I want it. -->
	<jsp:include page="../topNav.jsp" flush="true" />	
	
    
   
    <!--  1: Create a form that takes in the ReservationID -->
    <h1 >Search Reservation Booking</h1><br><br>
    	
    	<div class="center-form width-35">
	
		<form>
			<input type="hidden" name="action" value="searchReservation" />
			
			<label for="searchReservation">Please Enter Reservation Number:</label>
		        <input type="text" id="searchReservation" name="searchReservation"><br><br>
    	</form>
    	</div>
    	
    <!--  2: Server-side lookup -->
    
    
    <!--  3: Page that displays the (previously created) reservation -->
        
        
    	
    	<!-- Page footer	 -->
		<jsp:include page="../footer.jsp" flush="true" />	
		
	</body>
	</html>
	