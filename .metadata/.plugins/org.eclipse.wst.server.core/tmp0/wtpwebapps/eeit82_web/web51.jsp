<%@page import="com.beans.Bike"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	int a = 10;
	session.setAttribute("a", a);
	a++;
	
	int[] b = {1, 2, 3, 4};
	session.setAttribute("b", b);
	b[2] = 33;
	
	Bike bike = new Bike();
	session.setAttribute("bike", bike);
	bike.upSpeed();
	bike.upSpeed();
	bike.downSpeed();
	bike.upSpeed();
	bike.upSpeed();
	
	session.setMaxInactiveInterval(5);
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>web51 page</title>
	</head>
	
	<body>
	a1 = <%= a %> <br>
	a2 = ${ a }
	
	<hr>
	
	b[2] = <%= b[2] %> <br>
	b[2] = ${ b[2] }
 
 	<hr>
 	
 	bike = <%= bike %> <br>
 	bike = ${ bike }
 	
 	<hr>
 	
 	轉向登入頁面: <a href="web51-1.jsp">web51-1</a>
	</body>
</html>