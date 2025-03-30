package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.User;

public class display_users extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
        	String URL = "jdbc:mysql://localhost:3306/WebApp";
            String USER = "root";
            String PASSWORD = "";
        	Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
          String sql = "SELECT * FROM users";
               PreparedStatement stmt = conn.prepareStatement(sql);
               ResultSet rs = stmt.executeQuery();
               List<User> users = new ArrayList<>();
               while (rs.next()) {
                   users.add(new User(
                           rs.getString("name"),
                           rs.getString("email"),
                           rs.getString("password"),
                           rs.getInt("id")
                   ));
               }
               System.out.print(users);
               request.setAttribute("users", users);
       		request.getRequestDispatcher("/WEB-INF/display_users.jsp").forward(request, response);
           } catch (Exception e) {
			e.printStackTrace();
		}

	}

	

}
