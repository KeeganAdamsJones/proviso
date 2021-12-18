<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 
Keegan Jones
 -->

<html>
<head>
<meta charset="UTF-8">
<title>Proviso | Contact Us</title>

<link
	rel="stylesheet" href="../css/site.css">
    
</head>
    <title>Contact Us</title>
</head>

<body>

	<div class="logo">
		<img src="../images/logo.jpeg" alt="Proviso Logo" width="200" height="148" style="float:center;clear:both;overflow:auto;">
	</div>
	
	<!-- 2: Create Form to accept new reservation -->
  	<h2 style="float:right;font-size:1em;">Welcome -- <% /*session.getAttribute("login")*/ %><a href="/proviso/store/?action=logoutUser">Logout?</a></h2>
		
			
		<!-- Tie in the topNav file and where I want it. -->
		<jsp:include page="topNav.jsp" flush="true" />	
	



	<h1>We look forward to hearing from you!</h1>
		
	
	<br /><br />
	

	
			

	<p>1234 Hotel Dr.</p>
	<p>Aurora, MO.  65605</p>

		
	
	</br>
		<p class="list-group-item border-0">Phone: 1.800.PRO.VISO</p>
			<p class="list-group-item border-0">_OR_: 1.800.776.2416</p>
			</br>
			<p class="list-group-item border-0">Email: Proviso@Proviso.com</p>
		
		

<!-- Page footer	 -->
	  	<jsp:include page="footer.jsp" flush="true" />



</body>
</html>