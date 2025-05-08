<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
<%
    int index = Integer.parseInt(request.getParameter("index"));
    String filePath = "C:\\Users\\HP\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\booking\\appointments.txt";

    List<String> appointments = new ArrayList<>();
    try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
        String line;
        while ((line = reader.readLine()) != null) {
            appointments.add(line);
        }
    }

    String[] parts = appointments.get(index).split(",");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Appointment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-red: #dd0b1d;
            --dark-bg: #000000;
            --card-bg: #1a1a1a;
            --white: #ffffff;
            --light-gray: #e6e6e6;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: var(--dark-bg) url('https://www.certifiedmastertech.com/wp-content/uploads/2019/02/9e05cab5bad8e5b48e587d7e6ddf4c71-1024x682.jpeg') no-repeat center center fixed;
            background-size: cover;
            color: var(--white);
            position: relative;
        }
        body::before {
            content: ''; position: absolute; top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: -1;
        }
        .navbar { background-color: var(--card-bg) !important; border-bottom: 3px solid var(--primary-red); }
        .navbar-brand { font-weight: 700; color: var(--white) !important; font-size: 1.5rem; }
        .nav-link { color: var(--light-gray) !important; padding: 0.5rem 1rem !important; transition: color 0.3s; }
        .nav-link:hover { color: var(--primary-red) !important; }
        .container.confirmation-container { width: 100%; max-width: 500px; margin: 2rem auto; z-index: 1; }
        .confirmation-box {
            background: #ffffff; padding: 2rem; border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1); text-align: center; color: #333;
        }
        .confirmation-box h2 { color: var(--primary-red); margin-bottom: 1rem; }
        .confirmation-box p { font-size: 1rem; margin-bottom: 1.5rem; }
        .appointment-details {
            background: #f9fafb; border: 1px solid #ddd; border-radius: 8px;
            padding: 1rem; margin-bottom: 2rem; text-align: left; color: #444;
        }
        .btn-group { display: flex; justify-content: space-evenly; }
        .btn { padding: 0.6rem 1.2rem; border: none; border-radius: 8px; font-size: 1rem; cursor: pointer; transition: background 0.3s ease; }
        .delete-btn { background: var(--primary-red); color: #fff; }
        .delete-btn:hover { background: #cc0000; }
        .cancel-btn {
            background: var(--light-gray); color: #333; text-decoration: none; display: inline-block; line-height: 1.8;
        }
        .cancel-btn:hover { background: #d1d5db; }
        footer {
            background-color: var(--card-bg); padding: 1.5rem 0;
            text-align: center; border-top: 3px solid var(--primary-red); margin-top: auto;
        }
        footer p { margin: 0; color: var(--light-gray); font-size: 0.9rem; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><i class="fas fa-car me-2"></i>AutoPulse</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="book_service.jsp">Book Service</a></li>
                <li class="nav-item"><a class="nav-link" href="appointments.jsp">My Appointments</a></li>
            </ul>
        </div>
    </div>
</nav>
<main class="container confirmation-container">
    <div class="confirmation-box">
        <h2>Confirm Deletion</h2>
        <p>Are you sure you want to delete this appointment?</p>
        <div class="appointment-details">
            <strong>Name:</strong> <%= parts[0] %><br>
            <strong>Vehicle:</strong> <%= parts[1] %><br>
            <strong>Service:</strong> <%= parts[2] %><br>
            <strong>Date:</strong> <%= parts[3] %><br>
            <strong>Time:</strong> <%= parts[4] %>
        </div>
        <form action="delete_appointment_action.jsp" method="post" class="btn-group">
            <input type="hidden" name="index" value="<%= index %>">
            <button type="submit" class="btn delete-btn">Delete</button>
            <a href="appointments.jsp" class="btn cancel-btn">Cancel</a>
        </form>
    </div>
</main>
<footer>
    <div class="container-fluid">
        <p>© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</p>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/lucide@latest"></script>
<script>lucide.createIcons();</script>
</body>
</html>