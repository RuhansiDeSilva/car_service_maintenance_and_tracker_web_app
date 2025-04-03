package lk.sliit.carservicemanagementgp99.projectname.model;

public class ServiceRecord {
    private String serviceId;
    private String vehicleNumber;
    private String date;
    private String description;
    private double cost;

    public ServiceRecord(String serviceId, String vehicleNumber, String date, String description, double cost) {
        this.serviceId = serviceId;
        this.vehicleNumber = vehicleNumber;
        this.date = date;
        this.description = description;
        this.cost = cost;
    }
    public String getServiceId() { return serviceId; }
    public String getVehicleNumber() { return vehicleNumber; }
    public String getDate() { return date; }
    public String getDescription() { return description; }
    public double getCost() { return cost; }

    public void setDescription(String description) { this.description = description;}
    public void setCost(double cost) { this.cost = cost; }

    // Convert object to CSV style string
    public String toString() {
        return serviceId + ", " + vehicleNumber + ", " + date + ", " + description + ", " + cost;
    }
    // Convert CSV style string back to an object
    public static ServiceRecord fromString(String data) {
        String[] parts = data.split(",");
        return new ServiceRecord(parts[0], parts[1], parts[2], parts[3], Double.parseDouble(parts[4]));
    }
}
