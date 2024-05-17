package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet12 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Servlet12() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		RequestDispatcher dispatcher = request.getRequestDispatcher("Servlet13");

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print("<h1>Servlet12 to Servlet13</h1>");
		out.print("<hr />");
		out.print("<div>Hello, World</div>");

		dispatcher.forward(request, response);

		out.print("<hr />");
		response.flushBuffer();
	}
}
