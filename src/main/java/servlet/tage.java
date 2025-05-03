package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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

import beans.Blog;

public class tage extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
        	String search = request.getParameter("search");
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
	        PreparedStatement stmt = con.prepareStatement("SELECT * FROM blogs  WHERE category_id In(select id from categories where name=?)");
	        stmt.setString(1,search );
	        ResultSet rs = stmt.executeQuery();
	        List<Blog> blogs = new ArrayList<>();
	        while (rs.next()) {
	        	blogs.add(new Blog(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("author_id"),
                        rs.getDate("created_at"),
                        rs.getString("discription"),
                        rs.getInt("category_id")
                ));
            }
	        request.setAttribute("blogs", blogs);
	        request.setAttribute("search", search);
			request.getRequestDispatcher("WEB-INF/tags.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
