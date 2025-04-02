package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import beans.Blog;
import beans.GetUserID;
import beans.User;
public class profil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		System.out.println("PROFIEL :");
		try {
        Cookie[] cookies = request.getCookies();
			Map<String, Integer> userT = GetUserID.GetId(cookies);
			 Integer userId = userT.get("user_id");
        if (userId == 0) {
        	response.sendRedirect("login");
            return;
        }
			User user = User.GetUser(userId);
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
	        PreparedStatement stmt1 = con.prepareStatement("SELECT * FROM blogs WHERE id IN (SELECT blogId FROM UserLikedBlog WHERE userId=?)");
	        stmt1.setInt(1, userId);
	        ResultSet rs = stmt1.executeQuery();
	        List<Blog> blogsLiked = new ArrayList<>();
	        while (rs.next()) {
	        	blogsLiked.add(new Blog(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("author_id"),
                        rs.getDate("created_at"),
                        rs.getString("discription"),
                        rs.getInt("category_id")
                ));
            }
	        PreparedStatement stmt = con.prepareStatement("SELECT * FROM blogs WHERE id IN (SELECT blogId FROM UserSavedBlog WHERE userId=?)");
	        stmt.setInt(1, userId);
	        ResultSet rs1 = stmt.executeQuery();
	        List<Blog> UserSavedBlog = new ArrayList<>();
	        while (rs1.next()) {
	        	UserSavedBlog.add(new Blog(
                        rs1.getInt("id"),
                        rs1.getString("title"),
                        rs1.getString("content"),
                        rs1.getInt("author_id"),
                        rs1.getDate("created_at"),
                        rs1.getString("discription"),
                        rs1.getInt("category_id")
                ));
            }
	        request.setAttribute("UserSavedBlogs", UserSavedBlog);
	        request.setAttribute("blogsLikeds", blogsLiked);
			request.setAttribute("user", user);
			request.getRequestDispatcher("WEB-INF/profiel.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		
	}

	
	

}
