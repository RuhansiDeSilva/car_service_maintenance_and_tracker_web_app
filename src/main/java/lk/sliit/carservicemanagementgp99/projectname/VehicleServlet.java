package lk.sliit.carservicemanagementgp99.projectname;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/VehicleServlet")
public class VehicleServlet extends HttpServlet {
    private VehicleManager manager;

    @Override
    public void init() throws ServletException {
        manager = new VehicleManager();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String action = req.getParameter("action");
        String plate  = req.getParameter("numberPlate");

        if ("edit".equals(action) && plate != null) {
            Vehicle v = manager.getVehicle(plate);
            if (v != null) {
                req.setAttribute("vehicle", v);
                req.getRequestDispatcher("updateVehicle.jsp").forward(req, resp);
                return;
            }
        }

        String role = (String) session.getAttribute("role");
        String username = (String) session.getAttribute("username");

        if ("customer".equalsIgnoreCase(role)) {
            List<Vehicle> filtered = manager.getVehicles().stream()
                    .filter(v -> username.equalsIgnoreCase(v.getCustomerUsername()))
                    .collect(Collectors.toList());
            req.setAttribute("vehicles", filtered);
        } else {
            req.setAttribute("vehicles", manager.getVehicles());
        }

        req.getRequestDispatcher("viewVehicles.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            String plate = req.getParameter("numberPlate");
            if (manager.getVehicle(plate) != null) {
                req.setAttribute("plate", plate);
                req.getRequestDispatcher("duplicateError.jsp").forward(req, resp);
                return;
            }
            Vehicle v = formToVehicle(req);
            manager.addVehicle(v);
        } else if ("update".equals(action)) {
            String original = req.getParameter("originalNumberPlate");
            Vehicle v = formToVehicle(req);
            manager.updateVehicle(original, v);
        } else if ("delete".equals(action)) {
            String plate = req.getParameter("numberPlate");
            manager.deleteVehicle(plate);
        }

        resp.sendRedirect(req.getContextPath() + "/VehicleServlet");
    }

    private Vehicle formToVehicle(HttpServletRequest req) {
        String reg  = req.getParameter("registrationNumber");
        String plate = req.getParameter("numberPlate");
        String type  = req.getParameter("vehicleType");
        String owner = req.getParameter("owner");
        int    mil   = Integer.parseInt(req.getParameter("mileage"));
        String model = req.getParameter("model");
        int    yr    = Integer.parseInt(req.getParameter("year"));
        String appt  = req.getParameter("appointment");
        String svc   = req.getParameter("serviceType");
        String username = (String) req.getSession().getAttribute("username");

        return new Vehicle(reg, plate, type, owner, mil, model, yr, appt, svc, username);
    }
}
