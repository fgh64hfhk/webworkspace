<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web25 page</title>
	</head>
	<body>
		<h1>Java server page</h1>
		<jsp:include page="web26.jsp">
			<jsp:param value="10" name="x"/>
			<jsp:param value="3" name="y"/>
		</jsp:include>
		<hr />
	</body>
</html>