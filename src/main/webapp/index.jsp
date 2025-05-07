<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vehicle.vehiclemanagement.VehicleManager, java.util.List" %>
<%
    VehicleManager mgr = new VehicleManager();
    List<?> all = mgr.getVehicles();
    int totalVehicles = all.size();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>AutoPulse - Vehicle Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-red: #dd0b1d;
            --dark-bg: #000000;
            --card-bg: #1a1a1a;
            --white: #ffffff;
            --light-gray: #e6e6e6;
        }

        body {
            font-family: 'Arial', sans-serif;
            color: var(--white);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: var(--dark-bg) url('https://quickcarvaluation.com/wp-content/uploads/2018/02/Vehicle-Repair-Centers.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: -1;
        }

        .navbar {
            background-color: var(--card-bg) !important;
            border-bottom: 3px solid var(--primary-red);
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--white) !important;
            font-size: 1.5rem;
        }

        .nav-link {
            color: var(--light-gray) !important;
            font-weight: 500;
            transition: all 0.3s;
            position: relative;
            padding: 0.5rem 1rem !important;
            margin: 0 0.25rem !important;
        }

        .nav-link:hover {
            color: var(--primary-red) !important;
        }

        .nav-link.active {
            color: var(--primary-red) !important;
            font-weight: 600;
        }

        /* New styles for beautiful nav buttons */
        .nav-btn {
            border-radius: 30px;
            padding: 0.5rem 1.5rem !important;
            margin: 0 0.5rem !important;
            transition: all 0.3s ease;
        }

        .nav-btn.add-btn {
            background-color: var(--primary-red);
            color: white !important;
        }

        .nav-btn.view-btn {
            border: 2px solid var(--primary-red);
            color: var(--primary-red) !important;
        }

        .nav-btn.add-btn:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        .nav-btn.view-btn:hover {
            background-color: var(--primary-red);
            color: white !important;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        .main-content {
            flex: 1;
            padding: 2rem 0;
        }

        .hero-section {
            text-align: center;
            margin-bottom: 4rem;
            padding: 4rem 2rem;
        }

        .hero-title {
            font-size: 4rem;
            font-weight: 700;
            color: var(--white);
            margin-bottom: 1rem;
            line-height: 1.2;
            text-transform: uppercase;
        }

        .hero-title span {
            display: block;
        }

        .red-text {
            color: var(--primary-red);
        }

        .hero-subtitle {
            font-size: 1.5rem;
            color: var(--light-gray);
            margin-bottom: 2rem;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .action-buttons {
            margin-bottom: 2rem;
        }

        .btn-red {
            background-color: var(--primary-red);
            color: var(--white);
            border: none;
            font-weight: 600;
            padding: 0.75rem 2rem;
            transition: all 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 0 10px;
        }

        .btn-red:hover {
            background-color: #cc0000;
            color: var(--white);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        .btn-outline-red {
            background-color: transparent;
            color: var(--primary-red);
            border: 2px solid var(--primary-red);
            font-weight: 600;
            padding: 0.75rem 2rem;
            transition: all 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 0 10px;
        }

        .btn-outline-red:hover {
            background-color: var(--primary-red);
            color: var(--white);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        .stats-container {
            margin: 4rem auto;
            max-width: 300px;
        }

        .stat-card {
            background-color: rgba(26, 26, 26, 0.8);
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            border-top: 4px solid var(--primary-red);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(255, 0, 0, 0.4);
        }

        .stat-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--light-gray);
            margin-bottom: 1rem;
            text-transform: uppercase;
        }

        .stat-value {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-red);
        }

        footer {
            background-color: var(--card-bg);
            color: var(--white);
            padding: 1.5rem 0;
            text-align: center;
            border-top: 3px solid var(--primary-red);
        }

        .copyright {
            margin: 0;
            font-size: 0.9rem;
            color: var(--light-gray);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-car me-2"></i>AutoPulse
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">
                        <i class="fas fa-home me-1"></i>Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-btn add-btn" href="addVehicle.jsp">
                        <i class="fas fa-plus me-1"></i>Add Vehicle
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-btn view-btn" href="VehicleServlet">
                        <i class="fas fa-list me-1"></i>View Vehicles
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="main-content">
    <div class="container">
        <div class="hero-section">
            <h1 class="hero-title">
                <span>WE'VE GOT CAR CARE</span>
                <span class="red-text">DOWN TO</span>
                <span class="red-text">A SCIENCE</span>
            </h1>
            <p class="hero-subtitle">Vehicle Management for Admin & Staff</p>

            <div class="action-buttons">
                <a href="addVehicle.jsp" class="btn btn-red">
                    <i class="fas fa-plus-circle me-1"></i> Add Vehicle
                </a>
                <a href="VehicleServlet" class="btn btn-outline-red">
                    <i class="fas fa-tasks me-1"></i> Manage Vehicles
                </a>
            </div>
        </div>

        <div class="stats-container">
            <div class="stat-card">
                <h2 class="stat-title">TOTAL VEHICLES</h2>
                <p class="stat-value"><%= totalVehicles %></p>
            </div>
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <p class="copyright">© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
