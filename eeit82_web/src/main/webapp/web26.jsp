<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String x = request.getParameter("x");
    	String y = request.getParameter("y");
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web26 page</title>
	</head>
	<body>
		<div>
			I'm web26.
		</div>
		<div>
			x: <%= x %>
			y: <%= y %>
			result: <%= Integer.parseInt(x) + Integer.parseInt(y) %>
		</div>
	</body>
</html>