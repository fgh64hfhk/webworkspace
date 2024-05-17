<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="refresh" content="5; url=login.jsp">
	<title>Logout Page</title>
	</head>
	<body>
		<h1>Logout Page</h1>
		<div>五秒後返回登入頁面</div>
	</body>
</html>