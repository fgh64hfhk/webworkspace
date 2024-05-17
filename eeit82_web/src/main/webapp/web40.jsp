<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web40 page</title>
	</head>
	<body>
		number: 
		<c:catch var="error">
			<%
				String str = request.getParameter("number");
				int number = Integer.parseInt(str);
				out.print(number);
			%>
		</c:catch>
		<div>
			I'm a web40.
		</div>
		<hr />
		error: ${ error }
	</body>
</html>