<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.apis.MyUtils" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web32 page</title>
	</head>
	<body>
		<h1>Calculator V1</h1>
		<hr />
		<form>
			<input type="number" name="x" value="${ param.x }">
			<select name="operator">
				<option value="1" ${ param.operator == "1" ? "selected" : "" }>+</option>
				<option value="2" ${ param.operator == "2" ? "selected" : "" }>-</option>
				<option value="3" ${ param.operator == "3" ? "selected" : "" }>*</option>
				<option value="4" ${ param.operator == "4" ? "selected" : "" }>/</option>
			</select>
			<input type="number" name="y" value="${ param.y }">
			<input type="submit" value="=">
			<span>${ MyUtils.calc(param.x, param.y, param.operator) }</span>
		</form>
		
	</body>
</html>