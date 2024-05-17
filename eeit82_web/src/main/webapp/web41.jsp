<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.apis.*" %>
<c:set var="score">${ MyUtils.createScore() }</c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web41 page</title>
	</head>
	<body>
		<div>
			Score: ${ score } <hr />
			<c:if test="${ score >= 60 }">Pass</c:if>
			<c:if test="${ score < 60 }">Down</c:if>
			<hr />
			<c:choose>
				<c:when test="${ score >= 90 }">A</c:when>
				<c:when test="${ score >= 80 }">B</c:when>
				<c:when test="${ score >= 70 }">C</c:when>
				<c:when test="${ score >= 60 }">D</c:when>
				<c:otherwise>E</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>