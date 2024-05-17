package com.servlet;

import java.io.IOException;

import com.apis.MyModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet14 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Servlet14() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 1. 接收參數
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String operator = request.getParameter("operator");

		// 2. 運算
		MyModel myModel = new MyModel(x, y);

		if (operator == null) {
			operator = "";
		}

		switch (operator) {
		case "1": {
			myModel.add();
			break;
		}
		case "2": {
			myModel.subtract();
			break;
		}
		case "3": {
			myModel.multiply();
			break;
		}
		case "4": {
			myModel.divide();
			break;
		}
		default:
			System.out.println("Unexpected value: " + operator);
		}

		request.setAttribute("operator", operator);
		request.setAttribute("x", myModel.getX());
		request.setAttribute("y", myModel.getY());

		if (x == null || y == null) {
			request.setAttribute("result", "");
		} else {
			request.setAttribute("result", myModel.getResult());
		}

		if (operator.equals("4")) {
			request.setAttribute("remainder", myModel.getRemainder());
		}

		// 3. 呈現 View
		RequestDispatcher dispatcher = request.getRequestDispatcher("Servlet15");
		dispatcher.forward(request, response);
	}

}
