<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String[] names = {"Brad", "Kevin", "Peter", "Tony", "Vivian", "Mark"};
	pageContext.setAttribute("names", names);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web42 page</title>
	</head>
	<body>
		<div>
			<table border="1" style="width: 100%">
				<caption>
					Front-end web developer course 2021
				</caption>
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">count</th>
						<th scope="col">Name</th>
						<th scope="col">isFirst</th>
						<th scope="col">isLast</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${ names }" var="name" varStatus="status">
						<tr>
							<td>${ status.index }</td>
							<td>${ status.count }</td>
							<td>${ name }</td>
							<td>${ status.first }</td>
							<td>${ status.last }</td>
				    	</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>