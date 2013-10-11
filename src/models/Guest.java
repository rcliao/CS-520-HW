package models;

public class Guest {
	
	private String name;
	private String email;
	private boolean respond;
	
	// setters / getters
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean getRespond() {
		return respond;
	}
	public void setRespond(boolean respond) {
		this.respond = respond;
	}
}
