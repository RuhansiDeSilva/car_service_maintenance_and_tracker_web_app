package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.*;

import java.io.IOException;

@WebServlet("/updateCustomer")
public class CustomerUpdateServlet extends HttpServlet {

    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager(); // reloads from file
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User current = (User) session.getAttribute("currentUser");

        if (current == null || !current.getRole().equals("Customer")) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = current.getUsername();
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Create updated Customer object
        Customer updatedCustomer = new Customer(username, password, fullName, email, phone);

        // Update user in file
        userManager.updateUser(updatedCustomer);

        // Update session with new info
        session.setAttribute("currentUser", updatedCustomer);

        response.sendRedirect("customer_dashboard.jsp");
    }
}
