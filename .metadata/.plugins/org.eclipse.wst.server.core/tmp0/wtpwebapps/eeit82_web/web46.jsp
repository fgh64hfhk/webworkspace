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
	
	<c:set var="page">${ empty param.page ? 1 : param.page }</c:set>
	<c:set var="rpp">10</c:set>
	<c:set var="start">${ (page - 1) * rpp }</c:set>
	
	<sql:query var="rs">
		SELECT * FROM travelfood LIMIT ${ start }, ${ rpp }
	</sql:query>
	
	<c:set var="prev" value="${ page == 1 ? 1 : page - 1 }"></c:set>
	<c:set var="next">${ page + 1 }</c:set>
	
	<head>
		<meta charset="UTF-8">
		<title>web46 page</title>
	</head>
	
	<body>
		<h1>美食小吃列表</h1>
		<hr />
		<div>
			<a href="?page=${ prev }">Prev</a> | <a href="?page=${ next }">Next</a>
		</div>
		<hr />
		<div>
			<table border="1" style="width: 100%">
				<caption>
					Travel Food Table V3
				</caption>
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">FID</th>
						<th scope="col">FName</th>
						<th scope="col">Tel</th>
						<th scope="col">Address</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${ rs.rows }" var="item" varStatus="status">
						<tr>
							<td>${ status.index }</td>
							<td>${ item.fid }</td>
							<td>${ item.fname }</td>
							<td>${ item.tel }</td>
							<td>${ item.address }</td>
				    	</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>