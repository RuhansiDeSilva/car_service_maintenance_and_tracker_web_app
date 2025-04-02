package lk.sliit.carservicemanagementgp99.projectname;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

    @WebServlet("/UserServlet")
    public class UserServlet extends HttpServlet {
        private final UserService userService = new UserService();

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");

            if ("create".equals(action)) {
                String username = request.getParameter("username");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone_number = request.getParameter("phone number");
                String password = request.getParameter("password");
                String address = request.getParameter("address");
                String status = request.getParameter("status");
                userService.addUser(new User(username, name, email, phone_number, password, address, status));
            } else if ("update".equals(action)) {
                String username = request.getParameter("username");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone_number  = request.getParameter("phone number");
                String password = request.getParameter("password");
                String address = request.getParameter("address");
                String status = request.getParameter("status");
                userService.updateUser(username, name, email, phone_number, password, address, status);
            } else if ("delete".equals(action)) {
                String username = request.getParameter("username");
                userService.deleteUser(username);
            }
            response.sendRedirect("user_management.jsp");
        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<User> users = userService.getAllUsers();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            for (User user : users) {
                out.println(user.toString() + "<br>");
            }
        }
    }

