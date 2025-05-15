package lk.sliit.carservicemanagementgp99.projectname.model;

public class Staff extends User {
    public Staff(String username, String password, String fullName, String email, String phone, String subrole) {
        super(username, password, fullName, email, phone, "Staff", subrole);
    }
}
