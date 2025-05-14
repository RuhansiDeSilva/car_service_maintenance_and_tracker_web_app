package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
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

        // Validate credentials
        User user = userManager.validateLogin(username, password);

        if (user != null) {
            // Set user session and redirect
            HttpSession session = request.getSession(true);
            session.setAttribute("currentUser", user);
            response.sendRedirect("dashboard");
        } else {
            // Failed login, show error
            request.setAttribute("error", "Invalid username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
