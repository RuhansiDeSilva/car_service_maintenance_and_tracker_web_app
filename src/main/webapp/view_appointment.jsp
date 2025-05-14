<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Appointments</title>
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
            font-family: 'Segoe UI', sans-serif;
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

        .container.appointment-container {
            width: 100%;
            max-width: 1000px;
            background: #3a3939;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            margin: 2rem auto;
            z-index: 1;
            color: #333;
        }
        h2 {
            font-size: 1.8rem;
            color: #a10f42;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
        }
        th, td {
            padding: 1rem;
            border: 1px solid #e2e8f0;
            text-align: left;
        }
        th {
            background-color: #f8f9fa;
        }
        tr:hover {
            background-color: #eef2ff;
        }
        .btn {
            padding: 0.5rem 0.8rem;
            margin-right: 5px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.9rem;
        }
        .edit-btn { background-color: #ef4444; color: white; }
        .delete-btn { background-color: #ef4444; color: white; }
        .back-btn {
            display: inline-block;
            background: var(--primary-red);
            color: #fff;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            text-decoration: none;
        }

        footer {
            background-color: var(--card-bg);
            padding: 1.5rem 0;
            text-align: center;
            border-top: 3px solid var(--primary-red);
            margin-top: auto;
        }
        .copyright { margin: 0; color: var(--light-gray); font-size: 0.9rem; }
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

<div class="container appointment-container">
    <h2>My Appointments</h2>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Vehicle</th>
            <th>Service</th>
            <th>Date</th>
            <th>Time</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            String filePath = "C:\\Users\\HP\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\booking\\appointments.txt";
            File file = new File(filePath);
            if (file.exists()) {
                BufferedReader reader = new BufferedReader(new FileReader(file));
                String line;
                int idx = 0;
                while ((line = reader.readLine()) != null) {
                    String[] cols = line.split(",");
        %>
        <tr>
            <td><%= cols[0] %></td>
            <td><%= cols[1] %></td>
            <td><%= cols[2] %></td>
            <td><%= cols[3] %></td>
            <td><%= cols[4] %></td>
            <td>
                <form action="edit_appointment.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="index" value="<%= idx %>">
                    <button type="submit" class="btn edit-btn">Edit</button>
                </form>
                <form action="delete_appointment.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="index" value="<%= idx %>">
                    <button type="submit" class="btn delete-btn">Delete</button>
                </form>
            </td>
        </tr>
        <%
                idx++;
            }
            reader.close();
        } else {
        %>
        <tr><td colspan="6" class="text-center">No appointments found.</td></tr>
        <% } %>
        </tbody>
    </table>
    <a class="back-btn" href="service_appointment.jsp"><i class="bi bi-arrow-left me-1"></i>Back to Home</a>
</div>

<footer>
    <div class="container-fluid">
        <p class="copyright">© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/lucide@latest"></script>
<script>lucide.createIcons();</script>
</body>
</html>
