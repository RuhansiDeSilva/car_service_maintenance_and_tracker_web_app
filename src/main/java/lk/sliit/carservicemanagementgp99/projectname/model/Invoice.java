package lk.sliit.carservicemanagementgp99.projectname.model;

import java.io.Serializable;

public class Invoice implements Serializable {
    private String invoiceID;
    private Service service;
    private double totalAmount;

    public Invoice(String invoiceID, Service service) {
        this.invoiceID = invoiceID;
        this.service = service;
        this.totalAmount = service.getCost();
    }

    public String getInvoiceID() { return invoiceID; }
    public Service getService() { return service; }
    public double getTotalAmount() { return totalAmount; }

    // Convert invoice object to a file string

    public String toFileString() {
        return invoiceID + "," + service.getServiceID() + "," + totalAmount;
    }
}
