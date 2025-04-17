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

import org.mindrot.jbcrypt.BCrypt;

import DAO.UserDAO;
import JWT.JwtUtil;
import beans.User;

public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
	}

}
