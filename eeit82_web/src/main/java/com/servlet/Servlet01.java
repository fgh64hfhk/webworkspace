package com.servlet;

import java.io.IOException;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Servlet01() {
		super();
		System.out.println("Servlet01 constructor...");
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		if (config instanceof GenericServlet) {
			System.out.println("GenericServlet");
		} else {
			System.out.println("This ServletConfig is HttpServlet.");
			System.out.println("------------------------------");

			System.out.println("ContextPath: " + config.getServletContext().getContextPath());
			System.out.println("ServletName: " + config.getServletName());
			System.out.println("------------------------------");

			System.out.print("ServletRegistration: ");

			config.getServletContext().getServletRegistration(config.getServletName()).getMappings()
					.forEach(t -> System.out.println(t));
		}
	}

	@Override
	public void init() throws ServletException {
		System.out.println("init()");
		super.init();
	}

	@Override
	public void destroy() {
		System.out.println("Servlet01 destroy...");
	}

	@Override
	public ServletConfig getServletConfig() {
		System.out.println(getServletConfig().toString());
		return getServletConfig();
	}

	@Override
	public String getServletInfo() {
		System.out.println(getServletInfo().toString());
		return getServletInfo();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		doGet(request, response);
	}

}
