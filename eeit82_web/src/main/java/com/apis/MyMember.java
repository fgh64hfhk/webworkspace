package com.apis;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class MyMember {
	private static final String USER = "root";
	private static final String PASSWORD = "root";
	private static final String URL = "jdbc:mysql://localhost/mydatabase";
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String CHECK_SQL = "SELECT COUNT(*) count FROM customer WHERE account = ?";
	private static final String INSERT_SQL = "INSERT INTO customer (cname, account, password) VALUES (?, ?, ?)";

	private Connection connection;
	private ResultSet resultSet;

	public MyMember() throws SQLException, ClassNotFoundException {
		super();
		Properties properties = new Properties();
		properties.put("user", USER);
		properties.put("password", PASSWORD);

		Class.forName(DRIVER);
		connection = DriverManager.getConnection(URL, properties);
	}

	public int register(String account, String password, String realname) throws SQLException {

		if (isDuplicate(account)) {
			PreparedStatement statement = connection.prepareStatement(INSERT_SQL);
			statement.setString(1, realname);
			statement.setString(2, account);
			statement.setString(3, BCrypt.hashpw(password, BCrypt.gensalt()));
			return statement.executeUpdate();
		} else {
			return -1;
		}

	}

	private boolean isDuplicate(String account) throws SQLException {

		PreparedStatement statement = connection.prepareStatement(CHECK_SQL);
		statement.setString(1, account);
		resultSet = statement.executeQuery();
		resultSet.next();
		return resultSet.getInt("count") > 0 ? false : true;
	}

}
