package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;
import beans.User;
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    // Email validation regex
	    String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

	    // Password must be at least 8 characters, include a number and a special character
	    String passwordRegex = "^(?=.*[0-9])(?=.*[!@#$%^&*()_+\\-=[\\]{};':\"\\\\|,.<>/?]).{8,}$";

	    if (!email.matches(emailRegex)) {
	        request.setAttribute("error", "Invalid email format.");
	        request.getRequestDispatcher("register.jsp").forward(request, response);
	        return;
	    }

	    if (!password.matches(passwordRegex)) {
	        request.setAttribute("error", "Password must be at least 8 characters, contain a number, and a special character.");
	        request.getRequestDispatcher("register.jsp").forward(request, response);
	        return;
	    }

	    // Hash the password using BCrypt
	    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

	    // Create and save the user
	    User user = new User(name, email, hashedPassword);
	    user.creat();

	    // Redirect to login page after successful registration
	    response.sendRedirect("login");
	}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
	}
	

}
