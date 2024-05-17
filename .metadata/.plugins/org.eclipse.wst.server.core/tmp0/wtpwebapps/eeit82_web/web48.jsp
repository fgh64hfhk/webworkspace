<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/mydatabase"
		user="root"
		password="root"
	/>
	
	<sql:update>
		UPDATE customer SET cname = ? WHERE id = ?
		<sql:param>10</sql:param>
		<sql:param>Bob</sql:param>
	</sql:update>
	
	<head>
		<meta charset="UTF-8">
		<title>web48 page</title>
	</head>
	
	<body>
		
	</body>
</html>