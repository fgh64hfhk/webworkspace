<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<%
		pageContext.setAttribute("x", 111);
		pageContext.setAttribute("x", 222);
	%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web39 page</title>
	</head>
	<body>
		<c:set var="x" value="333"></c:set>
		<c:set var="x" value="444" scope="request"></c:set>
		x = ${ x } <br />
		x = ${ requestScope.x } <br />
		<hr />
		c:out: <c:out value="Hello, world."></c:out> <br />
		c:out: <c:out value="${ x }"></c:out> <br />
		c:out: <c:out value="${ param.i }" default="no value."></c:out> <br />
		<hr />
		<jsp:useBean id="member" class="com.beans.Member"></jsp:useBean>

		<c:set target="${ member }" property="account">bear200806</c:set>
		<c:set target="${ member }" property="password">123456</c:set>
		<c:set target="${ member }" property="realname">Tony_Lin</c:set>
		Member: <br />
		${ member.account } : ${ member.password } : ${ member.realname } <hr />
		Member toString: <br />
		${ member }
		<hr />
		<c:remove var="member"/>
		c:remove: ${ member }
	</body>
</html>