package beans;
import java.sql.Date;

import DAO.UserDAO;
public class Comment {
	private int id;
    private int userID;
    private String comment;
    private String username;
    private Date time;
    private int blogID;



    public Comment(int id,int userID,String username, String comment, int blogID,Date time) {
        this.id = id;
        this.userID = userID;
        this.comment = comment;
        this.blogID = blogID;
        this.username=username;
        this.time = time;
    }
    public int getId() { return id; }
    public String getUserName() { return username; }
    public Date getTime() { return time; }
    public int getuserID() { return userID; }
    public String getcomment() { return comment; }
    public String getUserImg() throws Exception { return UserDAO.getUserById(userID).getImg(); }
    public int getblogID() { return blogID; }
    
    
}
