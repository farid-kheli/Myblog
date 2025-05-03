package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.stream.Collectors;

import DAO.BlogDAO;
import DAO.CategoryDAO;
import beans.Blog;
import beans.Categry;
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB before storing on disk
	    maxFileSize = 1024 * 1024 * 10, // Max file size: 10MB
	    maxRequestSize = 1024 * 1024 * 50 // Max request size: 50MB
	)
public class EditBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			int blogId = Integer.parseInt(request.getParameter("id"));
			Blog blog = new BlogDAO().getBlogById(blogId);

        	List<Categry> categrys= CategoryDAO.getcategorys();
	        request.setAttribute("categrys", categrys);
	        request.setAttribute("blog", blog);
			request.getRequestDispatcher("WEB-INF/editblog.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    @SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String blogId = new BufferedReader(new InputStreamReader(request.getPart("id").getInputStream()))
	                .lines().collect(Collectors.joining("\n"));
            String title = new BufferedReader(new InputStreamReader(request.getPart("title").getInputStream()))
	                .lines().collect(Collectors.joining("\n"));
            String content = new BufferedReader(new InputStreamReader(request.getPart("content").getInputStream()))
	                .lines().collect(Collectors.joining("\n"));
            String discription = new BufferedReader(new InputStreamReader(request.getPart("discription").getInputStream()))
	                .lines().collect(Collectors.joining("\n"));
            int categoryId = Integer.parseInt(new BufferedReader(new InputStreamReader(request.getPart("categry").getInputStream()))
	                .lines().collect(Collectors.joining("\n")));

            Blog blog = BlogDAO.getBlogById(Integer.parseInt(blogId) );
            
            if (blog != null) {
                blog.setTitle(title);
                blog.setContent(content);
                blog.setDiscription(discription);
                blog.setCID(categoryId);

          		 Part filePart = request.getPart("B_Img");
                boolean success = BlogDAO.updateBlog(blog,filePart.getInputStream());

                if (success) {
                    response.sendRedirect("Blog?id=" + blogId);
                    response.sendRedirect(request.getContextPath() + "/MyBloges");
                } else {
                    response.sendRedirect(request.getContextPath() + "/MyBloges");
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Blog not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
