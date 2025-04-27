package com.cartracker;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/VehicleServlet")
public class VehicleServlet extends HttpServlet {
    private static final String DIRECTORY = "C:\\Users\\user\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\vehicleinfo";
    private static final String VEHICLE_FILE = DIRECTORY + "\\vehicle_data.txt";
    private static final String SERVICE_FILE = DIRECTORY + "\\service_records.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addVehicle".equals(action)) {
            addVehicle(request, response);
        } else if ("addService".equals(action)) {
            addServiceRecord(request, response);
        } else if ("deleteVehicle".equals(action)) {
            deleteVehicle(request, response);
        } else if ("deleteService".equals(action)) {
            deleteServiceRecord(request, response);
        } else if ("updateVehicle".equals(action)) {
            updateVehicle(request, response);
        } else if ("updateService".equals(action)) {
            updateServiceRecord(request, response);
        }
    }

    private void addVehicle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regNumber = request.getParameter("id");
        String owner = request.getParameter("owner");
        String model = request.getParameter("model");
        String type = request.getParameter("type");

        if (regNumber == null || owner == null || model == null || type == null) {
            response.getWriter().write("Invalid input!");
            return;
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(VEHICLE_FILE, true))) {
            writer.write(regNumber + "," + owner + "," + model + "," + type);
            writer.newLine();
        }

        response.sendRedirect("vehicle_list.jsp");
    }


    private void addServiceRecord(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regNumber = request.getParameter("regNumber");
        String description = request.getParameter("description");

        if (regNumber == null || description == null) {
            response.getWriter().write("Invalid input!");
            return;
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(SERVICE_FILE, true))) {
            writer.write(regNumber + "," + description);
            writer.newLine();
        }

        response.sendRedirect("service_history.jsp");
    }


    private void deleteVehicle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regNumberToDelete = request.getParameter("id");
        modifyFile(VEHICLE_FILE, regNumberToDelete, false);
        response.sendRedirect("vehicle_list.jsp");
    }


    private void deleteServiceRecord(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regNumberToDelete = request.getParameter("regNumber");
        modifyFile(SERVICE_FILE, regNumberToDelete, false);
        response.sendRedirect("service_history.jsp");
    }


    private void updateVehicle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regNumber = request.getParameter("id");
        String newOwner = request.getParameter("owner");
        String newModel = request.getParameter("model");
        String newType = request.getParameter("type");

        modifyFile(VEHICLE_FILE, regNumber, true, newOwner, newModel, newType);
        response.sendRedirect("vehicle_list.jsp");
    }


    private void updateServiceRecord(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regNumber = request.getParameter("regNumber");
        String newDescription = request.getParameter("description");

        modifyFile(SERVICE_FILE, regNumber, true, newDescription);
        response.sendRedirect("service_history.jsp");
    }


    private void modifyFile(String filePath, String identifier, boolean isUpdate, String... newValues) throws IOException {
        File inputFile = new File(filePath);
        File tempFile = new File(DIRECTORY + "\\temp_file.txt");

        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while ((line = reader.readLine()) != null) {

                if (line.startsWith(identifier + ",")) {
                    if (isUpdate) {

                        line = identifier + "," + String.join(",", newValues);
                    } else {

                        continue;
                    }
                }
                lines.add(line);
            }
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }

        inputFile.delete();
        tempFile.renameTo(inputFile);
    }
}
