package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet06
 */
public class Servlet06 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet06() {
		super();
		System.out.println("Servlet06()");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String span = "", x = "", y = "";
		int result = 0;
		String operator = "";

		x = request.getParameter("x");
		y = request.getParameter("y");

		if (x != null && y != null) {
			operator = request.getParameter("operator");
			switch (operator) {
			case "1":
				result = Integer.parseInt(x) + Integer.parseInt(y);
				span = String.format("<span>%s</span>", result + "");
				break;
			case "2":
				result = Integer.parseInt(x) - Integer.parseInt(y);
				span = String.format("<span>%s</span>", result + "");
				break;
			case "3":
				result = Integer.parseInt(x) * Integer.parseInt(y);
				span = String.format("<span>%s</span>", result + "");
				break;
			case "4":
				result = Integer.parseInt(x) / Integer.parseInt(y);
				int mod = Integer.parseInt(x) % Integer.parseInt(y);
				span = String.format("<span>%s</span>", result + " ... " + mod);
				break;
			}
		}

		if (x == null) {
			x = "0";
		}

		if (y == null) {
			y = "0";
		}


		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.append("<meta charset='UTF-8'>")

				.append("<form>").append(String.format("<input name='x' value='%s' />", x))

				.append("<select name='operator'>")
				.append(String.format("<option value='1' %s>+</option>", operator.equals("1") ? "selected" : ""))
				.append(String.format("<option value='2' %s>-</option>", operator.equals("2") ? "selected" : ""))
				.append(String.format("<option value='3' %s>x</option>", operator.equals("3") ? "selected" : ""))
				.append(String.format("<option value='4' %s>/</option>", operator.equals("4") ? "selected" : ""))
				.append("</select> ")

				.append(String.format("<input name='y' value='%s' />", y)).append("<input type='submit' value='='>")
				.append(span).append("</form>");
		response.flushBuffer();
	}
}
