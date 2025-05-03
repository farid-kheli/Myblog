package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
import java.util.Map;

import DAO.BlogDAO;
import beans.Blog;
import DAO.CategoryDAO;
import beans.Blog;
import beans.Categry;
import beans.GetUserID;


public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public index() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Cookie[] cookies = request.getCookies();
        	Map<String, Integer> user = GetUserID.GetId(cookies);
            Integer userId=user.get("user_id");
            if (userId == null) {
            	response.sendRedirect("login");
                return;
            }
        	String URL = "jdbc:mysql://localhost:3306/WebApp";
            String USER = "root";
            String PASSWORD = "";
        	Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
          String sql = "SELECT * FROM blogs ORDER BY created_at DESC";
               PreparedStatement stmt = conn.prepareStatement(sql);
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

           	List<Categry> categrys= CategoryDAO.getcategorys();
   	        request.setAttribute("categrys", categrys);
               request.setAttribute("blogs", blogs);
               request.setAttribute("userId", userId);
               request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
           } catch (Exception e) {
			e.printStackTrace();
		}
		 System.out.println("INDEX_GET");
	}

	
	

}
