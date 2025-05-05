package lk.sliit.carservicemanagementgp99.projectname.model;

import java.util.Date;

public abstract class Service {
    private String serviceId;
    private String customerName;
    private Date date;
    private double cost;

    public Service(String serviceId, String customerName, Date date, double cost) {
        this.serviceId = serviceId;
        this.customerName = customerName;
        this.date = date;
        this.cost = cost;
    }
    // Getters
    public String getServiceId() { return serviceId; }
    public String getCustomerName() { return customerName; }
    public Date getDate() { return date; }
    public double getCost() { return cost; }

    public abstract String getServiceType();
}
