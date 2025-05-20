package lk.sliit.carservicemanagementgp99.projectname.model;

/**
 * A Staff user has role = "Staff" and must supply department, sub-role, and staff ID.
 */
public class Staff extends User {
    /**
     * @param username   unique login name
     * @param password   user password
     * @param fullName   display name
     * @param email      contact email
     * @param phone      contact phone
     * @param department e.g. "Management" or "Service"
     * @param subrole    e.g. "Technician", "Manager"
     * @param id         staff identifier
     */
    public Staff(String username,
                 String password,
                 String fullName,
                 String email,
                 String phone,
                 String department,
                 String subrole,
                 String id) {
        super(
                username,
                password,
                fullName,
                email,
                phone,
                "Staff",     // role
                department,  // department
                subrole,     // sub-role
                id           // staff ID
        );
    }
}
