package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Map;

import DAO.UserDAO;
import beans.GetUserID;
import beans.User;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class uploadProfilePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        try {
        	Cookie[] cookies = request.getCookies();
			Map<String, Integer> userT = GetUserID.GetId(cookies);
			
			 Integer userId = userT.get("user_id");
        if (userId == 0) {
        	response.sendRedirect("login");
            return;
        }
        User user= UserDAO.getUserById(userId);
        	Part filePart = request.getPart("profilePic");
            String uploadPath =  "uploads"+ File.separator + "profile_pictures";
            
             File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            String filePath = "/home/farid/eclipse-workspace/exampleAPP/src/main/webapp/uploads/profile_pictures/"+ user.getName();
            Files.copy(filePart.getInputStream(), new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);

            
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp","root","");
			
			
			PreparedStatement stm = con.prepareStatement("UPDATE users set img=? WHERE id=?");
			 response.sendRedirect(request.getContextPath() + "/profiel");
			 stm.setString(1, "/uploads/profile_pictures/"+ user.getName());
			 stm.setInt(2, userId);
			 stm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
       
	}

}
