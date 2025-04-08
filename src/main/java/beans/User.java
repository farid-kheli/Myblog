package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.mindrot.jbcrypt.BCrypt;

public class User {
	private int id;
	private String name;
	private String password;
	private String email;
	private String img = null;

	public User() {
	}

	public User(String name, String email, String password) {
		this.name = name;
		this.email = email;
		this.password = password;

	}

	public User(String name, String email, String password, int id) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.id = id;
	}

	public void creat() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
			PreparedStatement pre = con.prepareStatement("INSERT INTO users(name, email, password) VALUES(?, ?, ?);",
					Statement.RETURN_GENERATED_KEYS);

			pre.setString(1, this.name);
			pre.setString(2, this.email);
			pre.setString(3, this.password);

			int affectedRows = pre.executeUpdate();

			if (affectedRows > 0) {
				ResultSet rs = pre.getGeneratedKeys();
				if (rs.next()) {
					int userId = rs.getInt(1);
					System.out.println("Inserted User ID: " + userId);
					this.id = userId;
				}
				rs.close();
			}

			pre.close();
			pre.execute();
		} catch (Exception e) {
		}
	}

	public int getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getImg() {
		return img;
	}

	public static User GetUser(int id) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
		PreparedStatement stm = con.prepareStatement("SELECT id,name,email,password,img FROM users WHERE id = ?");

		stm.setInt(1, id);
		User user = null;
		ResultSet rs = stm.executeQuery();
		if (rs.next()) {

			user = new User(rs.getString("name"), rs.getString("email"), rs.getString("password"));
			user.setId(id);
			user.setImg(rs.getString("img"));
			stm.close();

		}
		return user;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void ChengePassword(String hashedPassword) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp", "root", "");
		PreparedStatement stmt1 = con.prepareStatement("UPDATE users set password=? WHERE id=?");
		stmt1.setString(1, hashedPassword);
		stmt1.setInt(2, this.id);
		stmt1.executeUpdate();
		stmt1.close();
		con.close();

	}

}
