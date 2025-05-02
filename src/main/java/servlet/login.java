package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import JWT.JwtUtil;

import java.util.Collections;
import java.util.regex.Pattern;
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return Pattern.matches(emailRegex, email);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("helloooooooooooooooooooooooooooooooooo :");
		request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
	}
   

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idToken = request.getParameter("credential");
        if (idToken != null && !idToken.isEmpty()) {
            try {
          	
                GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
                        GoogleNetHttpTransport.newTrustedTransport(),
                        GsonFactory.getDefaultInstance())
                        .setAudience(Collections.singletonList("860835309568-irtqb413o7omma4mcli4mrd78cnp6e3e.apps.googleusercontent.com"))  // Replace with your actual client ID
                        .build();

                GoogleIdToken googleToken = verifier.verify(idToken);
                if (googleToken != null) {
                    GoogleIdToken.Payload payload = googleToken.getPayload();
                    String email = payload.getEmail();

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
                         PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE email = ?")) {

                        stmt.setString(1, email);
                        ResultSet rs = stmt.executeQuery();

                        if (rs.next()) {
                            int userId = rs.getInt("id");
                            int role = rs.getInt("role");
                            String token = JwtUtil.generateToken(userId, role);
                            Cookie jwtCookie = new Cookie("jwt_token", token);
                            jwtCookie.setMaxAge(60 * 60 * 24 * 7);
                            jwtCookie.setHttpOnly(true);  
                            jwtCookie.setSecure(true);    
                            response.addCookie(jwtCookie);
                            response.sendRedirect(request.getContextPath() + "/home");
                            return;
                        } else {
                            // 🆕 Optional: auto-register Google users
                            request.setAttribute("message", "❌ Google account not registered!");
                            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
                            return;
                        }
                    }
                } else {
                    request.setAttribute("message", "❌ Invalid Google token!");
                    request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
                    return;
                }

            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }

        // 🔐 Default Email/Password Flow
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate email and password
        if (email == null || email.isEmpty() || !isValidEmail(email)) {
            request.setAttribute("message", "❌ Invalid email format!");
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            return;
        }
        if (password == null || password.isEmpty()) {
            request.setAttribute("message", "❌ Password cannot be empty");
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
                 PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE email = ?")) {

                stmt.setString(1, email);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    String storedHashedPassword = rs.getString("password");
                    if (!BCrypt.checkpw(password, storedHashedPassword)) {
                        request.setAttribute("message", "❌ Incorrect password!");
                        request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
                        return;
                    } else {
                        int userId = rs.getInt("id");
                        int role = rs.getInt("role");
                        String token = JwtUtil.generateToken(userId, role);
                        Cookie jwtCookie = new Cookie("jwt_token", token);
                        jwtCookie.setMaxAge(60 * 60 * 24 * 7);
                        jwtCookie.setHttpOnly(true); 
                        jwtCookie.setSecure(true);    
                        response.addCookie(jwtCookie);
                        response.sendRedirect(request.getContextPath() + "/home");
                        return;
                    }
                } else {
                    request.setAttribute("message", "❌ Email not found!");
                    request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Login Error: " + e.getMessage());
        }
    }


    
}
