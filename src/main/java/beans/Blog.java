package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Blog {
    private int id;
    private String title;
    private String content;
    private String Discription;
    private int CID;
    private int authorId;
    private Date createdAt;


    public Blog(int id, String title, String content, int authorId, Date createdAt,String Discription,int CID) {
        this.id = id;
        this.CID = CID;
        this.title = title;
        this.content = content;
        this.authorId = authorId;
        this.createdAt = createdAt;
        this.Discription = Discription;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public int getAuthorId() { return authorId; }
    public int getCID() { return CID; }
    public String getDiscription() { return Discription; }
    public void setAuthorId(int authorId) { this.authorId = authorId; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public String getusername() throws Exception {
			User user = User.GetUser(this.authorId);
			
			String name=user.getName();
	    	return name;
    }
    public int getLikes() throws Exception {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
    	PreparedStatement stmt1 = con.prepareStatement("SELECT COUNT(*)as num_likes FROM UserLikedBlog WHERE blogId=?;");
        stmt1.setInt(1, this.id);
        
        ResultSet rs2 = stmt1.executeQuery();
        int numlikes=0;
        if (rs2.next()) {  
            numlikes = rs2.getInt("num_likes");
        }

        con.close();
        rs2.close();
        stmt1.close();
    	return numlikes;
    }
    public static Blog getBloge(int ID) throws Exception {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM blogs WHERE id = ?");
        stmt.setInt(1, ID);
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
        return blog;
        
    }
    public int getSaves() throws Exception {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
    	PreparedStatement stmt1 = con.prepareStatement("SELECT COUNT(*)as num_saves FROM UserSavedBlog WHERE blogId=?;");
        stmt1.setInt(1, this.id);
        
        ResultSet rs2 = stmt1.executeQuery();
        int numsaves=0;
        if (rs2.next()) {  
        	numsaves = rs2.getInt("num_saves");
        }

        con.close();
        rs2.close();
        stmt1.close();
    	return numsaves;
    }
    public int getShares() throws Exception {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
    	PreparedStatement stmt1 = con.prepareStatement("SELECT COUNT(*)as num_shares FROM UserSharedBlog WHERE blogId=?;");
        stmt1.setInt(1, this.id);
        
        ResultSet rs2 = stmt1.executeQuery();
        int numshares=0;
        if (rs2.next()) {  
        	numshares = rs2.getInt("num_shares");
        }

        con.close();
        rs2.close();
        stmt1.close();
    	return numshares;
    }
    public List<Comment> getComents() throws Exception {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
    	PreparedStatement stmt = con.prepareStatement("SELECT * FROM UserCommentedBlog WHERE blogId=?");
    	stmt.setInt(1, this.id);
        ResultSet rs = stmt.executeQuery();
        List<Comment> Comment = new ArrayList<>();
        while (rs.next()) {
        	Comment.add( new Comment(
                    rs.getInt("id"),
                    rs.getInt("userId"),
                    User.GetUser(rs.getInt("userId")).getName(),
                    rs.getString("coment"),
                    rs.getInt("blogId"),
                    rs.getDate("time")
                ));
        }

        con.close();
        rs.close();
        stmt.close();
    	return Comment;
    }
    public boolean Liked(int user_id) throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
    	PreparedStatement stmt6 = con.prepareStatement("SELECT * FROM UserLikedBlog WHERE userId=? and blogId=?;");
        stmt6.setInt(1, user_id);
        stmt6.setInt(2, this.id);
        ResultSet rs = stmt6.executeQuery();
        boolean liked= false;
        if(rs.next()) {
        	liked=true;
        }
        rs.close();
        stmt6.close();
    	return liked;
    }
    public boolean Saved(int user_id) throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
    	PreparedStatement stmt6 = con.prepareStatement("SELECT * FROM UserSavedBlog WHERE userId=? and blogId=?;");
        stmt6.setInt(1, user_id);
        stmt6.setInt(2, this.id);
        ResultSet rs = stmt6.executeQuery();
        boolean liked= false;
        if(rs.next()) {
        	liked=true;
        }
        rs.close();
        stmt6.close();
    	return liked;
    }
    
}

