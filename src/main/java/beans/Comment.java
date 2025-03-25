package beans;

public class Comment {
	private int id;
    private int userID;
    private String comment;
    private int blogID;



    public Comment(int id,int userID, String comment, int blogID) {
        this.id = id;
        this.userID = userID;
        this.comment = comment;
        this.blogID = blogID;
    }
    public int getId() { return id; }
    public int getuserID() { return userID; }
    public String getcomment() { return comment; }
    public int getblogID() { return blogID; }
    
}
