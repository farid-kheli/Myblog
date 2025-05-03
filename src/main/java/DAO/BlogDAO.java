package DAO;

import beans.Blog;
import beans.Comment;
import beans.User;
import jakarta.servlet.annotation.MultipartConfig;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import java.util.*;


public class BlogDAO {

    private static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
    }
    public static boolean updateBlog(Blog blog,InputStream filePart) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");

        String sql = "UPDATE blogs SET title = ?, content = ?, discription = ?, category_id = ? WHERE id = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, blog.getTitle());
        stmt.setString(2, blog.getContent());
        stmt.setString(3, blog.getDiscription());
        stmt.setInt(4, blog.getCID());
        stmt.setInt(5, blog.getId());

        String filePath = "/home/farid/eclipse-workspace/exampleAPP/src/main/webapp/uploads/Blog_pictures/"+blog.getId() ;
        Files.copy(filePart, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
        int affected = stmt.executeUpdate();

        stmt.close();
        con.close();

        return affected > 0;
    }


    public static Blog getBlogById(int blogId) throws Exception {
        String sql = "SELECT * FROM blogs WHERE id = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, blogId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Blog(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("author_id"),
                        rs.getDate("created_at"),
                        rs.getString("discription"),
                        rs.getInt("category_id")
                );
            }
        }
        return null;
    }

    public static void deleteBlog(int id) throws Exception {
        String sql = "DELETE FROM blogs WHERE id = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
           Path path = Paths.get("/home/farid/eclipse-workspace/exampleAPP/src/main/webapp/uploads/Blog_pictures/" + id);
            Files.delete(path);
        }
    }

    public static int getLikes(int blogId) throws Exception {
        String sql = "SELECT COUNT(*) as num FROM UserLikedBlog WHERE blogId = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, blogId);
            ResultSet rs = stmt.executeQuery();
            return rs.next() ? rs.getInt("num") : 0;
        }
    }

    public static int getSaves(int blogId) throws Exception {
        String sql = "SELECT COUNT(*) as num FROM UserSavedBlog WHERE blogId = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, blogId);
            ResultSet rs = stmt.executeQuery();
            return rs.next() ? rs.getInt("num") : 0;
        }
    }

    public static int getShares(int blogId) throws Exception {
        String sql = "SELECT COUNT(*) as num FROM UserSharedBlog WHERE blogId = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, blogId);
            ResultSet rs = stmt.executeQuery();
            return rs.next() ? rs.getInt("num") : 0;
        }
    }
    public static int getNumBlogs(int UserId) throws Exception {
        String sql = "SELECT COUNT(*) as num FROM blogs WHERE author_id = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, UserId);
            ResultSet rs = stmt.executeQuery();
            return rs.next() ? rs.getInt("num") : null;
        }
    }

    public static List<Comment> getComments(int blogId) throws Exception {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM UserCommentedBlog WHERE blogId = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, blogId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new UserDAO().getUserById(rs.getInt("userId"));
                comments.add(new Comment(
                    rs.getInt("id"),
                    rs.getInt("userId"),
                    user.getName(),
                    rs.getString("coment"),
                    rs.getInt("blogId"),
                    rs.getDate("time")
                ));
            }
        }
        return comments;
    }
    public static List<Blog> getPostsBy(int UserId) throws Exception {
        List<Blog> Blog = new ArrayList<>();
        String sql = "SELECT * FROM blogs WHERE author_id = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, UserId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Blog.add(new Blog(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("author_id"),
                        rs.getDate("created_at"),
                        rs.getString("discription"),
                        rs.getInt("category_id")
                ));
            }
        }
        return Blog;
    }

    public static boolean isLiked(int blogId, int userId) throws Exception {
        String sql = "SELECT * FROM UserLikedBlog WHERE userId = ? AND blogId = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, blogId);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        }
    }

    public static boolean isSaved(int blogId, int userId) throws Exception {
        String sql = "SELECT * FROM UserSavedBlog WHERE userId = ? AND blogId = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, blogId);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        }
    }
}
