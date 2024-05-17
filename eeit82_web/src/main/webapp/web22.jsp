<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
		String start = request.getParameter("start");
		String rows = request.getParameter("rows");
		String columns = request.getParameter("columns");

		final int START = start == null ? 2 : Integer.parseInt(start);
		final int ROWS = rows == null ? 2 : Integer.parseInt(rows);
		final int COLUMNS = columns == null ? 4 : Integer.parseInt(columns);
	%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>web22 page</title>
	</head>
	<body>
	
		<form>
			Row x Column:
			<input type="number" name="rows" value="<%= ROWS%>"/> x <input type="number" name="columns" value="<%= COLUMNS%>"/>
			<br /><br />
			Start: <input type="number" name="start" value="<%= START%>"/> <br /><br />
			Change: <input type="submit" value="Change" /> <br />
		</form>
		
		<hr />
		
		<table style="background-color:black; border: 2px, solid; width: 100%">
	
			<%
			for (int k = 0; k < ROWS; k++) {
				
				out.print("<tr style=\"background-color:powderblue;\">");
				for (int j = START; j < START + COLUMNS; j++) {
					int newJ = j + k * COLUMNS;
					out.print("<td>");
					for (int i = 1; i <= 9; i++) {
						int result = newJ * i;
						out.print(String.format("%d x %d = %d<br />", newJ, i, result));
					}
					out.print("</td>");
				}
				out.print("</tr>");
			}
			%>
	
		</table>
	</body>
</html>