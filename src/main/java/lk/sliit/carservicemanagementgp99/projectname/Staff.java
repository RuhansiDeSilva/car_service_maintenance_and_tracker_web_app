package lk.sliit.carservicemanagementgp99.projectname;

public abstract class Staff {
    protected String id;
    protected String name;
    protected String role;
    private String status;
    public Staff(String id, String name, String role) {
        this.id = id;
        this.name = name;
        this.role = role;
        this.status = "Available";
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getRole() { return role; }
    public String getStatus() { return status; }

    public void setStatus(String status) {
        this.status = status;
    }
}

