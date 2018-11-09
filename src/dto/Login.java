package dto;

public class Login {
	private String user_id;
	private String user_name;
	private String password;
	private int auth;

	public Login(){

	}

	public Login(String user_id, String user_name, String password, int auth) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = password;
		this.auth = auth;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

}