package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet05
 */
public class Servlet05 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet05() {
		super();
		System.out.println("Servlet05()");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		PrintWriter out = response.getWriter();
		if (x != null && y != null) {
			int result = Integer.parseInt(x) + Integer.parseInt(y);
			System.out.printf("%s + %s = %d %n", x, y, result);

			response.setContentType("text/html; charset=UTF-8");

			out.printf("%s + %s = %d %n", x, y, result);

		} else {
			out.printf("%s + %s = %d %n", "null", "null", 0);
		}
		response.flushBuffer();
	}
}
