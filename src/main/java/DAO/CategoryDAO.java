package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.Categry;


public class CategoryDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/WebApp";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
	 private static Connection getConnection() throws Exception {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	    }

	public static List<Categry> getcategorys() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM categories;");
        ResultSet rs = stmt.executeQuery();
        List<Categry> categrys = new ArrayList<>();
        while (rs.next()) {
        	categrys.add(new Categry(
        			rs.getInt("id"),
        			rs.getString("name")
        			));
        }
        return categrys;
	}
	 public static String getCategoryById(int id) throws Exception {
	        try (Connection con = getConnection()) {
	            String sql = "SELECT * FROM categories WHERE id = ?";
	            PreparedStatement stmt = con.prepareStatement(sql);
	            stmt.setInt(1, id);

	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                return rs.getString("name");
	            }
	        }
	        return null;
	    }
}
