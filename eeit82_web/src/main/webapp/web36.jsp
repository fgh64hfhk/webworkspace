<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web36 page</title>
	</head>
	<body>
		<div>I'm a web36</div>
		names[2] = ${ names[2] } <br />
		request.names[2] = ${ requestScope.names[2] } <br />
		session.names[2] = ${ sessionScope.names[2] } <br />
		application.names[2] = ${ applicationScope.names[2] } <br />
	</body>
</html>