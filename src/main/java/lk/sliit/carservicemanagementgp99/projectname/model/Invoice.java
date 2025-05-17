package lk.sliit.carservicemanagementgp99.projectname.model;

import java.util.ArrayList;
import java.util.List;

public class Invoice {
    private String invoiceId;
    private String customerName;
    private String serviceId;
    private double baseAmount;
    private String specificServiceType;
    private List<AdditionalCostItem> additionalCosts;

    public Invoice(String invoiceId, String customerName, String serviceId, double baseAmount, String specificServiceType) {
        this.invoiceId = invoiceId;
        this.customerName = customerName;
        this.serviceId = serviceId;
        this.baseAmount = baseAmount;
        this.specificServiceType = specificServiceType;
        this.additionalCosts = new ArrayList<>();
    }

    public String getInvoiceId() { return invoiceId; }
    public String getCustomerName() { return customerName; }
    public String getServiceId() { return serviceId; }
    public double getBaseAmount() { return baseAmount; }
    public List<AdditionalCostItem> getAdditionalCosts() { return additionalCosts; }
    public String getSpecificServiceType() { return specificServiceType; }

    public void setAdditionalCost(AdditionalCostItem item) {
        this.additionalCosts.add(item);
    }
    public void setSpecificServiceType(String specificServiceType) { this.specificServiceType = specificServiceType; }

    public double getTotalAmount() {
        double total = baseAmount;
        for(AdditionalCostItem item : additionalCosts) {
            total += item.getAmount();
        }
        return total;
    }
    public void addAdditionalCost(String name, double amount) {
        this.additionalCosts.add(new AdditionalCostItem(name, amount));
    }
}


