<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="web21.jsp"%>
<%
	String name = request.getParameter("name");
	// name.charAt(0);
	if (name == null) {
		name = "world";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web20 page</title>
	</head>
	<body>
		<h1>JavaServer Pages</h1>
		<hr />
		Hello,
		<%
		out.print(name);
		%>
		<br />
		Hello,
		<%=name%>
		Lottery:
		<%=(int) (Math.random() * 49 + 1)%>
		<hr />
		Lottery Numbers:
		<%
		HashSet<Integer> lotteryNumbers = new HashSet<>();
		while (lotteryNumbers.size() < 6) {
			lotteryNumbers.add((int) (Math.random() * 49 + 1));
		}
		out.print(lotteryNumbers);
		%>
	</body>
</html>