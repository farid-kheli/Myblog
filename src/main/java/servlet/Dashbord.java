package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.io.IOException;



public class Dashbord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashbord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/dashbord.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String DB_URL = "jdbc:mysql://localhost:3306/WebApp";
	    String DB_USER = "root";
	    String DB_PASSWORD = "";
		 String title = request.getParameter("title");
	        String content = request.getParameter("content");
	        HttpSession session = request.getSession();
	        Integer authorId = (Integer) session.getAttribute("user_id");
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	            PreparedStatement stmt = conn.prepareStatement("INSERT INTO blogs (title, content, author_id, category_id) VALUES (?, ?, ?, ?)");
	            stmt.setString(1, title);
	            stmt.setString(2, content);
	            stmt.setInt(3, authorId);
	            stmt.setInt(4, 1);
	            stmt.executeUpdate();

	            stmt.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        response.sendRedirect("MyBloges"); 
	    
	}

}
