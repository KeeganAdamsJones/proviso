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
	
	<link
		rel="stylesheet" href="./css/site.css">
			
	
	<body>
		
			<div class="logo">
				<img src="images/logo.jpeg" alt="Proviso Logo" width="200" height="148">
			</div>
		
			
		<!-- Tie in the topNav file and where I want it. -->
		<jsp:include page="topNav.jsp" flush="true" />	
	
		
		<main>
				<h1 class="center">Book your stay in our first class luxury suites today!</h1>
			
				
				<div class='hotelImg'>
					<img src="images/hotelRoom.jpeg" alt="hotel room photo" width="500" >
				</div>
		
		
	
		
		</main>
		
		<!-- Page footer	 -->
		<!--  jsp:include page="footer.jsp" flush="true" />-->
	
		 
	
	</body>
</html>