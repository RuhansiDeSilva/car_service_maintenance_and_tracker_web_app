package lk.sliit.carservicemanagementgp99.projectname;

import java.io.*;
import java.util.*;

public class StaffManager {
    private static final String STAFF_FILE = "C:\\Users\\pooja\\OneDrive\\Desktop\\staff.txt";

    private final List<Staff> staffList = new ArrayList<>();

    public StaffManager() {
        loadStaff();
    }

    // ===== STAFF MANAGEMENT =====

    public List<Staff> getAllStaff() {
        return staffList;
    }

    public void addStaff(Staff staff) {
        for (Staff s : staffList) {
            if (s.getId().equalsIgnoreCase(staff.getId())) {
                return; // prevent duplicate
            }
        }
        staffList.add(staff);
        saveStaff();
    }

    public void removeStaff(String id) {
        staffList.removeIf(s -> s.getId().equalsIgnoreCase(id));
        saveStaff();
    }

    public void updateStatus(String id, String status) {
        for (Staff s : staffList) {
            if (s.getId().equalsIgnoreCase(id)) {
                s.setStatus(status);
                break;
            }
        }
        saveStaff();
    }

    private void saveStaff() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(STAFF_FILE))) {
            for (Staff s : staffList) {
                writer.write(s.getId() + "," + s.getName() + "," + s.getRole() + "," + s.getStatus());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void loadStaff() {
        staffList.clear();
        File file = new File(STAFF_FILE);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] p = line.split(",");
                if (p.length == 4) {
                    Staff s = switch (p[2]) {
                        case "Manager" -> new Manager(p[0], p[1]);
                        case "Technician" -> new Technician(p[0], p[1]);
                        case "Engine Specialist" -> new EngineSpecialist(p[0], p[1]);
                        case "Detailer" -> new Detailer(p[0], p[1]);
                        case "Lot Attendant" -> new LotAttendant(p[0], p[1]);
                        default -> null;
                    };
                    if (s != null) {
                        s.setStatus(p[3]);
                        staffList.add(s);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
