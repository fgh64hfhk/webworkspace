<%@ page import="com.apis.MyUtils"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/e-commerce-database"
	user="root"
	password="root"
/>
<c:choose>
	<c:when test="${ !empty param.helmetId }">
		<sql:query var="rs">
			SELECT h.*, hz.size, hc.color_name, hc.photo_url FROM helmets h
			JOIN helmet_sizes hz
			ON h.helmet_id = hz.helmet_id
			JOIN helmet_colors hc
			ON h.helmet_id = hc.helmet_id
			WHERE h.helmet_id = ?
			<sql:param>${ param.helmetId }</sql:param>
		</sql:query>
	</c:when>
	<c:otherwise>
		<sql:query var="rs">
			SELECT h.*, hz.size, hc.color_name, hc.photo_url FROM helmets h
			JOIN helmet_sizes hz
			ON h.helmet_id = hz.helmet_id
			JOIN helmet_colors hc
			ON h.helmet_id = hc.helmet_id
			WHERE h.helmet_id = 1
		</sql:query>
	</c:otherwise>
</c:choose>

${ MyUtils.productToJSON(rs.rows) }
