<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vehicle.vehiclemanagement.VehicleManager, java.util.List" %>
<%
    // Load all vehicles
    VehicleManager mgr = new VehicleManager();
    List<?> all = mgr.getVehicles();
    int totalVehicles   = all.size();
    int pendingServices = 0; // Will be implemented with service tracking
    int completedToday  = 0; // Will be implemented with service tracking
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>AutoCare Pro - Vehicle Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-red:  #d92332;
            --dark-red:     #a71d2a;
            --light-gray:   #f8f9fa;
            --dark-gray:    #343a40;
            --black:        #212529;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--black);
            margin: 0;
            padding: 0;
            background-image:
                    linear-gradient(rgba(0,0,0,0.9), rgba(0,0,0,0.9)),
                    url('https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1587&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        .navbar {
            background-color: var(--black) !important;
            border-bottom: 2px solid var(--primary-red);
        }
        .navbar-brand {
            font-weight:700;
            color:white!important;
        }
        .nav-link {
            color:white!important;
            transition: .3s;
        }
        .nav-link:hover {
            color: var(--primary-red)!important;
        }
        .nav-link.active {
            background-color: var(--primary-red);
            border-radius: 5px;
            color: white!important;
        }
        .dashboard-card {
            background:white;
            border-top:4px solid var(--primary-red);
            border-radius:10px;
            box-shadow:0 5px 15px rgba(0,0,0,0.1);
            transition:transform .3s;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
        .stat-card {
            background:white;
            border-left:4px solid var(--primary-red);
            border-radius:8px;
        }
        .stat-number {
            color:var(--primary-red);
            font-weight:700;
        }
        .btn-red {
            background:var(--primary-red);
            color:white;
            border:none;
        }
        .btn-red:hover {
            background:var(--dark-red);
        }
        .btn-outline-red {
            border-color:var(--primary-red);
            color:var(--primary-red);
        }
        .btn-outline-red:hover {
            background:var(--primary-red);
            color:white;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-car me-2"></i>AutoCare Pro
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
                    <a class="nav-link" href="addVehicle.jsp">
                        <i class="fas fa-plus me-1"></i>Add Vehicle
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="VehicleServlet">
                        <i class="fas fa-list me-1"></i>View Vehicles
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <div class="dashboard-card p-4 mb-5">
        <h2 class="text-center mb-3">VEHICLE MANAGEMENT</h2>
        <p class="text-center mb-4">
            Comprehensive tools to manage your vehicle service records
        </p>
        <div class="text-center mb-4">
            <a href="addVehicle.jsp" class="btn btn-red px-4 me-2">
                <i class="fas fa-plus-circle me-1"></i> Add Vehicle
            </a>
            <a href="VehicleServlet" class="btn btn-outline-red px-4">
                <i class="fas fa-tasks me-1"></i> Manage Vehicles
            </a>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="stat-card p-3 h-100">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-car fa-2x me-3 text-muted"></i>
                        <div>
                            <h5 class="mb-0">TOTAL VEHICLES</h5>
                            <h2 class="stat-number mb-0"><%= totalVehicles %></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card p-3 h-100">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-tools fa-2x me-3 text-muted"></i>
                        <div>
                            <h5 class="mb-0">PENDING SERVICES</h5>
                            <h2 class="stat-number mb-0"><%= pendingServices %></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card p-3 h-100">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-check-circle fa-2x me-3 text-muted"></i>
                        <div>
                            <h5 class="mb-0">COMPLETED TODAY</h5>
                            <h2 class="stat-number mb-0"><%= completedToday %></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
