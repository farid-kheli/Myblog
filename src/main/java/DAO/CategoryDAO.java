package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.Categry;

public class CategoryDAO {
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
}
