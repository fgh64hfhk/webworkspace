<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="member" class="com.beans.Member"></jsp:useBean>
	<jsp:setProperty property="account" value="${ param.account }" name="member"/>
	<jsp:setProperty property="realname" value="${ param.realname }" name="member"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web31 page</title>
	</head>
	<body>
		Member1 : <br />
		member id:
		<jsp:getProperty property="id" name="member"/>
		<br />
		member account:
		<jsp:getProperty property="account" name="member"/>
		<br />
		member real_name:
		<jsp:getProperty property="realname" name="member"/>
		<hr />
		Member1 : <br />
		member id:
		${ member.id }
		<br />
		member account:
		${ member.account }
		<br />
		member real_name:
		${ member.realname }
		<hr />
		${ member }
		${ Math.random() }
	</body>
</html>