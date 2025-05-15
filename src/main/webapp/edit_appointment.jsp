<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%
    int index = Integer.parseInt(request.getParameter("index"));
    String filePath = "D:\\car_service_maintenance_and_tracker_web_app\\appointment.txt";
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
    <title>Edit Appointment</title>
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
            color: var(--white);
            background: var(--dark-bg) url('https://www.certifiedmastertech.com/wp-content/uploads/2019/02/9e05cab5bad8e5b48e587d7e6ddf4c71-1024x682.jpeg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: -1;
        }
        .navbar {
            background-color: var(--card-bg) !important;
            border-bottom: 3px solid var(--primary-red);
        }
        .navbar-brand { font-weight: 700; color: var(--white) !important; font-size: 1.5rem; }
        .nav-link { color: var(--light-gray) !important; padding: 0.5rem 1rem !important; transition: color 0.3s; }
        .nav-link:hover { color: var(--primary-red) !important; }
        .nav-btn {
            border-radius: 30px;
            padding: 0.5rem 1rem !important;
            margin-left: 0.5rem;
            transition: all 0.3s;
        }
        .nav-btn.home-btn { background-color: transparent; color: var(--light-gray) !important; border: 2px solid var(--light-gray); }
        .nav-btn.home-btn:hover { background-color: var(--light-gray); color: var(--card-bg) !important; }
        .nav-btn.view-btn { background-color: var(--primary-red); color: var(--white) !important; }
        .nav-btn.view-btn:hover { background-color: #cc0000; }
        .container.form-container {
            background: #2c2b2b;
            padding: 2rem;
            border-radius: 12px;
            width: 100%; max-width: 500px;
            margin: 2rem auto;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            z-index: 1;
            color: #333;
        }
        .container.form-container h2 {
            font-size: 1.8rem;
            text-align: center;
            margin-bottom: 1.5rem;
            color: #ffffff;
            text-transform: uppercase;
        }
        .container.form-container label { font-weight: 600; margin-bottom: 0.3rem; display: block; color: #ffffff; }
        .container.form-container input[type="text"],
        .container.form-container input[type="date"],
        .container.form-container input[type="time"] {
            width: 100%;
            padding: 0.6rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1.5rem;
        }
        .btn-submit {
            background-color: var(--primary-red);
            color: #fff;
            border: none;
            padding: 0.7rem 1.2rem;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn-submit:hover { background-color: #cc0000; }
        .back-link {
            color: var(--primary-red);
            text-decoration: none;
            font-weight: 500;
        }
        .back-link:hover { color: #cc0000; }
        footer {
            margin-top: auto;
            background-color: var(--card-bg);
            padding: 1.5rem 0;
            text-align: center;
            border-top: 3px solid var(--primary-red);
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
                <li class="nav-item">
                    <a class="nav-link nav-btn home-btn" href="service_appointment.jsp">
                        <i class="fas fa-home me-1"></i>Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-btn view-btn" href="appointments.jsp">
                        <i class="fas fa-list me-1"></i>View Appointments
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container form-container">
    <h2>Edit Appointment</h2>
    <form action="update_appointment.jsp" method="post">
        <%--@declare id="name"--%><%--@declare id="vehicle"--%><%--@declare id="service"--%><%--@declare id="date"--%><%--@declare id="time"--%><input type="hidden" name="index" value="<%= index %>">
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= parts[0] %>" required>
        <label for="vehicle">Vehicle Type:</label>
        <input type="text" name="vehicle" value="<%= parts[1] %>" required>
        <label for="service">Service Type:</label>
        <input type="text" name="service" value="<%= parts[2] %>" required>
        <label for="date">Appointment Date:</label>
        <input type="date" name="date" value="<%= parts[3] %>" required>
        <label for="time">Appointment Time:</label>
        <input type="time" name="time" value="<%= parts[4] %>" required>
        <div class="btn-group">
            <button type="submit" class="btn-submit">Update Appointment</button>
            <a href="appointments.jsp" class="back-link">← Back</a>
        </div>
    </form>
</div>
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