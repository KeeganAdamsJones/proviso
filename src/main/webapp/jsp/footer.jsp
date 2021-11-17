<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link
		rel="stylesheet" href="./css/site.css">

<% 
	int year = Calendar.getInstance().get(Calendar.YEAR);
	String appName = "Proviso";
	String courseName = "CSD 460";
	String authorName = "Keegan Jones & Michael McNulty";
%>
<footer class="foot">
	<div class="container">
		<p class="float-end mb-1">
			<a href="#">Back to top</a>
		</p>
		<p>
			&copy; <%=year%> - <%=courseName%> (<%=appName%>) (<%=authorName%>) | <a href="https://www.bellevue.ed" target="_blank">Bellevue University</a>
		</p>
	</div>
</footer>