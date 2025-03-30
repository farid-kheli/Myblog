package beans;

import java.sql.Date;
import beans.User;
public class Blog {
    private int id;
    private String title;
    private String content;
    private int authorId;
    private Date createdAt;

    // Constructors
    public Blog() {}

    public Blog(int id, String title, String content, int authorId, Date createdAt) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.authorId = authorId;
        this.createdAt = createdAt;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public int getAuthorId() { return authorId; }
    public void setAuthorId(int authorId) { this.authorId = authorId; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public String getusername() throws Exception {
			User user = User.GetUser(this.authorId);
			
			String name=user.getName();
	    	return name;
    }
    
}

