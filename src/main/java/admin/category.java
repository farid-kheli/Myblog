package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.Categry;


public class category extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
        	String URL = "jdbc:mysql://localhost:3306/WebApp";
            String USER = "root";
            String PASSWORD = "";
        	Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
          String sql = "SELECT * FROM categories";
               PreparedStatement stmt = conn.prepareStatement(sql);
               ResultSet rs = stmt.executeQuery();
               List<Categry> categrys = new ArrayList<>();
               while (rs.next()) {
            	   categrys.add(new Categry(
                           rs.getInt("id"),
                           rs.getString("name")
                   ));
               }
               request.setAttribute("categrys", categrys);
       		request.getRequestDispatcher("/WEB-INF/categorys.jsp").forward(request, response);
           } catch (Exception e) {
			e.printStackTrace();
		}
	}


}
