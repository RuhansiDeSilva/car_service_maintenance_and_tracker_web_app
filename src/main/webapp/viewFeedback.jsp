<%@ page language="java" import="java.io.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<html>
<head>
    <title>Feedback Records | Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: url('images/view-feedback-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }
        .container {
            background: rgba(0, 0, 0, 0.85);
            padding: 30px;
            border-radius: 10px;
            margin-top: 50px;
        }
        .table {
            background: white;
            color: black;
        }
    </style>
</head>
<body>

<%
    String role = (String) session.getAttribute("role");
    if (role == null || !"admin".equals(role)) {
        response.sendRedirect("index.jsp?error=Unauthorized access");
        return;
    }

    List<String[]> feedbackList = new ArrayList<>();
    try (BufferedReader reader = new BufferedReader(new FileReader("F:/SLIIT/Y1S2/OOP/Assignment/car_service_maintenance_and_tracker_web_app/feedback.txt"))) {
        String line;
        while ((line = reader.readLine()) != null) {
            feedbackList.add(line.split(",", 4));
        }
    } catch (IOException e) {
        e.printStackTrace();
    }
%>

<div class="container">
    <h2 class="text-center"><i class="fas fa-comments"></i> Submitted Feedback</h2>
    <%
        if (feedbackList.isEmpty()) {
    %>
        <div class="alert alert-warning mt-3 text-center">No feedback found.</div>
    <%
        } else {
    %>
    <table class="table table-striped mt-4">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Rating</th>
                <th>Comments</th>
            </tr>
        </thead>
        <tbody>
            <% for (String[] feedback : feedbackList) { %>
                <tr>
                    <td><%= feedback[0] %></td>
                    <td><%= feedback[1] %></td>
                    <td><%= feedback[2] %> ⭐</td>
                    <td><%= feedback[3] %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <% } %>

    <div class="text-center mt-3">
        <a href="adminDashboard.jsp" class="btn btn-info"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>
</div>

</body>
</html>
