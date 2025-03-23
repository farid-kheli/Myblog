package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie jwtCookie = new Cookie("jwt_token", "");
		jwtCookie.setMaxAge(0); 
		System.out.println("LOG_OUT");
		response.addCookie(jwtCookie);
		response.sendRedirect(request.getContextPath() + "/login");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
