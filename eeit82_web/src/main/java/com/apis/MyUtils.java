package com.apis;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.SortedMap;

import org.json.JSONArray;
import org.json.JSONObject;

public class MyUtils {
	public static String loadView(String viewFile) {
		String source = String.format(
				"C:\\Users\\user\\eclipse-webworkspace\\eeit82_web\\src\\main\\webapp\\views\\%s.html", viewFile);
		File file = new File(source);
		StringBuffer stringBuffer = new StringBuffer();
		try (BufferedReader reader = new BufferedReader(new FileReader(file));) {
			String line;
			while ((line = reader.readLine()) != null) {
				stringBuffer.append(line);
			}
		} catch (IOException ioException) {
			ioException.printStackTrace();
		}
		return stringBuffer.toString();
	}

	public static String calc(String x, String y, String operator) {

		try {
			int int_x = Integer.parseInt(x);
			int int_y = Integer.parseInt(y);

			StringBuffer buffer = new StringBuffer();
			switch (operator) {
			case "1": {
				buffer.append(int_x + int_y);
				break;
			}
			case "2": {
				buffer.append(int_x - int_y);
				break;
			}
			case "3": {
				buffer.append(int_x * int_y);
				break;
			}
			case "4": {
				buffer.append(int_x / int_y);
				buffer.append("......");
				buffer.append(int_x % int_y);
				break;
			}
			}
			return buffer.toString();
		} catch (NumberFormatException exception) {
			System.out.println(exception);
			return "";
		}
	}
	
	public static int createScore() {
		return (int) (Math.random() * 101);
	}
	
	public static LinkedList<HashMap<String, String>> parseTravel(String data) {
		LinkedList<HashMap<String, String>> items = new LinkedList<HashMap<String,String>>();
		JSONArray root = new JSONArray(data);
		for (int i = 0; i < root.length(); i++) {
			JSONObject object = root.getJSONObject(i);
			HashMap<String, String> item = new HashMap<String, String>();
			item.put("tname", object.getString("Name"));
			item.put("city", object.getString("City"));
			item.put("town", object.getString("Town"));
			items.add(item);
		}
		
		return items;
	}
	
	public static JSONObject OrderToJSON(SortedMap<String, Object>[] raw_data) {
		
		System.out.println(raw_data);
		
		for (SortedMap<String, Object> sortedMap : raw_data) {
			System.out.println(sortedMap);
		}
		
		JSONObject order = new JSONObject();
		order.put("orderId", raw_data[0].getOrDefault("OrderId", "Error"));
		order.put("customerId", raw_data[0].getOrDefault("CustomerID", "Error"));
		order.put("orderDate", raw_data[0].getOrDefault("RequiredDate", ""));
		JSONArray details = new JSONArray();
		for (SortedMap<String, Object> sortedMap : raw_data) {
			JSONObject detail = new JSONObject();
			detail.put("productId", sortedMap.getOrDefault("ProductId", "Error"));
			detail.put("productName", sortedMap.getOrDefault("ProductName", ""));
			detail.put("unitPrice", sortedMap.getOrDefault("UnitPrice", ""));
			detail.put("quantity", sortedMap.getOrDefault("Quantity", ""));
			
			details.put(detail);
		}
		order.put("orderDetails", details);
		
		return order;
	}
	
	public static JSONObject productToJSON(SortedMap<String, Object>[] raw_data) {
		JSONObject product = new JSONObject();
		product.put("productId", raw_data[0].getOrDefault("helmet_id", "error"));
		product.put("model", raw_data[0].getOrDefault("model", "error"));
		product.put("category", raw_data[0].getOrDefault("category", "error"));
		product.put("brand", raw_data[0].getOrDefault("brand", "error"));
		product.put("description", raw_data[0].getOrDefault("description", "error"));
		product.put("price", raw_data[0].getOrDefault("price", "error"));
		
		HashSet<String> sizes = new HashSet<String>();
		
		HashMap<String, String> color_picture = new HashMap<String, String>();
		
		for (int i = 0; i < raw_data.length; i++) {
			sizes.add(raw_data[i].getOrDefault("size", "error").toString());
			color_picture.put(raw_data[i].getOrDefault("color_name", "error").toString(), raw_data[i].getOrDefault("photo_url", "error").toString());
		}

//		color_picture.forEach((t, u) -> System.out.println(t + ":" + u));
		
		JSONArray sizes_JSON = new JSONArray(sizes);
		JSONObject cp_JSON = new JSONObject(color_picture);
		
		product.put("size", sizes_JSON);
		product.put("color_picture", cp_JSON);
		
		return product;
	}
}
