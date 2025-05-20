package lk.sliit.carservicemanagementgp99.projectname.model;

import java.io.Serializable;

/**
 * Base class for all users in the system.
 * Now includes department, subrole, and id for Staff/Admin,
 * and defaults to empty strings for Customer.
 */
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    protected String username;
    protected String password;
    protected String fullName;
    protected String email;
    protected String phone;

    protected String role;
    protected String department;  // e.g. "Management" or "Service"
    protected String subrole;     // e.g. "Technician", "Manager"
    protected String id;          // Staff or Admin ID

    /**
     * @param username   unique login name
     * @param password   hashed or plaintext password
     * @param fullName   user's display name
     * @param email      contact email
     * @param phone      contact phone
     * @param role       "Customer", "Staff", or "Admin"
     * @param department for Staff/Admin: their department; for Customer: ""
     * @param subrole    for Staff/Admin: their sub-role; for Customer: ""
     * @param id         for Staff/Admin: their staff/admin ID; for Customer: ""
     */
    public User(String username,
                String password,
                String fullName,
                String email,
                String phone,
                String role,
                String department,
                String subrole,
                String id) {
        this.username   = username;
        this.password   = password;
        this.fullName   = fullName;
        this.email      = email;
        this.phone      = phone;
        this.role       = role;
        this.department = department;
        this.subrole    = subrole;
        this.id         = id;
    }

    // --- Getters & Setters ---

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

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getSubrole() { return subrole; }
    public void setSubrole(String subrole) { this.subrole = subrole; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
}
