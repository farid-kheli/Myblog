
package beans;



public class Categry {
	private int id;
    private String category;
    public Categry() {}

    public Categry( int id, String category) {
        this.id = id;
        this.category = category;
    }
    

    public int getId() { return id; }
    public String getCategory() { return category; }

}
