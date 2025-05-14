package lk.sliit.carservicemanagementgp99.projectname;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.file.*;

@WebServlet("/BookingServiceServlet")
public class BookingServiceServlet extends HttpServlet {

    private static final String FILE_PATH = "C:\\Users\\HP\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\booking\\appointments.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String vehicleType = request.getParameter("vehicleType");
        String serviceType = request.getParameter("serviceType");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        String record = name + "," + vehicleType + "," + serviceType + "," + date + "," + time + System.lineSeparator();

        // Ensure directory exists
        Path filePath = Paths.get(FILE_PATH);
        Files.createDirectories(filePath.getParent());

        // Save to file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(record);
        }

        // Redirect to view page
        response.sendRedirect("appointments.jsp");
    }
}

