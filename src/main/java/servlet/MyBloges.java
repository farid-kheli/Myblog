package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import JWT.JwtUtil;
import beans.Blog;

    

public class MyBloges extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBloges() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String token = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("jwt_token".equals(cookie.getName())) {
                    token = cookie.getValue();
                    break;
                }
            }
        }
        Integer userId = (token != null) ? JwtUtil.validateToken(token) : null;
        if (userId == null) {
        	response.sendRedirect("login");
            return;
        }
        System.out.println("MY_BLOGES");
        try{
        	String URL = "jdbc:mysql://localhost:3306/WebApp";
            String USER = "root";
            String PASSWORD = "";
        	Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
          String sql = "SELECT * FROM blogs WHERE author_id = ? ORDER BY created_at DESC";
               PreparedStatement stmt = conn.prepareStatement(sql);
               stmt.setInt(1, userId);
               ResultSet rs = stmt.executeQuery();
               List<Blog> blogs = new ArrayList<>();
               while (rs.next()) {
                   blogs.add(new Blog(
                           rs.getInt("id"),
                           rs.getString("title"),
                           rs.getString("content"),
                           rs.getInt("author_id"),
                           rs.getTimestamp("created_at")
                   ));
               }
               
               request.setAttribute("blogs", blogs);
               request.getRequestDispatcher("WEB-INF/MyBloges.jsp").forward(request, response);
           } catch (Exception e) {
			e.printStackTrace();
		}
        
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
