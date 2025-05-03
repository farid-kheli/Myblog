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
import java.util.Map;

import beans.GetUserID;


public class comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String blog_id = request.getParameter("id");
			String comment = request.getParameter("comment");
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
            Cookie[] cookies = request.getCookies();
			Map<String, Integer> userT = GetUserID.GetId(cookies);
			 Integer userId = userT.get("user_id");
        if (userId == 0) {
        	response.sendRedirect("login");
            return;
        }
        System.out.println("POST Comment :"+blog_id);
        PreparedStatement stmt = con.prepareStatement("INSERT INTO UserCommentedBlog(userId,coment,blogId) VALUES(?,?,?);");
        stmt.setInt(1, userId);
        stmt.setString(2, comment);
        stmt.setInt(3,  Integer.parseInt(blog_id));
        
        stmt.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/Blog?id="+blog_id);
		}catch(Exception e) {
			 e.printStackTrace();
		}
	}

}
