package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.User;

import java.io.IOException;

@WebServlet("/dashboard")
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
        String role = user.getRole() != null ? user.getRole().trim() : "";
        String subrole = user.getSubrole() != null ? user.getSubrole().trim() : "";

        switch (role.toLowerCase()) {
            case "admin":
                response.sendRedirect("admin_dashboard.jsp");
                break;

            case "customer":
                response.sendRedirect("customer_dashboard.jsp");
                break;

            case "staff":
                if (subrole.equalsIgnoreCase("Service")) {
                    response.sendRedirect("service_staff_dashboard.jsp");
                } else if (subrole.equalsIgnoreCase("Management")) {
                    response.sendRedirect("management_staff_dashboard.jsp");
                } else {
                    // Unknown or missing subrole for staff
                    request.setAttribute("error", "Unrecognized staff subrole.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                break;

            default:
                // Unknown or missing role
                request.setAttribute("error", "Unrecognized user role.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                break;
        }
    }
}