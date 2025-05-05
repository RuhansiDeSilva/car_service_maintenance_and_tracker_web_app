package lk.sliit.carservicemanagementgp99.projectname.model;

import java.util.Date;

public class MajorRepair extends Service {
    public MajorRepair(String serviceId, String customerName, Date date, double amount) {
        super(serviceId, customerName, date, amount);
    }
    public String getServiceType() {
        return "Major Repair";
    }
}
