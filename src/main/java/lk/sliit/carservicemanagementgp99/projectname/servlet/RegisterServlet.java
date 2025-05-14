package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.*;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form input and trim
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String fullName = request.getParameter("fullName").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String role = request.getParameter("role").trim();
        String subrole = request.getParameter("subrole") != null ? request.getParameter("subrole").trim() : "";

        // Check for duplicate username
        if (userManager.getUser(username) != null) {
            request.setAttribute("error", "Username already exists!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Write to file manually — avoid UserManager.addUser() if it forces extra comma
        String line;

        if ("Staff".equalsIgnoreCase(role)) {
            line = username + "," + password + "," + fullName + "," + email + "," + phone + "," + role + "," + subrole;
        } else {
            line = username + "," + password + "," + fullName + "," + email + "," + phone + "," + role;
        }

        try {
            java.io.FileWriter fw = new java.io.FileWriter("C:\\Users\\ASUS\\Desktop\\ProjectFile\\users.txt", true);
            java.io.BufferedWriter bw = new java.io.BufferedWriter(fw);
            bw.write(line);
            bw.newLine();
            bw.close();
        } catch (IOException e) {
            request.setAttribute("error", "Error saving user: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        response.sendRedirect("login.jsp");
    }
}
