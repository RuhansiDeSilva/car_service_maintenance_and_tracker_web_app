package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.*;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1. Gather & trim
        String username = trim(req.getParameter("username"));
        String password = trim(req.getParameter("password"));
        String fullName = trim(req.getParameter("fullName"));
        String email    = trim(req.getParameter("email"));
        String phone    = trim(req.getParameter("phone"));
        String role     = trim(req.getParameter("role"));

        // 2. Required checks
        if (anyEmpty(username, password, fullName, email, phone, role)) {
            req.setAttribute("error", "All basic fields are required.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // 3. No dup usernames
        if (userManager.getUser(username) != null) {
            req.setAttribute("error", "That username is already taken.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        User newUser;
        if ("Staff".equalsIgnoreCase(role)) {
            // staff fields:
            String dept    = trim(req.getParameter("department"));     // "management" or "service"
            String subrole = trim(req.getParameter("subrole"));
            String id      = trim(req.getParameter("id"));

            if (dept.isEmpty() || subrole.isEmpty() || id.isEmpty()) {
                req.setAttribute("error", "You must select department, sub-role and enter staff ID.");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
                return;
            }

            // instantiate with exactly the subrole they chose:
            newUser = new Staff(username, password, fullName, email, phone, subrole, id);

        } else if ("Customer".equalsIgnoreCase(role)) {
            newUser = new Customer(username, password, fullName, email, phone);
        } else if ("Admin".equalsIgnoreCase(role)) {
            newUser = new Admin(username, password, fullName, email, phone);
        } else {
            req.setAttribute("error", "Invalid role selection.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // 4. Save & redirect
        userManager.addUser(newUser);
        resp.sendRedirect("login.jsp");
    }

    // === helpers ===
    private String trim(String s) {
        return s == null ? "" : s.trim();
    }
    private boolean anyEmpty(String... ss) {
        for (String s : ss) if (s.isEmpty()) return true;
        return false;
    }
}
