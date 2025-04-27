package lk.sliit.carservicemanagementgp99.projectname.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Service implements Serializable {
    private String serviceID;
    private String customerName;
    private String vehicleNumber;
    private Date serviceDate;
    private String serviceType;
    private double cost;

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public Service(String serviceID, String customerName, String vehicleNumber, Date serviceDate,
                   String serviceType, double cost) {
        this.serviceID = serviceID;
        this.customerName = customerName;
        this.vehicleNumber = vehicleNumber;
        this.serviceDate = serviceDate;
        this.serviceType = serviceType;
        this.cost = cost;
    }
    public String getServiceID() { return serviceID; }
    public String getCustomerName() { return customerName; }
    public String getVehicleNumber() { return vehicleNumber; }
    public Date getServiceDate() { return serviceDate; }
    public String getServiceType() { return serviceType; }
    public double getCost() { return cost; }

    // Convert the service object to a file string
    public String toFileString() {
        return serviceID + "," + customerName + "," + vehicleNumber + "," + dateFormat.format(serviceDate) +
                "," + serviceType + "," + cost;
    }
    // Helper method to parse a date string
    public static Date parseDate(String dateString) throws Exception {
        return dateFormat.parse(dateString);
    }
}
