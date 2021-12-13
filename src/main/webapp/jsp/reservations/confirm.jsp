<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

 
 
 <!-- 
Keegan Jones
CSD - 460 Capstone
Poviso
11/17/2021
 -->
 
  <!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8">
	<title>Proviso Confirm</title>
	</head>
	
	<link
		rel="stylesheet" href="../css/site.css">
			
	
	<body>
		
		<div class="logo">
			<img src="../images/logo.jpeg" alt="Proviso Logo" width="200" height="148" style="float:center;clear:both;overflow:auto;">
		</div>
		
		<!-- 2: Create Form to accept new reservation -->
   		<h2 style="float:right;font-size:1em;">Welcome -- <% /*session.getAttribute("login")*/ %><a href="/proviso/store/?action=logoutUser">Logout?</a></h2>
			
		<!-- Tie in the topNav file and where I want it. -->
		<jsp:include page="../topNav.jsp" flush="true" />	
	
    
    <%!
    public String makeItPretty(String value){
    	if(value == null) {return "no";}
    	if(value != null) {return "yes";}
      return value;
    }
    %>
        
    <!-- 2: Output Summary of Form to confirm new reservation -->
    	<h1>New Reservation Booking</h1>
    	
    	<div class="center-form width-35">
			
		<form>
			<input type="hidden" name="action" value="createReservation" />
						
			<!-- Check in date -->
	        <input type="hidden" name="checkIn"
	        	value="<%=request.getParameter("checkIn") %>" />
	        <label for="checkIn">Check in date:</label>
	        <%=request.getParameter("checkIn") %>
	        <br><br>
	        
	        <!-- Check out date -->
	        <input type="hidden" name="checkOut"
	        	value="<%=request.getParameter("checkOut") %>" />
	        <label for="checkOut">Check out date:</label>
	        <%=request.getParameter("checkOut") %>
	        <br><br>
	        
	        	      
			<!-- Room Size -->
			<input type="hidden" name="roomSize" 
				value="<%=request.getParameter("roomSize") %>" />
	        <label for="roomSize">Room Size:</label>
	        <%=request.getParameter("roomSize") %>
	        <br><br>
	        
	         
	         
	         <!-- Amenities -->
	        <h3>Amenities: </h3>
	        <input type="hidden" name="wifi" 
				value="<%=request.getParameter("wifi") %>" />
	      	<label for="wifi">Wifi ($12.99 flat fee):</label>
	      	<%= makeItPretty(request.getParameter("wifi")) %>
			<br>
			
			<input type="hidden" name="breakfast" 
				value="<%=request.getParameter("breakfast") %>" />
			<label for="breakfast">Breakfast ($8.99/night)</label>
			<%= makeItPretty(request.getParameter("breakfast")) %>
			<br>
			
			<input type="hidden" name="parking" 
				value="<%=request.getParameter("parking") %>" />
			<label for="parking">Parking ($19.99/night)</label>
			<%= makeItPretty(request.getParameter("parking")) %>
			<br>
			
	        
	         <!-- Guests -->
	         <h3>Guests</h3>
	        <input type="hidden" name="guests" 
				value="<%=request.getParameter("guests") %>" />
	        <%= request.getParameter("guests") %>
	        
			
			<br><br>
	        
	        <!-- Loyalty Points -->
	        <h3>150 Loyalty Points earned? </h3>
	        <input type="hidden" name="loyaltyPoints" 
				value="<%=request.getParameter("loyaltyPoints") %>" />
	      	<!--  <label for="loyaltyPoints">Yes, I want my 150 Loyalty Points</label> -->
			<%= makeItPretty(request.getParameter("loyaltyPoints")) %>
			
			<br><br><br>
			
	        <!-- Submit Button -->
	        <input type="submit" value="Confirm" class="center">
        </form>
        </div>
        
       
       

    	<!-- Page footer	 -->
		<jsp:include page="../footer.jsp" flush="true" />
	
		 
	
	</body>
</html>
   