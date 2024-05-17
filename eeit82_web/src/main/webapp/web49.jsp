<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="com.apis.MyUtils" %>

<!DOCTYPE html>
<html>
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/mydatabase"
		user="root"
		password="root"
	/>
	<sql:update>DELETE FROM travel</sql:update>
	<sql:update>ALTER TABLE travel AUTO_INCREMENT = 1</sql:update>
	
	<c:import url="https://data.moa.gov.tw/Service/OpenData/ODwsv/ODwsvMovingRoad.aspx" var="data"></c:import>
	
	<c:set var="travel" value="${ MyUtils.parseTravel(data) }"></c:set>

	<c:forEach items="${ travel }" var="item">
		<sql:update>
			INSERT INTO travel (tname, city, town) VALUES (?, ?, ?)
			<sql:param>${ item["tname"] }</sql:param>
			<sql:param>${ item["city"] }</sql:param>
			<sql:param>${ item["town"] }</sql:param>
		</sql:update>
	</c:forEach>
	<head>
		<meta charset="UTF-8">
		<title>web49 page</title>
	</head>
	
	<body>
		<h1>擁抱田園風光-農村旅遊資訊</h1>
	</body>
</html>