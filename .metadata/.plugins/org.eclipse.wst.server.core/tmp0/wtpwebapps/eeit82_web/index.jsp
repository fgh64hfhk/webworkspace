<%@page import="com.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	if (session.getAttribute("member") == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	
	Member member = (Member) session.getAttribute("member");
%>

<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/mydatabase"
	user="root"
	password="root"
	/>

<c:if test="${ !empty param.delete_id }">
	<sql:update>
		DELETE FROM travel WHERE tid = ?
		<sql:param>${ param.delete_id }</sql:param>
	</sql:update>
</c:if>

<sql:query var="rs">
	SELECT * FROM travel
</sql:query>

<!DOCTYPE html>
<html>
	
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
		<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
		<script>
			function isDel(delname){
				var isDel = confirm("是否刪除 [" + delname + "] ?");
				return isDel;
			}
		</script>
		<title>Member Home Page</title>
	</head>
	<body>
		<h1>Welcome, ${ member.realname }</h1>
		<hr>
		<h2>Member Detail</h2>
		${ member }
		<hr>
		<h2>Travel Table</h2>
		<table border="1" style="width: 100%">
			<caption>
				Travel Table V1
			</caption>
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">編號</th>
					<th scope="col">名稱</th>
					<th scope="col">城市</th>
					<th scope="col">鄉鎮</th>
					<th scope="col">編輯</th>
			    </tr>
			</thead>
			<tbody>
				<c:forEach items="${ rs.rows }" var="item" varStatus="status">
					<tr>
						<td>${ status.index }</td>
						<td>${ item.tid }</td>
						<td>${ item.tname }</td>
						<td>${ item.city }</td>
						<td>${ item.town }</td>
						<td>
							<a href="?delete_id=${ item.tid }" onclick="return isDel('${ item.tname }');">刪除</a>
						</td>
			    	</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<div>
			<h4><a href="logout.jsp">Logout</a></h4>
		</div>
	</body>
</html>