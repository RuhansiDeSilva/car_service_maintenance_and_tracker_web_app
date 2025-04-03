package lk.sliit.carservicemanagementgp99.projectname;
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

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String action = request.getParameter("action");
            if ("create".equals(action)) {
                String username = request.getParameter("username");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone_number = request.getParameter("phone");
                String password = request.getParameter("password");
                String address = request.getParameter("address");
                String status = request.getParameter("status");
                userService.addUser(new User(username, name, email, phone_number, password, address, status));
            } else if ("update".equals(action)) {
                String username = request.getParameter("username");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone_number = request.getParameter("phone");
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

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            List<User> users = userService.getAllUsers();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body><table border='1'>");
            out.println("<tr><th>Username</th><th>Name</th><th>Email</th><th>Phone</th><th>Address</th><th>Status</th></tr>");
            for (User user : users) {
                out.println("<tr><td>" + user.getUsername() + "</td><td>" + user.getName() + "</td><td>" + user.getEmail() + "</td><td>" + user.getPhone_number() + "</td><td>" + user.getAddress() + "</td><td>" + user.getStatus() + "</td></tr>");
            }
            out.println("</table></body></html>");
        }

    }

