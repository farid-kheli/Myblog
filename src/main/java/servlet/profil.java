package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

import beans.GetUserID;
import beans.User;
public class profil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("PROFIEL");
		try {
        Cookie[] cookies = request.getCookies();
			Map<String, Integer> userT = GetUserID.GetId(cookies);
			 Integer userId = userT.get("user_id");
        if (userId == 0) {
        	response.sendRedirect("login");
            return;
        }
			User user = User.GetUser(userId);
			request.setAttribute("user", user);
			request.getRequestDispatcher("WEB-INF/profiel.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
