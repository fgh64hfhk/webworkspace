package com.apis;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Jdbc08 {

	public static void main(String[] args) {
		try {

			String source = "C:\\Users\\user\\eclipse-webworkspace\\eeit82_web\\src\\main\\webapp\\upload2\\bear200806_安全帽.json";
			File file = new File(source);
			BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file)));

			String line;
			StringBuffer buffer = new StringBuffer();
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}

			reader.close();

			Class.forName("com.mysql.cj.jdbc.Driver");
			Properties properties = new Properties();
			properties.put("user", "root");
			properties.put("password", "root");
			Connection connection_db = DriverManager.getConnection("jdbc:mysql://localhost/e-commerce-database",
					properties);

			String sql = "UPDATE helmet_colors SET photo_url = ? WHERE helmet_id = ? && color_name = ?";

			PreparedStatement preparedStatement = connection_db.prepareStatement(sql);

			JSONObject root = new JSONObject(buffer.toString());
			JSONArray array = (JSONArray) root.get("安全帽");

			for (int i = 0; i < array.length(); i++) {
				JSONObject helmet = array.getJSONObject(i);
				
				System.out.println("編號: " + (i + 1) + " : " + helmet.get("型號").toString());
				
				preparedStatement.setInt(2, i + 1);
				// 解析 JSON 物件
				JSONObject photo_urls = helmet.getJSONObject("照片");
				
				Set<String> keys = photo_urls.keySet();
				
//				keys.forEach(t -> System.out.println(photo_urls.getString(t)));
				keys.forEach(t -> {
					try {
						preparedStatement.setString(1, photo_urls.getString(t));
						preparedStatement.setString(3, t);
						preparedStatement.executeUpdate();
					} catch (JSONException | SQLException e) {
						System.out.println(e);
					}
				});
			}

			System.out.println("Data input Finished.");

		} catch (IOException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (SQLException e) {
			System.out.println(e);
		}

	}

}
