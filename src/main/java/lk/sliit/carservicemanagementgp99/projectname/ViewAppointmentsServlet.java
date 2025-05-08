package lk.sliit.carservicemanagementgp99.projectname;


import jakarta.servlet.*;

import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.Appointment;

import java.io.*;
import java.util.*;


public class ViewAppointmentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerId = request.getParameter("customerId");
        List<Appointment> appointments = getAppointmentsForCustomer(customerId);

        // Store the appointments list in request scope
        request.setAttribute("appointments", appointments);

        // Forward the request to appointments.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("appointments.jsp");
        dispatcher.forward(request, response);
    }

    private List<Appointment> getAppointmentsForCustomer(String customerId) {
        List<Appointment> appointments = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\HP\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\Booking\\appointments.txt"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data[1].equals(customerId)) {
                    Appointment appointment = new Appointment(data[0], data[1], data[2], data[3], data[4], data[5]);
                    appointments.add(appointment);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return appointments;
    }
}
