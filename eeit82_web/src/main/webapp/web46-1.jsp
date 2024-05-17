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
	
	<c:choose>
		<c:when test="${ !empty param.rpp }">
			<c:set var="rpp" value="${ param.rpp }"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="rpp" value="10"></c:set>
		</c:otherwise>
	</c:choose>

	<sql:query var="resultset">
		SELECT fid FROM travelfood
	</sql:query>
	<c:set var="rowCount" value="${ resultset.rowCount }"></c:set>

	<head>
		<meta charset="UTF-8">
		<title>web46-1 page</title>
	</head>
	
	<body>
		查詢的總筆數: ${ resultset.rowCount } 筆
		每頁的筆數: ${ rpp } 筆
		<div>
			<form action="">
				每頁筆數: <input type="number" name="rpp" value="${ rpp }"/>
				<input type="submit" value="Change"/>
			</form>
		</div>
		<c:choose>
			<c:when test="${ (rowCount %  rpp) > 0 }">
				總頁數: ${ Math.floor(rowCount /  rpp) + 1 } 頁 <br />
				<c:set var="total" value="${ Math.floor(rowCount / rpp) + 1 }"></c:set>
				
				最後一頁的筆數: ${ rowCount % rpp }
				<c:set var="last_number" value="${ rowCount % rpp }"></c:set>
			</c:when>
			<c:otherwise>
				總頁數: ${ rowCount / rpp } 頁
				<c:set var="total" value="${ rowCount / rpp }"></c:set>
			</c:otherwise>
		</c:choose>
		<hr />
		<!-- 循环生成 a 标签 -->
		<c:forEach var="page" begin="1" end="${ total }">
			<c:if test="${ !empty param.rpp }">
				<a href="?page=${ page }&rpp=${ param.rpp }">第 ${ page } 頁</a> 
			</c:if>
			<c:if test="${ empty param.rpp }">
				<a href="?page=${ page }">第 ${ page } 頁</a>
			</c:if>
		</c:forEach>

		<hr />
		
		<c:choose>
			<c:when test="${ !empty param.page }">
				<c:set var="page" value="${ param.page }"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="page" value="1"></c:set>
			</c:otherwise>
		</c:choose>
		
		<c:set var="start">${ (page - 1) * rpp }</c:set>
		
		<sql:query var="rs">
			SELECT fid FID, fname FName, tel Tel, address Address, picurl Picture FROM travelfood LIMIT ${ start }, ${ rpp }
		</sql:query>
		
		<h1>美食小吃列表</h1>
		<hr />
		<div>
			<table border="1" style="width: 100%">
				<caption>
					Travel Food Table V4
				</caption>
				<thead>
					<tr>
						<th scope="col">編號</th>
						<th scope="col">餐廳名稱</th>
						<th scope="col">電話</th>
						<th scope="col">地址</th>
						<th scope="col">相片</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${ rs.rows }" var="item" varStatus="status">
						<tr>
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