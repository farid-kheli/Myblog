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
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import JWT.JwtUtil;
import beans.GetUserID;

public class chengeusername extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String name = request.getParameter("name");
	        String password = request.getParameter("password");
		Cookie[] cookies = request.getCookies();
    	Map<String, Integer> userT = GetUserID.GetId(cookies);
    	 Integer userId = userT.get("user_id");
    	if (userId == 0) {
        	response.sendRedirect("login");
            return;
        }
    	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
        PreparedStatement stmt = con.prepareStatement("SELECT id,password FROM users WHERE id = ?");
        stmt.setInt(1, userId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            String storedHashedPassword = rs.getString("password");
            if (!BCrypt.checkpw(password, storedHashedPassword)) {
                request.setAttribute("message", "❌ Incorrect password!");
            } else {
            	PreparedStatement stmt1 = con.prepareStatement("UPDATE users set name=? WHERE id=?");
                stmt1.setString(1, name);
                stmt1.setInt(2, userId);
                stmt1.executeUpdate();
                response.sendRedirect(request.getContextPath() + "/setting");
                return;
        }

	        rs.close();
            stmt.close();
            con.close();
            }
        }catch(Exception e) {
        	e.printStackTrace();      
        }
	}

}
