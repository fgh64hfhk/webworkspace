package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.apis.MyUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet15 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Servlet15() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String operator = String.valueOf(request.getAttribute("operator"));
		System.out.println("Servlet15_operator: " + operator);

		String string_x = String.valueOf(request.getAttribute("x"));
		String string_y = String.valueOf(request.getAttribute("y"));

		String result = String.valueOf(request.getAttribute("result"));

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();

		String webPage = "NOT FOUND";

		webPage = MyUtils.loadView("view03");

		writer.printf(webPage, string_x, string_y, result);

		response.flushBuffer();

	}
}
