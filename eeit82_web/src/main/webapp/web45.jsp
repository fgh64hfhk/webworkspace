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
	<c:set var="sql">SELECT * FROM travelfood</c:set>
		<c:if test="${ !empty param.keyword }">
			<c:set var="sql">${ sql } WHERE fname LIKE '%${ param.keyword }%'</c:set>
		</c:if>
	<sql:query var="resultset">${ sql }</sql:query>

	<head>
		<meta charset="UTF-8">
		<title>web45 page</title>
	</head>
	<body>
		<h1>美食小吃列表</h1>
		查詢的筆數: ${ resultset.rowCount } <hr />
		<c:forEach items="${ resultset.columnNames }" var="columnName" varStatus="status">
			${ status.index + 1 }.查詢的欄位名稱: ${ columnName } <br />
		</c:forEach>
		<hr />
		<form action="">
			關鍵字查詢: 
			<input name="keyword" value="${ param.keyword }" />
			<br /> <br />
			<input type="submit" value="Search" />
		</form>
		<div>
			<table border="1" style="width: 100%">
				<caption>
					Travel Food Table V1
				</caption>
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">FID</th>
						<th scope="col">FName</th>
						<th scope="col">Tel</th>
						<th scope="col">Address</th>
						<th scope="col">Picture</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${ resultset.rows }" var="item" varStatus="status">
						<tr>
							<td>${ status.index }</td>
							<td>${ item.fid }</td>
							<td>${ item.fname }</td>
							<td>${ item.tel }</td>
							<td>${ item.address }</td>
							<td><img src="${ item.picurl }" width="160px" height="90px" /></td>
				    	</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>