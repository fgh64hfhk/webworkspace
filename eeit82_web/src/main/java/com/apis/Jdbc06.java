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
import java.sql.Statement;
import java.util.Properties;

import org.json.JSONArray;
import org.json.JSONObject;

public class Jdbc06 {

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

			Statement statement = connection_db.createStatement();
			
			String delete_table = "DELETE FROM helmet_sizes";
			statement.execute(delete_table);
			
			String alter_increment = "ALTER TABLE helmet_sizes AUTO_INCREMENT = 1";
			statement.executeUpdate(alter_increment);

			String sql ="INSERT INTO helmet_sizes (helmet_id, size)"
					+ " VALUES (?, ?)";

			PreparedStatement preparedStatement = connection_db.prepareStatement(sql);

			JSONObject root = new JSONObject(buffer.toString());
			JSONArray array = (JSONArray) root.get("安全帽");

			for (int i = 0; i < array.length(); i++) {
				JSONObject helmet = array.getJSONObject(i);
				
				System.out.println(helmet.get("型號").toString());
				// 解析 JSON 物件
				JSONArray sizes = helmet.getJSONArray("尺寸");
				
				for (Object object : sizes) {
					preparedStatement.setInt(1, i + 1);
					preparedStatement.setString(2, object.toString());
					preparedStatement.executeUpdate();
				}                
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
