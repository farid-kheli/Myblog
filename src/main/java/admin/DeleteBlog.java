package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class DeleteBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		String BId = request.getParameter("id");
			try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
		        
		        	PreparedStatement stmt = con.prepareStatement("DELETE FROM users WHERE id=?;");
		            stmt.setInt(1, Integer.parseInt(BId));
		            stmt.executeUpdate();
		            response.sendRedirect(request.getContextPath() + "/admin/bloges");

		        stmt.close();
		        con.close();
	            return;
		    }catch(Exception e) {
		    	e.printStackTrace();      
		    }
			}
	}

