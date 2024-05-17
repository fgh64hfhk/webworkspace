package com.servlet;

import java.io.IOException;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 建構式
    public Servlet04() {
        super();
        System.out.println("Servlet04() constructor...");
    }

    // 初始化
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init(ServletConfig)");
		super.init(config);
	}

	@Override
	public void init() throws ServletException {
		System.out.println("init()");
		super.init();
	}

	//
	@Override
	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {
		System.out.println("service(1)");
		super.service(req, res);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("service(2)");
		System.out.println(req.getMethod());
		super.service(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost()");
	}

}
