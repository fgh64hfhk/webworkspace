package com.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet17 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Servlet17() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String source = "C:\\Users\\user\\eclipse-webworkspace\\eeit82_web\\src\\main\\webapp\\upload\\Adorable-Otter-Wallpape.jpg";
		BufferedImage img = ImageIO.read(new File(source));
		Graphics2D g2d = img.createGraphics();
		g2d.setColor(Color.BLUE);

		Font font1 = new Font(null, Font.BOLD, 125);
		AffineTransform af = new AffineTransform();
		af.rotate(Math.toRadians(30));
		Font font2 = font1.deriveFont(af);

		g2d.setFont(font2);
		g2d.drawString("watermark", 50, 50);

		response.setContentType("image/jpeg");
		ImageIO.write(img, "JPEG", response.getOutputStream());
		response.flushBuffer();

		ImageIO.write(img, "JPEG", new File("C:\\Users\\user\\eclipse-webworkspace\\eeit82_web\\src\\main\\webapp\\upload2\\watermark.jpg"));
	}

}
