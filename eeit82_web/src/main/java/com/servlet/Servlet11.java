package com.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet11 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Servlet11() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String min = request.getParameter("min");
		int range = (Integer) request.getAttribute("range");

		try {
			int minValue = Integer.parseInt(min);
			response.getWriter().print((int) (Math.random() * range + minValue));
		} catch (Exception e) {
			response.getWriter().print("Ooops!");
		}
	}

}
