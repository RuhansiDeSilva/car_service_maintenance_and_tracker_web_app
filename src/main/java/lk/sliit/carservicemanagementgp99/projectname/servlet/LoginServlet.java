package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.User;
import lk.sliit.carservicemanagementgp99.projectname.model.UserManager;

import java.io.IOException;


public class LoginServlet extends HttpServlet {

    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager(); // Load users from file
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve and sanitize input
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null) username = username.trim();
        if (password != null) password = password.trim();

        // Validate input
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Username and password are required!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Authenticate
        User user = userManager.validateLogin(username, password);

        if (user != null) {
            // Set session
            HttpSession session = request.getSession(true);
            session.setAttribute("currentUser", user);
            session.setAttribute("role", user.getRole());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // Redirect based on role/subrole
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
                    if ("management".equalsIgnoreCase(subrole)) {
                        response.sendRedirect("management_staff_dashboard.jsp");
                    } else if ("service".equalsIgnoreCase(subrole)) {
                        response.sendRedirect("service_staff_dashboard.jsp");
                    } else {
                        request.setAttribute("error", "Unknown staff subrole.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                    break;
                default:
                    request.setAttribute("error", "Unknown user role.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("error", "Invalid username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}