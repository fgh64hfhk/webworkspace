package com.servlet;

//import java.io.FileOutputStream;
import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class Servlet08
 */
public class Servlet08 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet08() {
		super();

	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String rootPath = config.getServletContext().getRealPath("/");
		System.out.println("rootPath: " + rootPath);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 獲取上傳文件的 Part 對象
		Part filePart = request.getPart("upload");
		// 獲取上傳文件的文件名
		String fileName = getFileName(filePart);
		System.out.println("fileName: " + fileName);
		
		try {
			System.out.println("Name: " + filePart.getName());
			System.out.println("Size: " + filePart.getSize());
			System.out.println("SubmittedFileName: " + filePart.getSubmittedFileName());
			System.out.println("ContentType: " + filePart.getContentType());
			if (filePart.getSize() > 0) {
				filePart.write(fileName);
				System.out.println("OK");
			}
		} catch (Exception e) {
			System.out.println("Exception: " + e);
			String ip = request.getRemoteHost();
			System.out.println("RemoteHost: " + ip);
			if (filePart != null) {
				System.out.println(filePart.getName());
			}
		}

//		OutputStream out = new FileOutputStream("C:\\Users\\user\\eclipse-webworkspace\\" + fileName);
//		InputStream fileContent = filePart.getInputStream();
//		int read;
//		final byte[] bytes = new byte[1024];
//		while ((read = fileContent.read(bytes)) != -1) {
//			out.write(bytes, 0, read);
//		}
//		out.close();

	}

	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");
		String[] headers = partHeader.split(";");
		for (String content : headers) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
