package lk.sliit.carservicemanagementgp99.projectname.manager;

import lk.sliit.carservicemanagementgp99.projectname.model.*;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ServiceManager {
    private List<Service> serviceList;
    private final String filePath;
    private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public ServiceManager(String filePath) {
        this.filePath = filePath;
        this.serviceList = new ArrayList<>();
        loadService();
    }
    public void addService(Service service) {
        serviceList.add(service);
        saveServiceToFile(service);
    }

    public List<Service> getAllServicesSortedByDate() {
        List<Service> sorted = new ArrayList<>(serviceList);
        for(int i = 0; i < sorted.size() - 1; i++) {
            int minIdx = i;
            for(int j = i + 1; j < sorted.size(); j++) {
                if(sorted.get(j).getDate().before(sorted.get(minIdx).getDate())) {
                    minIdx = j;
                }
            }
            Collections.swap(sorted, i, minIdx);
        }
        return sorted;
    }
    private void loadService() {
        serviceList.clear();
        File file = new File(filePath);
        if(!file.exists()) { return; }

        try(BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null){
                String[] parts = line.split(",");
                if(parts.length != 6) continue;
                String type = parts[0];
                String serviceId = parts[1];
                String customerName = parts[2];
                Date date = sdf.parse(parts[3]);
                double cost = Double.parseDouble(parts[4]);
                String status = parts[5];

                Service service;
                if("Regular".equals(type)) {
                    service = new RegularService(serviceId, customerName, date, cost, status);
                } else {
                    service = new MajorRepair(serviceId, customerName, date, cost, status);
                }
                serviceList.add(service);
            }
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
    }
    private void saveServiceToFile(Service service) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            bw.write(service.getServiceType() + "," + service.getServiceId() +
                    "," + service.getCustomerName() + "," + sdf.format(service.getDate()) +
                    "," + service.getCost() + "," + service.getStatus());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public List<Service> getAllServices() {
        return serviceList;
    }
    public void updateServiceStatus(String serviceId, String status) {
        for(Service s : serviceList) {
            if(s.getServiceId().equals(serviceId)) {
                s.setStatus(status);
                break;
            }
        }
        try(BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for(Service s : serviceList) {
                bw.write(s.getServiceType() + "," + s.getServiceId() + "," +
                        s.getCustomerName() + "," + sdf.format(s.getDate()) +
                        s.getCost() + "," + s.getStatus());
                bw.newLine();
            }
        }catch (IOException e) {
            e.printStackTrace();
        }
    }
}
