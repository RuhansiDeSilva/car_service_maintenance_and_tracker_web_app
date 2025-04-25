package com.cartracker;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleManager {
    private List<Vehicle> vehicles;
    private static final String DIRECTORY = "C:\\Users\\user\\OneDrive\\Desktop\\vehicleinfo";
    private static final String VEHICLE_FILE = DIRECTORY + "\\vehicle_data.txt";
    private static final String SERVICE_FILE = DIRECTORY + "\\service_records.txt";

    public VehicleManager() {
        vehicles = new ArrayList<>();
        ensureDirectoryExists();
        loadVehicles();
    }

    // Ensure directory exists
    private void ensureDirectoryExists() {
        File dir = new File(DIRECTORY);
        if (!dir.exists()) {
            dir.mkdirs();
        }
    }

    // Add a new vehicle
    public void addVehicle(Vehicle vehicle) {
        vehicles.add(vehicle);
        saveVehicleToFile(vehicle); // Save ONLY new vehicle
    }

    // Add a service record
    public void addServiceRecord(String regNumber, String serviceDetail) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(SERVICE_FILE, true))) {
            writer.write(regNumber + "," + serviceDetail);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Save only the NEW vehicle (instead of overwriting all)
    private void saveVehicleToFile(Vehicle vehicle) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(VEHICLE_FILE, true))) {
            writer.write(vehicle.getRegNumber() + "," + vehicle.getOwner());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Load all vehicles from file
    private void loadVehicles() {
        File file = new File(VEHICLE_FILE);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(VEHICLE_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 2) {
                    vehicles.add(new Vehicle(data[0], data[1]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Get all vehicles
    public List<Vehicle> getVehicles() {
        return vehicles;
    }
}