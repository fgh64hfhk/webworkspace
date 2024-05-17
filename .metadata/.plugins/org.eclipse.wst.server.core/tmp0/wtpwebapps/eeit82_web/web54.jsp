<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web54 page</title>
	</head>
	<body>
		<div>產生隨機數字</div>
		<div>
		<%
    		out.print((int)(Math.random() * 49 + 1));
    	%>
    	</div>
	</body>
</html>