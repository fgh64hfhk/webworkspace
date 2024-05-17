package com.servlet;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet16 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Servlet16() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int width;
		int height;
		double rate;

		// 獲取請求變數
		String string = request.getParameter("width");
		String string2 = request.getParameter("height");
		String string3 = request.getParameter("rate");

		if (string == null) {
			width = 400;
		} else {
			width = Integer.parseInt(string);
		}
		if (string2 == null) {
			height = 20;
		} else {
			height = Integer.parseInt(string2);
		}
		if (string3 == null) {
			rate = 50;
		} else {
			rate = Double.parseDouble(string3);
		}

		response.setContentType("image/jpeg");

		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics2d = image.createGraphics();
		graphics2d.setColor(Color.yellow);
		graphics2d.fillRect(0, 0, width, height);
		graphics2d.setColor(Color.red);
		int rate_fill = (int) (image.getWidth() * (rate / 100));
		graphics2d.fillRect(0, 0, rate_fill, height);

		ImageIO.write(image, "JPEG", response.getOutputStream());
		response.flushBuffer();
	}

}
