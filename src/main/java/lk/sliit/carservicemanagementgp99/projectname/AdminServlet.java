package lk.sliit.carservicemanagementgp99.projectname;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private final lk.sliit.carservicemanagementgp99.projectname.StaffManager manager = new lk.sliit.carservicemanagementgp99.projectname.StaffManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            response.sendRedirect("index.jsp?error=Missing+Action");
            return;
        }

        switch (action) {
            case "addStaff" -> {
                handleAddStaff(request);
                response.sendRedirect("add_staff.jsp?success=Staff+Added");
            }
            case "removeStaff" -> {
                handleRemoveStaff(request);
                response.sendRedirect("update_staff_status.jsp?success=Staff+Removed");
            }
            case "updateStatus" -> {
                handleUpdateStatus(request);
                response.sendRedirect("update_staff_status.jsp?success=Status+Updated");
            }
            default -> response.sendRedirect("index.jsp?error=Unknown+Action");
        }
    }

    private void handleAddStaff(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String role = request.getParameter("role");

        if (id == null || name == null || role == null) return;

        Staff staff = switch (role) {
            case "Manager" -> new Manager(id, name);
            case "Technician" -> new Technician(id, name);
            case "Engine Specialist" -> new EngineSpecialist(id, name);
            case "Detailer" -> new Detailer(id, name);
            case "Lot Attendant" -> new LotAttendant(id, name);
            default -> null;
        };

        if (staff != null) {
            manager.addStaff(staff);
        }
    }

    private void handleRemoveStaff(HttpServletRequest request) {
        String id = request.getParameter("id");
        if (id != null) {
            manager.removeStaff(id);
        }
    }

    private void handleUpdateStatus(HttpServletRequest request) {
        String id = request.getParameter("id");
        String status = request.getParameter("status");

        if (id != null && status != null) {
            manager.updateStatus(id, status);
        }
    }
}
