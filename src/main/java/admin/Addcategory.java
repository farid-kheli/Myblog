package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



public class Addcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
			String category = request.getParameter("category");
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
        
        PreparedStatement stmt = con.prepareStatement("INSERT INTO categories(name) VALUES(?);");

        stmt.setString(1, category);
        
        stmt.executeUpdate();
        response.sendRedirect(request.getContextPath() + "/admin/categorys");
		}catch(Exception e) {
			 e.printStackTrace();
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
	System.out.print("hell000000000000000000000000000000000000000");
			
			String category = request.getParameter("CID");
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
        
        PreparedStatement stmt = con.prepareStatement("DELETE from categories WHERE id=?");
        stmt.setInt(1, Integer.parseInt(category));
        
        stmt.executeUpdate();
        response.sendRedirect(request.getContextPath() + "/admin/categorys");
		}catch(Exception e) {
			 e.printStackTrace();
		}
	}
	

}
