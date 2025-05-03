package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import DAO.BlogDAO;
import beans.Blog;

import beans.Comment;
import beans.GetUserID;
public class blog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Cookie[] cookies = request.getCookies();
        	Map<String, Integer> user = GetUserID.GetId(cookies);
            Integer userId=user.get("user_id");
            if (userId == null) {
            	response.sendRedirect("login");
                return;
            }
			String blog_id = request.getParameter("id");
            Blog blog = BlogDAO.getBlogById(Integer.parseInt(blog_id));

            
            if (blog != null) {
                int numlikes=BlogDAO.getLikes(blog.getId());
                int numsaves=BlogDAO.getSaves(blog.getId());
                int numshares=BlogDAO.getShares(blog.getId());
                List<Comment> Comment=BlogDAO.getComments(blog.getId());
                    boolean liked=BlogDAO.isLiked(blog.getId(),userId);
                    boolean saved=BlogDAO.isSaved(blog.getId(),userId);
                    request.setAttribute("blog", blog);
                    request.setAttribute("liked", liked);
                    request.setAttribute("saved", saved);
                    request.setAttribute("num_likes",numlikes);
                    request.setAttribute("num_saves",numsaves);
                    request.setAttribute("num_shares",numshares);
                    request.setAttribute("Comments",Comment);
                    request.getRequestDispatcher("WEB-INF/blog.jsp").forward(request, response);
                
                
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Blog not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}





}
