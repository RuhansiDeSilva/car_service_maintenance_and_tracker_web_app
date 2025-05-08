package lk.sliit.carservicemanagementgp99.projectname.model;

public class User {
    protected String username;
    protected String password;
    protected String fullName;
    protected String email;
    protected String phone;
    protected String role;
    protected String subrole;

    public User(String username, String password, String fullName, String email, String phone, String role, String subrole) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.subrole = subrole;
    }


    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getSubrole() { return subrole; }
    public void setSubrole(String subrole) { this.subrole = subrole; }
}
