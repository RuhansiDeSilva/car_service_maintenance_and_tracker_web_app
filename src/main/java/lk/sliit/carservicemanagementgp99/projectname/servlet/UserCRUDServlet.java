package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.*;

import java.io.IOException;

public class UserCRUDServlet extends HttpServlet {

    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = request.getParameter("username");

        if ("delete".equalsIgnoreCase(action)) {
            userManager.deleteUser(username);
        } else if ("update".equalsIgnoreCase(action)) {
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String subrole = request.getParameter("subrole");

            User updatedUser;
            if ("Customer".equalsIgnoreCase(role)) {
                updatedUser = new Customer(username, password, fullName, email, phone);
            } else if ("Staff".equalsIgnoreCase(role)) {
                updatedUser = new Staff(username, password, fullName, email, phone, subrole);
            } else {
                updatedUser = new Admin(username, password, fullName, email, phone);
            }
            userManager.updateUser(updatedUser);
        }

        response.sendRedirect("admin_dashboard.jsp");
    }
}
