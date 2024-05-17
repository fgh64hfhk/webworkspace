<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String[] names1 = {"Tommy", "Peter", "Cathay", "Tony", "Jack"};
    	pageContext.setAttribute("names", names1);
    	String[] names2 = {"Tommy2", "Peter2", "Cathay2", "Tony2", "Jack2"};
    	request.setAttribute("names", names2);
    	String[] names3 = {"Tommy3", "Peter3", "Cathay3", "Tony3", "Jack3"};
    	session.setAttribute("names", names3);
    	String[] names4 = {"Tommy4", "Peter4", "Cathay4", "Tony4", "Jack4"};
    	application.setAttribute("names", names4);
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web35 page</title>
	</head>
	<body>
		<div>I'm a web35</div>
		names[2] = ${ names[2] } <br />
		request.names[2] = ${ requestScope.names[2] } <br />
		session.names[2] = ${ sessionScope.names[2] } <br />
		application.names[2] = ${ applicationScope.names[2] } <br />
	</body>
</html>