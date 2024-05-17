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

public class Jdbc05 {

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
//			System.out.println(buffer.toString());

			reader.close();

			Class.forName("com.mysql.cj.jdbc.Driver");
			Properties properties = new Properties();
			properties.put("user", "root");
			properties.put("password", "root");
			Connection connection_db = DriverManager.getConnection("jdbc:mysql://localhost/e-commerce-database",
					properties);

			Statement statement = connection_db.createStatement();
			String delete_table = "DELETE FROM helmets";
			statement.execute(delete_table);
			String alter_increment = "ALTER TABLE helmets AUTO_INCREMENT = 1";
			statement.executeUpdate(alter_increment);

			String sql = "INSERT INTO helmets (model, category, brand, description, price)"
					+ " VALUES (?, ?, ?, ?, ?)";

			PreparedStatement preparedStatement = connection_db.prepareStatement(sql);

			JSONObject root = new JSONObject(buffer.toString());
			JSONArray array = (JSONArray) root.get("安全帽");

			for (int i = 0; i < array.length(); i++) {
				JSONObject helmet = array.getJSONObject(i);
				
				// 解析 JSON 物件
                String model = helmet.get("型號").toString();
                String category = helmet.get("種類").toString();
                String brand = helmet.get("品牌").toString();
                String description = helmet.get("介紹").toString();
                String price = helmet.get("價格").toString();
                
                preparedStatement.setString(1, model);
				preparedStatement.setString(2, category);
				preparedStatement.setString(3, brand);
				preparedStatement.setString(4, description);
                
                try {
                	preparedStatement.setLong(5, Long.parseLong(price));
				} catch (Exception e) {
					System.out.println(e);
					preparedStatement.setLong(5, 0);
				}
                preparedStatement.executeUpdate();
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
