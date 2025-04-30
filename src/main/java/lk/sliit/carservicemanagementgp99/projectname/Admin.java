package test3.admin;

public class Admin {
    private String username;
    private String email;

    public Admin(String username, String email) {
        this.username = username;
        this.email = email;
    }

    public String getUsername() { return username; }
    public String getEmail() { return email; }

    public void setEmail(String email) {
        this.email = email;
    }
}