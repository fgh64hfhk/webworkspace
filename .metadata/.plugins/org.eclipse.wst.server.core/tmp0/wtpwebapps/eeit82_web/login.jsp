<%@page import="com.apis.BCrypt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${ !empty param.account }">
	<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/mydatabase"
	user="root"
	password="root"
	/>
	<sql:query var="resultset">
		SELECT cid, cname, account, password FROM customer WHERE account = ?
		<sql:param>${ param.account }</sql:param>
	</sql:query>
	<c:choose>
		<c:when test="${ resultset.rowCount > 0 }">
			<c:set var="hash_password" value="${ resultset.rows[0].password }"></c:set>
			<c:out value="${ hash_password }"></c:out>
			<c:if test="${ !empty param.password }">
				<c:set var="plain_password" value="${ param.password }"></c:set>
				<c:choose>
					<c:when test="${ BCrypt.checkpw(plain_password, hash_password) }">
						<jsp:useBean id="m" class="com.beans.Member"></jsp:useBean>
						<c:set target="${ m }" property="id" value="${ resultset.rows[0].cid }"></c:set>
						<c:set target="${ m }" property="account" value="${ resultset.rows[0].account }"></c:set>
						<c:set target="${ m }" property="password" value="${ resultset.rows[0].password }"></c:set>
						<c:set target="${ m }" property="realname" value="${ resultset.rows[0].cname }"></c:set>
						<c:set var="member" value="${ m }" scope="session"></c:set>
						<c:redirect url="index.jsp"></c:redirect>
					</c:when>
					<c:otherwise>
						<c:set var="msg" value="Not Correct Password"></c:set>
					</c:otherwise>
				</c:choose>
			</c:if>
		</c:when>
		<c:otherwise>
			<c:set var="msg" value="Not Found Account"></c:set>
		</c:otherwise>
	</c:choose>
</c:if>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>login page</title>
	</head>
	
	<body>
		<h1>Login Page</h1>
		<hr>
		${ msg }
		<form action="">
			Account: <input type="text" name="account">
			<hr>
			Password: <input type="password" name="password">
			<hr>
			<input type="submit" value="Login">
		</form>
 	
	</body>
</html>