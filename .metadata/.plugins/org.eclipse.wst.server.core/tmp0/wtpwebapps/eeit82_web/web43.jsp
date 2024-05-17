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
	
	<head>
		<meta charset="UTF-8">
		<title>web43 page</title>
	</head>
	<body>
		<h1>客戶資料列表</h1>
		<sql:query var="resultset" sql="SELECT cid, cname, tel, birthday, account FROM customer"></sql:query>
		查詢的筆數: ${ resultset.rowCount } <hr />
		<c:forEach items="${ resultset.columnNames }" var="columnName" varStatus="status">
			${ status.index + 1 }.查詢的欄位名稱: ${ columnName } <br />
		</c:forEach>
		<div>
			<table border="1" style="width: 100%">
				<caption>Customer Table V1</caption>
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Tel</th>
						<th scope="col">Birthday</th>
						<th scope="col">Account</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ resultset.rows }" var="row" varStatus="status">
						<tr>
							<td>${ status.index + 1 }</td>
							<td>${ row.cid }</td>
							<td>${ row.cname }</td>
							<td>${ row.tel }</td>
							<td>${ row.birthday }</td>
							<td>${ row.account }</td>
						</tr>
						<c:if test="${ status.last }">
							<c:set var="last_number" value="${ row.cid + 1 }"></c:set>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<form action="">
				<div>
					<h3>請選擇增刪修選項</h3>
					<hr>
					
					<input type="radio" name="insert" value="1" ${ !empty param.insert ? "checked" : "" } />
					<label for="insert">Insert</label>
					Name: <input type="text" name="cname" value="${ param.cname }" />
					Tel: <input type="tel" name="tel" value="${ param.tel }" />
					Birthday: <input type="date" name="birthday" value="${ param.birthday }" />
					Account: <input type="text" name="account" value="${ param.account }" />
					<hr />
					
					<input type="radio" name="delete" value="2" ${ !empty param.delete ? "checked" : "" }/>
					<label for="delete">Delete</label>
					ID: <input type="text" name="cid_d" value="${ param.cid_d }" />
					<hr />
					
					<input type="radio" name="update" value="3" ${ !empty param.update ? "checked" : "" }/>
					<label for="update">Update</label>
					ID: <input type="text" name="cid_u" value="${ param.cid_u }" />
					Name: <input type="text" name="new_data" value="${ param.new_data }" />
					<hr />
					
					<input type="submit" value="Edit">
				</div>
			</form>
		</div>

		<c:if test="${ !empty param.insert }">
			<sql:update>
				ALTER TABLE customer AUTO_INCREMENT = ${ last_number }
			</sql:update>
			<sql:update>
				INSERT INTO customer (cname, tel, birthday, account) VALUES ('${ param.cname }', '${ param.tel }', '${ param.birthday }', '${ param.account }')
			</sql:update>
		</c:if>
		
		<c:if test="${ !empty param.delete }">
			<c:set var="id" value="${Integer.parseInt(param.cid_d)}"></c:set>
			<sql:update>
				DELETE FROM customer WHERE cid = ${ id }
			</sql:update>
		</c:if>
		
		<c:if test="${ !empty param.update }">
			<c:set var="id" value="${Integer.parseInt(param.cid_u)}"></c:set>
			<sql:update>
				UPDATE customer SET cname = '${ param.new_data }' WHERE cid = ${ id }
			</sql:update>
		</c:if>
	</body>
</html>