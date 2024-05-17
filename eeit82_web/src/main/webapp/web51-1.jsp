<%@page import="com.beans.Bike"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	Integer a = (Integer) session.getAttribute("a");
	int[] b = (int[]) session.getAttribute("b");
	
	Bike bike = (Bike) session.getAttribute("bike");
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>web51-1 page</title>
	</head>

	<body>
		<c:catch var="error">		
			a = <%= a %> <br>
			b[2] = <%= b[2] %> <br>
			bike = <%= bike %> <br>
			bike_EL = ${ sessionScope.bike }
		</c:catch>
		
		<c:if test="${ !empty error }">
			<c:out value="${ error }"></c:out> <br>
			重新取得session: <a href="web51.jsp">web51</a>
		</c:if>
		
		<hr>
		
		<div>
			導向直接銷毀session頁面: <a href="web52.jsp">web52</a>
		</div>
	</body>
</html>