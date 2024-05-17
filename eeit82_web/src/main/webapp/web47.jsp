<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	
	<c:set var="page">${ empty param.page ? 1 : param.page }</c:set>
	<c:set var="rpp">${ empty param.rpp ? 10 : param.rpp }</c:set>
	<c:set var="start">${ (page - 1) * rpp }</c:set>
	
	<head>
		<meta charset="UTF-8">
		<title>web47 page</title>
	</head>
	
	<body>
		start: ${ start }
	</body>
</html>