package lk.sliit.carservicemanagementgp99.projectname;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.file.*;

@WebServlet("/BookingServiceServlet")
public class BookingServiceServlet extends HttpServlet {

    private static final String FILE_PATH = "D:\\car_service_maintenance_and_tracker_web_app\\appointment.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String vehicleType = request.getParameter("vehicleType");
        String[] serviceTypes = request.getParameterValues("serviceType");
        String customService = request.getParameter("customService");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // Combine selected service types + custom
        StringBuilder serviceTypeBuilder = new StringBuilder();

        if (serviceTypes != null) {
            for (String type : serviceTypes) {
                serviceTypeBuilder.append(type).append(" + ");
            }
        }

        if (customService != null && !customService.trim().isEmpty()) {
            serviceTypeBuilder.append("Custom: ").append(customService.trim());
        } else {
            // Remove last " + " if exists
            int len = serviceTypeBuilder.length();
            if (len >= 3 && serviceTypeBuilder.substring(len - 3).equals(" + ")) {
                serviceTypeBuilder.setLength(len - 3);
            }
        }

        String combinedService = serviceTypeBuilder.toString();

        // Create directory if not exists
        Path filePath = Paths.get(FILE_PATH);
        Files.createDirectories(filePath.getParent());

        // Write to file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String record = name + "," + vehicleType + "," + combinedService + "," + date + "," + time + System.lineSeparator();
            writer.write(record);
        }

        // Redirect to view page
        response.sendRedirect("appointments.jsp");
    }
}
