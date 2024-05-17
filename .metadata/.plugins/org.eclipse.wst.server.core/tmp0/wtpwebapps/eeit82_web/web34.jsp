<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	// out.print(request.getMethod());
    	
    	// String[] hobbys = request.getParameterValues("hobby");
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web34 page</title>
	</head>
	<body>
		Method: ${ pageContext.request.method }
		<hr />
		Hobbys: <br />
		1. ${ paramValues.hobby[0] } <br />
		2. ${ paramValues.hobby[1] } <br />
		3. ${ paramValues.hobby[2] } <br />
		4. ${ paramValues.hobby[3] } <br />
		5. ${ paramValues.hobby[4] } <br />
		6. ${ paramValues.hobby[5] } <hr />
		
		remoteAddr: ${ pageContext.request.remoteAddr } <br />
		locale: ${ pageContext.request.locale } <br />
		displayLanguage: ${ pageContext.request.locale.displayLanguage } <br />
	</body>
</html>