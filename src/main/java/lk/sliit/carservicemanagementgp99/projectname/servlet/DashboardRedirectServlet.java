package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.sliit.carservicemanagementgp99.projectname.model.User;

import java.io.IOException;

public class DashboardRedirectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("currentUser");

        // Ensure trimming to prevent issues from extra spaces in users.txt
        String role = user.getRole() != null ? user.getRole().trim() : "";
        String subrole = user.getSubrole() != null ? user.getSubrole().trim() : "";

        if (role.equalsIgnoreCase("Admin")) {
            response.sendRedirect("admin_dashboard.jsp");
        } else if (role.equalsIgnoreCase("Customer")) {
            response.sendRedirect("customer_dashboard.jsp");
        } else if (role.equalsIgnoreCase("Staff")) {
            if (subrole.equalsIgnoreCase("Service")) {
                response.sendRedirect("service_staff_dashboard.jsp");
            } else if (subrole.equalsIgnoreCase("Management")) {
                response.sendRedirect("management_staff_dashboard.jsp");
            } else {
                response.sendRedirect("error.jsp"); // Unknown staff type
            }
        } else {
            response.sendRedirect("error.jsp"); // Unknown role
        }
    }
}
