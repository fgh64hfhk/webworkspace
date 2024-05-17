<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
    	String errorType = request.getParameter("errorType");
    	String msg = "";
    	if (errorType != null) {
    		switch (errorType) {
    		case "0": 
    			msg = "Server error";
    			break;
    		
	    	case "-1":
	    		msg = "Account is duplicate";
				break;
			
    		}
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
</head>
<body>
	<div><%= msg %></div>
	<form action="Register" method="post">
		Account: <input name="account"> <br />
		Password: <input type="password" name="password"> <br />
		Real name: <input name="realname"> <br />
		<input type="submit" value="Register"> <br />
	</form>
</body>
</html>