package lk.sliit.carservicemanagementgp99.projectname;

public class Appointment {
    private String appointmentId;
    private String customerId;
    private String vehicleType;
    private String serviceType;
    private String date;
    private String time;
    private boolean approved;

    public Appointment(String appointmentId, String customerId, String vehicleType,
                       String serviceType, String date, String time) {
        this.appointmentId = appointmentId;
        this.customerId = customerId;
        this.vehicleType = vehicleType;
        this.serviceType = serviceType;
        this.date = date;
        this.time = time;
        this.approved = false; // default not approved
    }

    // Getters
    public String getAppointmentId() { return appointmentId; }
    public String getCustomerId() { return customerId; }
    public String getVehicleType() { return vehicleType; }
    public String getServiceType() { return serviceType; }
    public String getDate() { return date; }
    public String getTime() { return time; }
    public boolean isApproved() { return approved; }

    // Setters
    public void setAppointmentId(String appointmentId) { this.appointmentId = appointmentId; }
    public void setCustomerId(String customerId) { this.customerId = customerId; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }
    public void setServiceType(String serviceType) { this.serviceType = serviceType; }
    public void setDate(String date) { this.date = date; }
    public void setTime(String time) { this.time = time; }
    public void setApproved(boolean approved) { this.approved = approved; }
}
