package lk.sliit.carservicemanagementgp99.projectname;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {

    private static final String FILE_PATH = "F:/SLIIT/Y1S2/OOP/Assignment/car_service_maintenance_and_tracker_web_app/feedback.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String rating = request.getParameter("rating");
        String comments = request.getParameter("comments").trim().replaceAll("[\\r\\n]+", " ");

        // Append feedback to file
        try (PrintWriter writer = new PrintWriter(new FileWriter(FILE_PATH, true))) {
            writer.println(name + "," + email + "," + rating + "," + comments);
        }

        // Redirect to thank-you or dashboard
        response.sendRedirect("feedback.jsp?success=true");
    }
}
