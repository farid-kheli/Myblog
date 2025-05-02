package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import beans.User;

public class UserDAO {
	 private static final String URL = "jdbc:mysql://localhost:3306/WebApp";
	    private static final String USERNAME = "root";
	    private static final String PASSWORD = "";

	    private static Connection getConnection() throws Exception {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	    }

	    public static int create(User user) throws Exception {
	        try (Connection con = getConnection()) {
	            String sql = "INSERT INTO users(name, email, password) VALUES (?, ?, ?)";
	            PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	            stmt.setString(1, user.getName());
	            stmt.setString(2, user.getEmail());
	            stmt.setString(3, user.getPassword());

	            int affected = stmt.executeUpdate();

	            if (affected > 0) {
	                ResultSet rs = stmt.getGeneratedKeys();
	                if (rs.next()) {
	                    int id = rs.getInt(1);
	                    user.setId(id);
	                    return id;
	                }
	            }
	        }
	        return -1;
	    }

	    public static User getUserById(int id) throws Exception {
	        try (Connection con = getConnection()) {
	            String sql = "SELECT * FROM users WHERE id = ?";
	            PreparedStatement stmt = con.prepareStatement(sql);
	            stmt.setInt(1, id);

	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                User user = new User();
	                user.setId(rs.getInt("id"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));
	                user.setPassword(rs.getString("password"));
	                user.setImg(rs.getString("img"));
	                return user;
	            }
	        }
	        return null;
	    }

	    public static boolean updatePassword(int userId, String hashedPassword) throws Exception {
	        try (Connection con = getConnection()) {
	            String sql = "UPDATE users SET password = ? WHERE id = ?";
	            PreparedStatement stmt = con.prepareStatement(sql);
	            stmt.setString(1, hashedPassword);
	            stmt.setInt(2, userId);
	            return stmt.executeUpdate() > 0;
	        }
	    }
}
