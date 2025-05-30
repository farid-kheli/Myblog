package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.Random;
import java.util.stream.Collectors;

import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.tx.gas.DefaultGasProvider;

import DAO.CategoryDAO;
import org.web3j.protocol.http.HttpService; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import beans.Blog;
import beans.Categry;
import beans.GetUserID;
import beans.User;
import blockchain.SmartContreact;

import java.sql.DriverManager;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB before storing on disk
	    maxFileSize = 1024 * 1024 * 10, // Max file size: 10MB
	    maxRequestSize = 1024 * 1024 * 50 // Max request size: 50MB
	)

public class Dashbord<BlogService> extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Web3j web3j;
    private Credentials credentials;
    private SmartContreact contract;

    @Override
    public void init() throws ServletException {
        try {
            web3j = Web3j.build(new HttpService("http://127.0.0.1:7545"));
            System.out.println("hellloooooooooooooooo"+web3j);
            credentials = Credentials.create("0xd4e4eba380dfbe39a9e54d0ad946ee22ebfbcf1ca66ca00cc9507c8b73713302");

            String contractAddress = "0xe03587F38636d84FC262Cae3F2F831df477f0571";  
            contract = SmartContreact.load(
                contractAddress,
                web3j,
                credentials,
                new DefaultGasProvider()
            );
        } catch (Exception e) {
            e.printStackTrace(); 
        }
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        try {
        	List<Categry> categrys= CategoryDAO.getcategorys();
	        request.setAttribute("categrys", categrys);
			request.getRequestDispatcher("WEB-INF/dashbord.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
	}

	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String DB_URL = "jdbc:mysql://localhost:3306/WebApp";
	    String DB_USER = "root";
	    String DB_PASSWORD = "";
		 
		 Part filePart = request.getPart("B_Img");
		 
		        
			
		        
					
	        String content = request.getParameter("content");
	        try {
	        	String title = new BufferedReader(new InputStreamReader(request.getPart("title").getInputStream()))
		                .lines().collect(Collectors.joining("\n"));
	        	String discription = new BufferedReader(new InputStreamReader(request.getPart("discription").getInputStream()))
		                .lines().collect(Collectors.joining("\n"));
	        	String categry = new BufferedReader(new InputStreamReader(request.getPart("categry").getInputStream()))
		                .lines().collect(Collectors.joining("\n"));
	        	Cookie[] cookies = request.getCookies();
	        	Map<String, Integer> userT = GetUserID.GetId(cookies);
	        	 Integer userId = userT.get("user_id");
	        	if (userId == 0) {
		        	response.sendRedirect("login");
		            return;
		        }
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	            PreparedStatement stmt = conn.prepareStatement("INSERT INTO blogs (title, content, author_id, category_id,discription) VALUES (?, ?, ?, ?,?)"
	            		,Statement.RETURN_GENERATED_KEYS
	            		);

	        	contract.createBlog(title, content).send();
	            stmt.setString(1, title);
	            stmt.setString(2, content);
	            stmt.setInt(3, userId);
	            stmt.setInt(4,Integer.parseInt(categry) );
	            stmt.setString(5, discription);
	            stmt.executeUpdate();
	            ResultSet rs = stmt.getGeneratedKeys();
	            String uploadPath =  "uploads"+ File.separator + "Blog_pictures";
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) uploadDir.mkdir();
	            if (rs.next()) {
	            String filePath = "/home/farid/eclipse-workspace/exampleAPP/src/main/webapp/uploads/Blog_pictures/"+rs.getInt(1) ;
	            Files.copy(filePart.getInputStream(), new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
	            }

		        response.sendRedirect("MyBloges"); 
	            stmt.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	    
	}

}
