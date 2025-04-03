package lk.sliit.carservicemanagementgp99.projectname;
import java.io.Serializable;

public class User implements Serializable {
    private String username;
    private String name;
    private String email;
    private String phone_number;
    private String address;
    private String password;
    private String status;

    public User(String username, String name, String email, String phone_number, String address, String password, String status) {
        this.username=username;
        this.name = name;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.password = password;
        this.status = status;

    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
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
    public String getPhone_number() {
        return phone_number;
    }
    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public String toString() {
        return username + "," + name + "," + email + "," + phone_number + "," + address + "," + password + "," + status;
    }


}
