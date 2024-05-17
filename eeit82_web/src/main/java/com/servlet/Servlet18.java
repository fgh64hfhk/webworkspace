package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.regex.Matcher;

import com.apis.MyUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet18 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection connection;

	public Servlet18() {
		super();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Properties properties = new Properties();
			properties.put("user", "root");
			properties.put("password", "root");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/mydatabase", properties);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html; charset=UTF-8");

		String htmlContent = "NOT FOUND";

		htmlContent = MyUtils.loadView("view04");

		// 處理外部字串的連接點
        // "\\s*"：這部分使用了反斜線來轉義 \\，代表匹配任意數量的空白字符（包括空格、制表符、換行符等）
		String regex = "</tr>\\s*</table>";
		StringBuffer buffer = new StringBuffer();

		PrintWriter out = response.getWriter();

		String sql;
		PreparedStatement pstmt;

		String key = request.getParameter("keyword");
		try {

			if (key != null) {
				sql = "SELECT fname, tel, address FROM travelfood WHERE fname LIKE ?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, "%" + key + "%");
			} else {
				key = "";
				sql = "SELECT fname, tel, address FROM travelfood";
				pstmt = connection.prepareStatement(sql);
			}

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				buffer.append("<tr>");
				buffer.append(String.format("<td>%s</td>", rs.getString("fname")));
				buffer.append(String.format("<td>%s</td>", rs.getString("tel")));
				buffer.append(String.format("<td>%s</td>", rs.getString("address")));
				buffer.append("</tr>");
			}
		} catch (SQLException exception) {
			exception.printStackTrace();
		}

		// 將新的表格內容插入到既有的表格區塊之間
        String modifiedHtmlContent = htmlContent.replaceFirst(regex, Matcher.quoteReplacement(buffer.toString()) + "</table>");
        String modifiedHtmlContent2 = String.format(modifiedHtmlContent, key);

        out.print(modifiedHtmlContent2);
		response.flushBuffer();
	}

}
