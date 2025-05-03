package beans;

import java.sql.Date;

import DAO.BlogDAO;
import DAO.CategoryDAO;
import DAO.UserDAO;

public class Blog {
    private int id;
    private String title;
    private String content;
    private String discription;
    private int CID;
    private int authorId;
    private Date createdAt;

    public Blog(int id, String title, String content, int authorId, Date createdAt, String discription, int CID) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.authorId = authorId;
        this.createdAt = createdAt;
        this.discription = discription;
        this.CID = CID;
    }

    public Blog(String title, String content, int authorId, String discription, int CID) {
        this.title = title;
        this.content = content;
        this.authorId = authorId;
        this.discription = discription;
        this.CID = CID;
    }

    public Blog() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public int getCID() {
        return CID;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public boolean Liked(int userId) throws Exception {
    	return BlogDAO.isLiked(this.getId(),userId);
    }
    public boolean Saved(int userId) throws Exception {
    	return BlogDAO.isSaved(this.getId(),userId);
    }
    
    public int getLikes() throws Exception {
    	return BlogDAO.getLikes(this.getId());
    }
    public int getSaves() throws Exception {
    	return BlogDAO.getSaves(this.getId());
    }
    public int getShares() throws Exception {
    	return BlogDAO.getShares(this.getId());
    }
    public User getusername() throws Exception {
    	return UserDAO.getUserById(this.authorId);
    }
    
    public String getCategory() throws Exception {
    	return CategoryDAO.getCategoryById(this.CID);
    }
    
}
