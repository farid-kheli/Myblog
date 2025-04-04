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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import beans.Blog;

import beans.Comment;
import beans.GetUserID;
import beans.User;
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
			String blog_ids = request.getParameter("id");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM blogs WHERE id = ?");
            stmt.setString(1, blog_ids);
            ResultSet rs = stmt.executeQuery();
            Blog blog = null;
            if (rs.next()) { 
                blog = new Blog(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getInt("author_id"),
                    rs.getDate("created_at"),
                    rs.getString("discription"),
                    rs.getInt("category_id")
                );
            }

            PreparedStatement stmt5 = con.prepareStatement("SELECT * FROM UserCommentedBlog ");
            ResultSet rs5 = stmt5.executeQuery();
            List<Comment> Comment = new ArrayList<>();
            while (rs5.next()) {
            	Comment.add( new Comment(
                        rs5.getInt("id"),
                        rs5.getInt("userId"),
                        User.GetUser(rs5.getInt("userId")).getName(),
                        rs5.getString("coment"),
                        rs5.getInt("blogId"),
                        rs5.getDate("time")
                    ));
            }
            if (blog != null) {
                
                PreparedStatement stmt1 = con.prepareStatement("SELECT COUNT(*)as num_likes FROM UserLikedBlog WHERE blogId=?;");
                stmt1.setInt(1, Integer.parseInt(blog_ids));
                
                ResultSet rs2 = stmt1.executeQuery();
                int numlikes=0;
                if (rs2.next()) {  
                    numlikes = rs2.getInt("num_likes");
                }
                PreparedStatement stmt2 = con.prepareStatement("SELECT COUNT(*)as num_saves FROM UserSavedBlog WHERE blogId=?;");
                stmt2.setInt(1, Integer.parseInt(blog_ids));
                
                ResultSet rs3 = stmt2.executeQuery();
                int numsaves=0;
                if (rs3.next()) {  
                	numsaves = rs3.getInt("num_saves");
                }
                PreparedStatement stmt4 = con.prepareStatement("SELECT COUNT(*)as num_shares FROM UserSharedBlog WHERE blogId=?;");
                stmt4.setInt(1, Integer.parseInt(blog_ids));
                
                ResultSet rs4 = stmt4.executeQuery();
                int numshares=0;
                if (rs4.next()) {  
                	numshares = rs4.getInt("num_shares");
                }
                PreparedStatement stmt6 = con.prepareStatement("SELECT * FROM UserLikedBlog WHERE userId=? and blogId=?;");
                stmt6.setInt(1, userId);
                stmt6.setInt(2, Integer.parseInt(blog_ids));
                PreparedStatement stmt7 = con.prepareStatement("SELECT * FROM UserSavedBlog WHERE userId=? and blogId=?;");
                stmt7.setInt(1, userId);
                stmt7.setInt(2, Integer.parseInt(blog_ids));
                ResultSet rs7 = stmt7.executeQuery();
                ResultSet rs6 = stmt6.executeQuery();
                boolean liked= false;
                if(rs6.next()) {
                	liked=true;
                }
                boolean saved= false;
                if(rs7.next()) {
                	saved=true;
                }
                    rs2.close();
                    stmt1.close();
                    rs3.close();
                    stmt2.close();
                    rs4.close();
                    stmt4.close();
                    rs6.close();
                    stmt6.close();
                    
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

            rs.close();
            stmt.close();
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

}
