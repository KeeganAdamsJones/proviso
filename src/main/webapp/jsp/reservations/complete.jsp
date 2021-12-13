<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <!-- 
Keegan Jones
CSD - 460 Capstone
Poviso
12/1/2021
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
	
    

    
    <%
    String checkIn = request.getParameter("checkIn");
    String checkOut = request.getParameter("checkOut");
    String roomSize = request.getParameter("roomSize");
	//String amenities = request.getParameter("amenities");
	String guests = request.getParameter("guests");
	Boolean loyaltyPoints = Boolean.parseBoolean(request.getParameter("loyaltyPoints").trim());
	String customer_id = request.getParameter("customer");
	
	// If they selected to add loyalty points, add 150 points.
	int pointsToAdd = 0;
	if(loyaltyPoints) {
		pointsToAdd = 150;
		System.out.println("Setting points to 150");
	}
	System.out.println("Loyalty Points parameter: <"+loyaltyPoints+">");

	String wifi = request.getParameter("wifi");
	String breakfast = request.getParameter("breakfast");
	String parking = request.getParameter("parking");
	String amenities = "";
	if (wifi != null) {
		amenities += "wifi: yes</br>";
	}
	if (breakfast != null) {
		amenities += "breakfast: yes</br>";
	}
	if (parking != null) {
		amenities += "parking: yes</br>";
	}
			
	proviso.model.Reservation newReservation = new proviso.model.Reservation(); 
	//newReservation.setReservation_id(reservation_id);
	newReservation.setCheckIn(checkIn);
	newReservation.setCheckOut(checkOut);
	newReservation.setRoomSize(roomSize);
	newReservation.setAmenities(amenities);
	newReservation.setGuests(guests);
	newReservation.setLoyaltyPoints(pointsToAdd);
	newReservation.setCustomer_id(customer_id);
	

	proviso.service.impl.JdbcReservationDao reservationDao = new proviso.service.impl.JdbcReservationDao(); 
	long reservation_id = reservationDao.add(newReservation);

	System.out.println(newReservation.toString());
	System.out.println(String.format("Reservation{checkIn=%s, checkOut=%s, roomSize=%s, amenities=%s, guests=%s, loyaltyPoints=%s, customer_id=%s}", checkIn, checkOut, roomSize, amenities, guests, loyaltyPoints, customer_id));

	// Check to make sure we succeeded
	if (reservation_id > 0){
		
		String user = (String) session.getAttribute("login");
		System.out.println("Adding loyalty points for user " + user + " number: " + pointsToAdd);
		if(user!= "") {
			proviso.service.impl.JdbcCustomerDao customerDao = new proviso.service.impl.JdbcCustomerDao(); 
			customerDao.addLoyaltyPoints(user,pointsToAdd);
		}
	}
	
    %>


        
    <!-- 2: Output Summary of Form to confirm new reservation number -->
    	<h1>RESERVATION BOOKED</h1>
    	
    	<div class="center-form width-35">
			Your new reservation confirmation number is: 
		<%= reservation_id %>
        </div>
        <div><a href="/proviso/store/?action=showLoyaltyPoints">Click Here</a> if you'd like to view your current loyalty points.</div>
        
   		<br><br><br>
       
       

    	<!-- Page footer	 -->
		 <jsp:include page="../footer.jsp" flush="true" />
	
		 
	
	</body>
</html>
   