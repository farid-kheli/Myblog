package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Map;


import beans.GetUserID;


public class ADDaddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get wallet address from form
	    String walletAddress = request.getParameter("address");

	    // Get author ID from session (you must have stored it earlier during login)

	    if (walletAddress == null || !walletAddress.matches("^0x[a-fA-F0-9]{40}$")) {
	        request.setAttribute("error", "Invalid wallet address.");
            response.sendRedirect(request.getContextPath() + "/setting#list-coffee");
	        return;
	    }

	    PreparedStatement stmt = null;

	    try {
	    	Cookie[] cookies = request.getCookies();
			Map<String, Integer> userT = GetUserID.GetId(cookies);
			 Integer userId = userT.get("user_id");
        if (userId == 0) {
        	response.sendRedirect("login");
            return;
        }
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");

	        // Update wallet address
	        String sql = "UPDATE users SET wallet_address = ? WHERE id = ?";
	        stmt = con.prepareStatement(sql);
	        stmt.setString(1, walletAddress);
	        stmt.setInt(2, userId);

	        int updated = stmt.executeUpdate();
	        if (updated > 0) {
	            request.setAttribute("message", "Wallet address saved successfully!");
	        } else {
	            request.setAttribute("error", "Failed to update wallet address.");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "Database error: " + e.getMessage());
	    } finally {
	        try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
	    }

        response.sendRedirect(request.getContextPath() + "/profiel");
	}

}
