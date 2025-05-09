package lk.sliit.carservicemanagementgp99.projectname;

public class Appointment {
    private String appointmentId;
    private String customerId;
    private String vehicleType;
    private String serviceType;
    private String date;
    private String time;

    public Appointment(String appointmentId, String customerId, String vehicleType,
                       String serviceType, String date, String time) {
        this.appointmentId = appointmentId;
        this.customerId = customerId;
        this.vehicleType = vehicleType;
        this.serviceType = serviceType;
        this.date = date;
        this.time = time;
    }

    public String getAppointmentId() { return appointmentId; }
    public String getCustomerId() { return customerId; }
    public String getVehicleType() { return vehicleType; }
    public String getServiceType() { return serviceType; }
    public String getDate() { return date; }
    public String getTime() { return time; }

    public void setApproved(boolean approve) {
    }

    public String isApproved() {
        return "";
    }
}
