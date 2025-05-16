package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.*;

import java.io.*;

public class RegisterServlet extends HttpServlet {

    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String fullName = request.getParameter("fullName").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String role = request.getParameter("role").trim();
        String subrole = request.getParameter("subrole") != null ? request.getParameter("subrole").trim() : "";
        String id = request.getParameter("ID") != null ? request.getParameter("id").trim() : "";
        if (userManager.getUser(username) != null) {
            request.setAttribute("error", "Username already exists!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        User user;
        if ("Staff".equalsIgnoreCase(role)) {
            user = new Staff(username, password, fullName, email, phone, subrole,id);
        } else if ("Customer".equalsIgnoreCase(role)) {
            user = new Customer(username, password, fullName, email, phone);
        } else if ("Admin".equalsIgnoreCase(role)) {
            user = new Admin(username, password, fullName, email, phone);
        } else {
            request.setAttribute("error", "Invalid role specified!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        userManager.addUser(user);
        response.sendRedirect("login.jsp");
    }
}