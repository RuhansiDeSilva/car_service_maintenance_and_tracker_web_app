<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vehicle.vehiclemanagement.VehicleManager, vehicle.vehiclemanagement.Vehicle" %>
<%
    String plate = request.getParameter("numberPlate");
    VehicleManager mgr = new VehicleManager();
    Vehicle v = mgr.getVehicle(plate);
    if (v == null) {
        response.sendRedirect("VehicleServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Edit Vehicle – AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-red: #ff0000;
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
            padding: 0.5rem 1rem;
            margin: 0 0.25rem;
        }

        .nav-link:hover {
            color: var(--primary-red) !important;
        }

        .nav-link.active {
            color: var(--primary-red) !important;
            font-weight: 600;
        }

        .nav-btn {
            border-radius: 30px;
            padding: 0.5rem 1.5rem;
            margin: 0 0.5rem;
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
            padding: 4rem 0;
        }

        .form-box {
            background-color: rgba(26, 26, 26, 0.95);
            border-radius: 10px;
            padding: 2rem;
            max-width: 700px;
            margin: auto;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
            color: var(--light-gray);
        }

        .form-label.required-field::after {
            content: " *";
            color: var(--primary-red);
        }

        .btn-red {
            background-color: var(--primary-red);
            color: var(--white);
            border: none;
            border-radius: 30px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-red:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        .btn-outline-red {
            background-color: transparent;
            color: var(--primary-red);
            border: 2px solid var(--primary-red);
            border-radius: 30px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-outline-red:hover {
            background-color: var(--primary-red);
            color: var(--white);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
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
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-car me-2"></i>AutoPulse
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
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
        <div class="form-box">
            <h2 class="text-center mb-4">Edit Vehicle</h2>
            <form action="VehicleServlet" method="post">
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="originalNumberPlate" value="<%= v.getNumberPlate() %>"/>

                <div class="mb-3">
                    <label class="form-label">Registration Number</label>
                    <input type="text" name="registrationNumber" class="form-control"
                           value="<%= v.getRegistrationNumber() %>" placeholder="Optional"/>
                </div>
                <div class="mb-3">
                    <label class="form-label required-field">Number Plate</label>
                    <input type="text" name="numberPlate" class="form-control" required
                           value="<%= v.getNumberPlate() %>"/>
                </div>
                <div class="mb-3">
                    <label class="form-label required-field">Vehicle Type</label>
                    <input type="text" name="vehicleType" class="form-control" required
                           value="<%= v.getVehicleType() %>"/>
                </div>
                <div class="mb-3">
                    <label class="form-label required-field">Owner</label>
                    <input type="text" name="owner" class="form-control" required
                           value="<%= v.getOwner() %>"/>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label required-field">Mileage</label>
                        <input type="number" name="mileage" class="form-control" required
                               value="<%= v.getMileage() %>"/>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label required-field">Model</label>
                        <input type="text" name="model" class="form-control" required
                               value="<%= v.getModel() %>"/>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label required-field">Year</label>
                        <input type="number" name="year" class="form-control" required
                               value="<%= v.getYear() %>"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label required-field">Appointment Type</label>
                        <select name="appointment" class="form-select" required>
                            <option value="Appointment"   <%= "Appointment".equals(v.getAppointment())?"selected":"" %>>Appointment</option>
                            <option value="Direct"        <%= "Direct".equals(v.getAppointment())?"selected":"" %>>Direct</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label required-field">Service Type</label>
                        <input type="text" name="serviceType" class="form-control" required
                               value="<%= v.getServiceType() %>"/>
                    </div>
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-red">
                        <i class="fas fa-save me-1"></i> Save Changes
                    </button>
                    <a href="VehicleServlet" class="btn btn-outline-red">
                        <i class="fas fa-list me-1"></i> Back to List
                    </a>
                </div>
            </form>
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