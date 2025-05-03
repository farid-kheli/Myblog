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
import java.util.Map;

import beans.GetUserID;


public class save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String blog_id = request.getParameter("id");
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
	        PreparedStatement stmt1 = con.prepareStatement("SELECT * FROM  UserSavedBlog WHERE userId=? and blogId=?; ");
	        
            Cookie[] cookies = request.getCookies();
			Map<String, Integer> userT = GetUserID.GetId(cookies);
			
			 Integer userId = userT.get("user_id");
        if (userId == 0) {
        	response.sendRedirect("login");
            return;
        }
        stmt1.setInt(1, userId);
        stmt1.setInt(2,  Integer.parseInt(blog_id));
        ResultSet rs = stmt1.executeQuery();
        if(rs.next()) {
        	PreparedStatement stmt2 = con.prepareStatement("DELETE from UserSavedBlog WHERE userId=? and blogId=?");
        	stmt2.setInt(1, userId);
            stmt2.setInt(2,  Integer.parseInt(blog_id));
            stmt2.executeUpdate();
            String referer = request.getHeader("referer");
            if (referer != null) {
                response.sendRedirect(referer);
            }
            return;
        }
        PreparedStatement stmt = con.prepareStatement("INSERT INTO UserSavedBlog(userId,blogId) VALUES(?, ?);");
        stmt.setInt(1, userId);
        stmt.setInt(2,  Integer.parseInt(blog_id));
        stmt.executeUpdate();
        String referer = request.getHeader("referer");
        if (referer != null) {
            response.sendRedirect(referer);
        }
		}catch(Exception e) {
			 e.printStackTrace();
		}
	}

	

}
