package lk.sliit.carservicemanagementgp99.projectname.model;

public class Invoice {
    private ServiceRecord record;

    public Invoice(ServiceRecord record) {
        this.record = record;
    }
    public String generateInvoice() {
        return "Invoice for Service ID: " + record.getServiceId() + "\n" +
                "Vehicle Number: " + record.getVehicleNumber() + "\n" +
                "Date: " + record.getDate() + "\n" +
                "Description: " + record.getDescription() + "\n" +
                "Cost: $" + record.getCost();
    }
}
