package lk.sliit.carservicemanagementgp99.projectname.model;


public class Invoice {
    private String invoiceId;
    private String customerName;
    private String serviceId;
    private double amount;

    public Invoice(String invoiceId, String customerName, String serviceId, double amount) {
        this.invoiceId = invoiceId;
        this.customerName = customerName;
        this.serviceId = serviceId;
        this.amount = amount;
    }

    public String getInvoiceId() { return invoiceId; }
    public String getCustomerName() { return customerName; }
    public String getServiceId() { return serviceId; }
    public double getAmount() { return amount; }

}
