package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.BlogDAO;
import beans.Blog;


public class DeletBloge extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int blogId = Integer.parseInt(request.getParameter("id"));
			BlogDAO.deleteBlog(blogId);
	        response.sendRedirect(request.getContextPath() + "/MyBloges");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}
