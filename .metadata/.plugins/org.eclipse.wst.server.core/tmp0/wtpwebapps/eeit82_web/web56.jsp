<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String method = request.getMethod();
	if (method.equals("POST")){
		try{
			int max = Integer.parseInt(request.getParameter("max"));
			out.print((int)(Math.random() * max + 1));
		}catch(Exception e){
			out.println("Error");
		}
	}else{
		out.print("What are you doing?");
	}
	%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web56 page</title>
	</head>
	<body>
	
	</body>
</html>