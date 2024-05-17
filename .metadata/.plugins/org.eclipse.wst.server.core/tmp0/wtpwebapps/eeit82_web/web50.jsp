<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="com.apis.MyUtils" %>

<%
	LinkedList<HashMap<String, String>> list = new LinkedList<>();
	HashMap<String, String> test = new HashMap<>();
	test.put("a", "a");
	test.put("b", "b");
	test.put("c", "c");
	test.put("d d", "d d");
	HashMap<String, String> test2 = new HashMap<>();
	test2.put("a", "a");
	test2.put("b", "b");
	test2.put("c", "c");
	test2.put("d d", "d d");
	list.add(test);
	list.add(test2);
	
	pageContext.setAttribute("test", test);
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>web50 page</title>
	</head>
	
	<body>
	<c:catch var="error">
		<c:set var="new_list">${ list }</c:set>
			${ test.a }
		<hr>
		<c:forEach items="${ new_list }" var="item">
			${ item.a }
			${ item["d d"] }
			<br />
		</c:forEach>
	</c:catch>
	
	<c:if test="${ !empty error }">
		error: ${ error }
	</c:if>
	
	</body>
</html>