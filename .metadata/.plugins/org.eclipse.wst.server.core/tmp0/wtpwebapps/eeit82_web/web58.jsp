<%@ page import="com.apis.MyUtils"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/northwind_tony"
	user="root"
	password="root"
/>
<c:choose>
	<c:when test="${ !empty param.orderId }">
		<sql:query var="rs">
			SELECT o.OrderID, o.CustomerID, o.RequiredDate, od.ProductID, p.ProductName, od.UnitPrice, od.Quantity FROM orderdetails od
			JOIN orders o ON (od.OrderID = o.OrderID)
			JOIN products p ON (od.ProductID = p.ProductID)
			WHERE o.OrderID = ?
			<sql:param>${ param.orderId }</sql:param>
		</sql:query>
	</c:when>
	<c:otherwise>
		<sql:query var="rs">
			SELECT o.OrderID, o.CustomerID, o.RequiredDate, od.ProductID, p.ProductName, od.UnitPrice, od.Quantity FROM orderdetails od
			JOIN orders o ON (od.OrderID = o.OrderID)
			JOIN products p ON (od.ProductID = p.ProductID)
			WHERE o.OrderID = 10248
		</sql:query>
	</c:otherwise>
</c:choose>

${ MyUtils.OrderToJSON(rs.rows) }
