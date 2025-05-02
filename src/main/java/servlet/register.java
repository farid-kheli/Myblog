package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import java.sql.Statement;
import java.util.Collections;

import org.mindrot.jbcrypt.BCrypt;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import DAO.UserDAO;
import JWT.JwtUtil;
import beans.User;

public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String idToken = request.getParameter("credential");
	        if (idToken != null && !idToken.isEmpty()) {
	            try {
	                GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
	                        GoogleNetHttpTransport.newTrustedTransport(),
	                        GsonFactory.getDefaultInstance())
	                        .setAudience(Collections.singletonList("860835309568-irtqb413o7omma4mcli4mrd78cnp6e3e.apps.googleusercontent.com"))
	                        .build();

	                GoogleIdToken googleToken = verifier.verify(idToken);

	                if (googleToken != null) {
	                    GoogleIdToken.Payload payload = googleToken.getPayload();
	                    String email = payload.getEmail();
	                    String name = (String) payload.get("name");
	                    String pictureUrl = (String) payload.get("picture");
	                    System.out.println("hell0000000000000000000000000000000000 :"+pictureUrl);
	                    Class.forName("com.mysql.cj.jdbc.Driver");
	                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
	                         PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM users WHERE email = ?")) {

	                        checkStmt.setString(1, email);
	                        ResultSet rs = checkStmt.executeQuery();

	                        if (rs.next()) {
	                            // ✅ Existing user - issue token
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
	                            // 🆕 Auto-register Google user
	                            try (PreparedStatement insertStmt = con.prepareStatement(
	                                    "INSERT INTO users (name, email, password, role,img) VALUES (?, ?, ?, ?,?)",
	                                    Statement.RETURN_GENERATED_KEYS)) {

	                                insertStmt.setString(1, name);
	                                insertStmt.setString(2, email);
	                                insertStmt.setString(3, "GOOGLE-OAUTH");
	                                insertStmt.setInt(4, 0); 
	                                insertStmt.setString(5, pictureUrl); 
	                                insertStmt.executeUpdate();
	                                ResultSet keys = insertStmt.getGeneratedKeys();
	                                if (keys.next()) {
	                                    int newUserId = keys.getInt(1);
	                                    int role = 0;
	                                    String token = JwtUtil.generateToken(newUserId, role);

	                                    Cookie jwtCookie = new Cookie("jwt_token", token);
	                                    jwtCookie.setMaxAge(60 * 60 * 24 * 7);
	                                    jwtCookie.setHttpOnly(true);
	                                    jwtCookie.setSecure(true);
	                                    response.addCookie(jwtCookie);

	                                    response.sendRedirect(request.getContextPath() + "/home");
	                                    return;
	                                }
	                            }
	                        }
	                    }
	                } else {
	                    request.setAttribute("message", "❌ Invalid Google token!");
	                    request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
	                    return;
	                }

	            } catch ( Exception e) {
	                e.printStackTrace();
	                return;
	            }
	        }
	        String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String Cpassword = request.getParameter("Cpassword");

			String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
			String passwordRegex = "^(?=.*[0-9])(?=.*[!@#$%^&*()_+\\\\-[\\\\]{};':\\\"\\\\\\\\|,.<>/?]).{8,}$";
			try {

				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
				PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE email = ?");
				stmt.setString(1, email);
				ResultSet rs = stmt.executeQuery();
				if ( !email.matches(emailRegex) || !password.matches(passwordRegex)
						|| !password.equals(Cpassword)) {
					if (!email.matches(emailRegex)) {
						request.setAttribute("EmailTmessage", "Invalid email format.");
					}

					if (!password.matches(passwordRegex)) {
						request.setAttribute("Passmessage",
								"Password must be at least 8 characters, contain a number, and a special character.");

					}
					if (!password.equals(Cpassword)) {
						request.setAttribute("CPassmessage", "password must match");
					}
					request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
					return;
				}
				else if (rs.next()) {
					request.setAttribute("EmailTmessage", "email allready been taken");
					request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
					return;
				}
					else {
					String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

					User user = new User(name, email, hashedPassword);
					UserDAO.create(user);
					response.sendRedirect(request.getContextPath() + "/login");
				}

			} catch (Exception e) {
				
			}

			}
			

	 private boolean isValidEmail(String email) {
	        return email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
	    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
	}

}
