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

import org.mindrot.jbcrypt.BCrypt;

import DAO.UserDAO;
import beans.GetUserID;
import beans.User;

public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String NewPassword = request.getParameter("NewPassword");
		String CPassword = request.getParameter("CPassword");
		String password = request.getParameter("password");
		Cookie[] cookies = request.getCookies();
		Map<String, Integer> userT = GetUserID.GetId(cookies);
		Integer userId = userT.get("user_id");

		if (userId == 0) {
			response.sendRedirect("login");
			return;
		}
		if (!NewPassword.equals(CPassword)) {
			request.setAttribute("message", "password must match");
			response.sendRedirect(request.getContextPath() + "/setting");
			return;
		}
		try {

			String hashedPassword = BCrypt.hashpw(NewPassword, BCrypt.gensalt());
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
			PreparedStatement stmt = con.prepareStatement("SELECT password FROM users WHERE id = ?");
			stmt.setInt(1, userId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				String storedHashedPassword = rs.getString("password");
				if (!BCrypt.checkpw(password, storedHashedPassword)) {
					request.setAttribute("message", "❌ Incorrect password!");
				} else {
					UserDAO.updatePassword(userId,hashedPassword);
					response.sendRedirect(request.getContextPath() + "/logout");
					return;
				}

				rs.close();
				stmt.close();
				con.close();
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
