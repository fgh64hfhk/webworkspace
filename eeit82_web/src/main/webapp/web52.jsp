<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="refresh" content="10; url=web51.jsp">
		<title>web52 page</title>
	</head>
	<body>
		<div>session.invalidate</div>
		
		<hr>
		
		<div>
			返回登入頁面: <a href="web51-1.jsp">web51-1</a>
		</div>
		
		<hr>
		
		返回首頁: <a href="web51.jsp">web51</a>
	</body>
</html>