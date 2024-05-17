package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet10 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Servlet10() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		RequestDispatcher dispatcher = request.getRequestDispatcher("Servlet11");

		request.setAttribute("range", 100);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h1>Servlet10 to Servlet11</h1>");
		out.print("<hr />");
		out.print("<div>Hello, World</div>");
		dispatcher.include(request, response);
		out.print("<hr />");

		response.flushBuffer();
	}

}
