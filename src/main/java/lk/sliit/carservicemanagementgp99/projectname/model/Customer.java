package lk.sliit.carservicemanagementgp99.projectname.model;

/**
 * A Customer is a User with role = "Customer".
 * Department, subRole and id are unused for customers, so we pass empty strings.
 */
public class Customer extends User {
    public Customer(String username,
                    String password,
                    String fullName,
                    String email,
                    String phone) {
        super(
                username,
                password,
                fullName,
                email,
                phone,
                "Customer",  // role
                "",          // department (not used)
                "",          // subRole (not used)
                ""           // id         (not used)
        );
    }
}
