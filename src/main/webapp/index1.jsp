<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.VehicleManager,
                 lk.sliit.carservicemanagementgp99.projectname.Vehicle,
                 java.util.List" %>
<%
    VehicleManager mgr = new VehicleManager();
    List<Vehicle> all = mgr.getVehicles();
    int totalVehicles = all.size();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoPulse - Vehicle Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-red: #dd0b1d;
            --dark-bg: #000;
            --card-bg: #1a1a1a;
            --white: #ffffff;
            --light-gray: #e6e6e6;
        }
        
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            flex-direction: column;
            color: var(--white);
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
            background: rgba(0,0,0,0.7);
            z-index: -1;
        }
        
        .navbar {
            background-color: var(--card-bg) !important;
            border-bottom: 3px solid var(--primary-red);
            padding: 0.8rem 0;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--white) !important;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
        }

        .navbar-brand i {
            margin-right: 0.5rem;
        }

        .nav-link {
            color: var(--light-gray) !important;
            font-weight: 500;
            padding: 0.5rem 1rem !important;
            margin: 0 0.25rem !important;
            transition: all 0.3s;
            display: flex;
            align-items: center;
        }

        .nav-link:hover,
        .nav-link.active {
            color: var(--primary-red) !important;
        }

        .nav-btn {
            border-radius: 30px;
            padding: 0.5rem 1.5rem !important;
            margin: 0 0.5rem !important;
            transition: all 0.3s ease;
        }

        .add-btn {
            background-color: var(--primary-red);
            color: var(--white) !important;
        }

        .view-btn {
            border: 2px solid var(--primary-red);
            color: var(--primary-red) !important;
        }

        .add-btn:hover,
        .view-btn:hover {
            background-color: #cc0000;
            color: var(--white) !important;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,0,0,0.4);
        }
        
        .main-content {
            flex: 1 0 auto;
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
            line-height: 1.2;
            text-transform: uppercase;
            margin-bottom: 1.5rem;
        }

        .hero-title .red-text {
            color: var(--primary-red);
        }

        .hero-subtitle {
            font-size: 1.5rem;
            color: var(--light-gray);
            margin-bottom: 2rem;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .btn-red {
            background-color: var(--primary-red);
            color: var(--white);
            border: none;
            font-weight: 600;
            padding: 0.75rem 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 0 10px;
            transition: all 0.3s;
        }

        .btn-outline-red {
            background: transparent;
            color: var(--primary-red);
            border: 2px solid var(--primary-red);
            font-weight: 600;
            padding: 0.75rem 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 0 10px;
            transition: all 0.3s;
        }

        .btn-red:hover,
        .btn-outline-red:hover {
            background-color: var(--primary-red);
            color: var(--white);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,0,0,0.4);
        }

        .stats-container {
            max-width: 300px;
            margin: 4rem auto;
        }

        .stat-card {
            background: rgba(26,26,26,0.8);
            border-radius: 10px;
            padding: 1.5rem;
            text-align: center;
            border-top: 4px solid var(--primary-red);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(255,0,0,0.4);
        }

        .stat-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--light-gray);
            text-transform: uppercase;
            margin-bottom: 1rem;
        }

        .stat-value {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-red);
        }
        
        .footer-section {
            background: var(--card-bg) !important;
            border-top: 3px solid var(--primary-red);
            padding: 3rem 0 1.5rem;
        }

        .footer-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--white);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .footer-title i {
            color: var(--primary-red);
            margin-right: 0.75rem;
        }

        .footer-text {
            color: var(--light-gray);
            font-size: 0.95rem;
            line-height: 1.7;
            margin-bottom: 1.5rem;
        }

        .footer-heading {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--white);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .footer-heading i {
            color: var(--primary-red);
            margin-right: 0.75rem;
        }

        .footer-heading::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 2px;
            background: var(--primary-red);
        }

        .footer-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-list li {
            margin-bottom: 0.75rem;
            transition: all 0.3s;
        }

        .footer-list li a {
            color: var(--light-gray);
            text-decoration: none;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            transition: all 0.3s;
            padding: 0.25rem 0;
        }

        .footer-list li a i {
            color: var(--primary-red);
            margin-right: 0.75rem;
            transition: all 0.3s;
            width: 20px;
            text-align: center;
        }

        .footer-list li:hover {
            transform: translateX(5px);
        }

        .footer-list li:hover a {
            color: var(--primary-red);
        }

        .footer-list li:hover a i {
            transform: rotate(90deg);
        }

        .footer-contact {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-contact li {
            margin-bottom: 1rem;
            display: flex;
            align-items: flex-start;
        }

        .footer-contact i {
            color: var(--primary-red);
            margin-top: 0.25rem;
            margin-right: 0.75rem;
            min-width: 20px;
            text-align: center;
            transition: all 0.3s;
        }

        .footer-contact span {
            color: var(--light-gray);
            font-size: 0.95rem;
            line-height: 1.5;
        }

        .footer-contact li:hover i {
            transform: scale(1.2);
        }

        .footer-bottom {
            color: var(--light-gray);
            font-size: 0.85rem;
            padding-top: 1.5rem;
            margin-top: 2rem;
            border-top: 1px solid rgba(255,255,255,0.1);
        }
        
        @media (max-width: 991.98px) {
            .hero-title {
                font-size: 3rem;
            }

            .hero-subtitle {
                font-size: 1.25rem;
            }

            .footer-section {
                text-align: center;
            }

            .footer-heading {
                justify-content: center;
            }

            .footer-heading::after {
                left: 50%;
                transform: translateX(-50%);
            }

            .footer-list li a {
                justify-content: center;
            }

            .footer-contact li {
                justify-content: center;
            }
        }

        @media (max-width: 767.98px) {
            .hero-title {
                font-size: 2.5rem;
            }

            .btn-red,
            .btn-outline-red {
                display: block;
                width: 80%;
                margin: 0.75rem auto;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-car"></i>AutoPulse
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
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
                <span>WE'VE GOT CAR CARE</span><br>
                <span class="red-text">DOWN TO</span><br>
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

<footer class="footer-section bg-dark text-white">
    <div class="container">
        <div class="row g-4">
           
            <div class="col-lg-4 col-md-6">
                <h3 class="footer-title">
                    <i class="fas fa-car"></i>AutoPulse Admin
                </h3>
                <p class="footer-text">
                    Comprehensive vehicle management system for administrators.
                    Monitor, manage, and maintain all vehicle details and service operations.
                </p>
            </div>

            
            <div class="col-lg-4 col-md-6">
                <h4 class="footer-heading">
                    <i class="fas fa-link"></i>Quick Links
                </h4>
                <ul class="footer-list">
                    <li>
                        <a href="VehicleServlet">
                            <i class="fas fa-chevron-right"></i>Vehicle Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="addVehicle.jsp">
                            <i class="fas fa-chevron-right"></i>Add New Vehicle
                        </a>
                    </li>
                    <li>
                        <a href="viewVehicles.jsp">
                            <i class="fas fa-chevron-right"></i>View Added Vehicles
                        </a>
                    </li>
                </ul>
            </div>
            
            <div class="col-lg-4 col-md-12">
                <h4 class="footer-heading">
                    <i class="fas fa-headset"></i>Admin Support
                </h4>
                <ul class="footer-contact">
                    <li>
                        <i class="fas fa-envelope"></i>
                        <span>admin@autopulse.com</span>
                    </li>
                    <li>
                        <i class="fas fa-phone"></i>
                        <span>011-1122467</span>
                    </li>
                    <li>
                        <i class="fas fa-clock"></i>
                        <span>24/7 Monitoring</span>
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="footer-bottom text-center">
            <p class="mb-0">&copy; 2025 AutoPulse Vehicle Management. Designed by PGNO 99</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
