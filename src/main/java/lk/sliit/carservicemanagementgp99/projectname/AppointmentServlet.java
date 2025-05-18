package lk.sliit.carservicemanagementgp99.projectname;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private final AppointmentManager mgr = new AppointmentManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        List<Appointment> all = mgr.loadAll();
        mgr.sortByDateTime(all);

        if ("edit".equals(action)) {
            String id = req.getParameter("id");
            for (Appointment a : all) {
                if (a.getId().equals(id)) {
                    req.setAttribute("appointment", a);
                    break;
                }
            }
        }

        // always expose the full list to the JSP
        req.setAttribute("appointments", all);
        // forward to our single JSP which now contains both table and inline‐edit form
        req.getRequestDispatcher("viewAppointments.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        List<Appointment> all = mgr.loadAll();

        switch (action) {
            case "create":
                Appointment newA = new Appointment(
                        UUID.randomUUID().toString(),
                        req.getParameter("customerId"),
                        req.getParameter("vehicleType"),
                        req.getParameter("serviceType"),
                        req.getParameter("date"),
                        req.getParameter("time"),
                        false
                );
                all.add(newA);
                break;

            case "update":
                String updId = req.getParameter("id");
                for (Appointment a : all) {
                    if (a.getId().equals(updId)) {
                        a.setCustomerId(req.getParameter("customerId"));
                        a.setVehicleType(req.getParameter("vehicleType"));
                        a.setServiceType(req.getParameter("serviceType"));
                        a.setDate(req.getParameter("date"));
                        a.setTime(req.getParameter("time"));
                        break;
                    }
                }
                break;

            case "delete":
                String delId = req.getParameter("id");
                all.removeIf(a -> a.getId().equals(delId));
                break;
        }

        mgr.saveAll(all);
        // redirect back to the GET to show the updated list
        resp.sendRedirect("AppointmentServlet");
    }
}
