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

import org.mindrot.jbcrypt.BCrypt;

import JWT.JwtUtil;
import beans.Blog;

import beans.Blog;
public class blog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public blog() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String blog_ids = request.getParameter("id");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("hellooooooooooooooooooooooooooooooooooooooo");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM blogs WHERE id = ?");
            stmt.setString(1, blog_ids);
            ResultSet rs = stmt.executeQuery();
            Blog blog = null;
            if (rs.next()) { 
                blog = new Blog(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getInt("author_id"),
                    rs.getTimestamp("created_at")
                );
            }

            rs.close();
            stmt.close();
            con.close();
            if (blog != null) {
                request.setAttribute("blog", blog);
                request.getRequestDispatcher("WEB-INF/blog.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Blog not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
