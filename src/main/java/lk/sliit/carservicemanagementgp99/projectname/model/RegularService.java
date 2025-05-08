package lk.sliit.carservicemanagementgp99.projectname.model;

import java.util.Date;

public class RegularService extends Service{
    public RegularService(String serviceId, String customerName, Date date, double cost, String status) {
        super(serviceId, customerName, date, cost, status);
    }
    public String getServiceType() {
        return "Regular";
    }
}
