package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.apis.MyMember;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MyMember member;

	public Register() {
		super();
		try {
			member = new MyMember();
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset-UTF-8");

		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");

		try {
			int return_code = member.register(account, password, realname);
			if (return_code == 1) {
				response.sendRedirect("web24.jsp");
			} else {
				// 重複帳號
				response.sendRedirect("web23.jsp?errorType=-1");
			}

		} catch (SQLException e) {
			System.out.println(e);
			// 伺服器錯誤
			response.sendRedirect("web23.jsp?errorType=0");
//			response.sendError(500, "Server Busy...");
		}

	}

}
