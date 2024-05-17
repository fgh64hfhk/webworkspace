<%@page import="com.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	Member member1 = new Member();
	member1.setAccount("member1");
	member1.setPassword("member1");
	member1.setRealname("Member1");
	%>
	<jsp:useBean id="member2" class="com.beans.Member"></jsp:useBean>
	<jsp:setProperty property="account" value="member2" name="member2"/>
	<jsp:setProperty property="password" value="member2" name="member2"/>
	<jsp:setProperty property="realname" value="Member2" name="member2"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web29 page</title>
	</head>
	<body>
		member1: <%= member1.toString() %>
		<hr />
		member2:
		<jsp:getProperty property="id" name="member2"/>
		<jsp:getProperty property="account" name="member2"/>
		<jsp:getProperty property="realname" name="member2"/>
		<hr />
		member2-1: <%= member2.toString() %>
	</body>
</html>