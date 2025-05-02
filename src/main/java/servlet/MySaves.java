package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
import DAO.UserDAO;
import beans.Blog;
import beans.GetUserID;
import beans.User;


public class MySaves extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
	        Cookie[] cookies = request.getCookies();
				Map<String, Integer> userT = GetUserID.GetId(cookies);
				 Integer userId = userT.get("user_id");
	        if (userId == 0) {
	        	response.sendRedirect("login");
	            return;
	        }
				User user = UserDAO.getUserById(userId);
				Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
		        PreparedStatement stmt1 = con.prepareStatement("SELECT * FROM blogs WHERE id IN (SELECT blogId FROM UserSavedBlog WHERE userId=?)");
		        stmt1.setInt(1, userId);
		        ResultSet rs = stmt1.executeQuery();
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
		        int NumBlogs = BlogDAO.getNumBlogs(userId);
		        request.setAttribute("blogs", blogs);
		        request.setAttribute("NumBlogs", NumBlogs);
				request.setAttribute("user", user);
				request.getRequestDispatcher("WEB-INF/profiel.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	

}
