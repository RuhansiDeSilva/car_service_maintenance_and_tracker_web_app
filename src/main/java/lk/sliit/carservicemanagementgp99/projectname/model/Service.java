package lk.sliit.carservicemanagementgp99.projectname.model;

import java.util.Date;

public abstract class Service {
    private String serviceId;
    private String customerName;
    private Date date;
    private double cost;
    protected String status;

    public Service(String serviceId, String customerName, Date date, double cost, String status) {
        this.serviceId = serviceId;
        this.customerName = customerName;
        this.date = date;
        this.cost = cost;
        this.status = status;
    }
    // Getters
    public String getServiceId() { return serviceId; }
    public String getCustomerName() { return customerName; }
    public Date getDate() { return date; }
    public double getCost() { return cost; }
    //public String getType() {
        //return this.getClass().getSimpleName();
    //}
    public String getFormattedDate() {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(this.date);
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public abstract String getServiceType();
}
