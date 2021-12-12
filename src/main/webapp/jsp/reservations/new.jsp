<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 


<!-- 
Keegan Jones
CSD - 460 Capstone
Poviso
11/17/2021
 -->

<!--  page where I can fill in form for new booking-->


		<!-- This checks to see if the user is signed in before 
		loading the page, if the user is not signed in, 
		they are redirected to the login page. -->
		<%
			//if(session.getAttribute("login")==null || session.getAttribute("login")==" ")
			//{
			//	response.sendRedirect("login/login.jsp");
			//}
		%>
		
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
    		<h2 style="float:right;font-size:1em;">Welcome David -- <% /*session.getAttribute("login")*/ %><a href="logout.jsp">Logout?</a></h2>
	
			
		
		<!-- Tie in the topNav file and where I want it. -->
		<jsp:include page="../topNav.jsp" flush="true" />	
		
    
    
        
    <!-- 2: Create Form to accept new reservation -->
    	<h2> <% /*session.getAttribute("login")*/ %></h2>
    	
    	<div class="center-form width-35">
	
		<form>
			<input type="hidden" name="action" value="confirmReservation" />
						
	        <!-- Room Size -->
	        <label for="roomSize">Room Size:</label>
	        	<select name="roomSize" id="roomSize">
				  <option value="doubleFull">Double Full Beds</option>
				  <option value="queen">Queen Bed</option>
				  <option value="doubleQueen">Double Queen Beds</option>
				  <option value="king">King</option>
				</select><br><br>
	        
	         <!-- Amenities -->
	        <h3>Amenities: </h3>
	      	<input type="checkbox" id="wifi" name="wifi" value="true">
	      	<label for="wifi">Wifi ($12.99 flat fee)</label><br><br>
			
			<input type="checkbox" id="breakfast" name="breakfast" value="true">
			<label for="breakfast">Breakfast ($8.99/night)</label><br><br>
			
			<input type="checkbox" id="parking" name="parking" value="true">
			<label for="parking">Parking ($19.99/night)</label><br>
			
	        
	         <!-- Guests -->
	         <h3>Guests</h3>
	           <input type="radio" id="guests12" name="guests" value="1-2">
	        <label for="guests12">1-2</label><br><br>
	     
			<input type="radio" id="guests35" name="guests" value="3-5">
			<label for="guests35">3-5</label>			<br><br>
			
			
	        <!-- Loyalty Points -->
	        <h3>Loyalty Points: </h3>
	      	<input checked type="checkbox" id="loyaltyPoints" name="loyaltyPoints" value="true">
	      	<label for="loyaltyPoints">Yes, I want my 150 Loyalty Points</label>
			<br><br>
	
	        <!-- Submit Button -->
	        <input type="submit" value="Submit">
	        <br><br>
        </form>
        </div>
      
    
    	<!-- Page footer	 -->
		<jsp:include page="../footer.jsp" flush="true" />	
		 
	
	</body>
</html>
   