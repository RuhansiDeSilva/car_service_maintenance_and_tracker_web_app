<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Book Service Appointment</title>
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
      background: var(--dark-bg) url('https://www.certifiedmastertech.com/wp-content/uploads/2019/02/9e05cab5bad8e5b48e587d7e6ddf4c71-1024x682.jpeg') no-repeat center center fixed;
      background-size: cover;
      color: var(--white);
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
    .navbar-brand, .nav-link {
      color: var(--white) !important;
    }
    .container.form-container {
      background: rgba(55, 52, 52, 0.5);
      max-width: 600px;
      margin: 2rem auto;
      padding: 2rem;
      border-radius: 12px;
    }
    .form-container h2 {
      text-align: center;
      margin-bottom: 1.5rem;
      color: #fff;
    }
    label {
      color: #fff;
      margin-top: 1rem;
    }
    input, select {
      width: 100%;
      padding: 0.75rem;
      margin-top: 0.5rem;
      margin-bottom: 1rem;
      border-radius: 8px;
      border: 1px solid #ccc;
    }
    input[type="submit"] {
      background-color: var(--primary-red);
      color: #fff;
      border: none;
      cursor: pointer;
    }
    .back-btn {
      margin-top: 1rem;
      display: inline-block;
      background-color: var(--primary-red);
      color: #fff;
      padding: 0.5rem 1rem;
      border-radius: 8px;
      text-decoration: none;
    }
    footer {
      margin-top: auto;
      background-color: var(--card-bg);
      text-align: center;
      padding: 1rem;
      border-top: 3px solid var(--primary-red);
      color: var(--light-gray);
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="fas fa-car me-2"></i>AutoPulse</a>
    <div class="collapse navbar-collapse" id="nav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="book_service.jsp">Book Service</a></li>
        <li class="nav-item"><a class="nav-link" href="appointments.jsp">My Appointments</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container form-container">
  <h2>Book a Service Appointment</h2>
  <form action="BookingServiceServlet" method="post">
    <%--@declare id="name"--%><%--@declare id="vehicletype"--%><%--@declare id="date"--%><%--@declare id="time"--%><label for="name">Name:</label>
    <input type="text" name="name" required>

    <label for="vehicleType">Vehicle Type:</label>
    <input type="text" name="vehicleType" required>

    <label>Service Types:</label>
    <div class="form-check">
      <input class="form-check-input" type="checkbox" name="serviceType" value="Regular Service" id="regularService">
      <label class="form-check-label" for="regularService">Regular Service</label>
    </div>
    <div class="form-check">
      <input class="form-check-input" type="checkbox" name="serviceType" value="Major Repair" id="majorRepair">
      <label class="form-check-label" for="majorRepair">Major Repair</label>
    </div>

    <label for="customService">Custom Service Name:</label>
    <input type="text" name="customService" id="customService" placeholder="e.g., Tire Replacement">

    <label for="date">Appointment Date:</label>
    <input type="date" name="date" required>

    <label for="time">Appointment Time:</label>
    <input type="time" name="time" required>

    <input type="submit" value="Book Appointment">
  </form>
  <a class="back-btn" href="service_appointment.jsp"><i class="bi bi-arrow-left me-1"></i>Back to Home</a>
</div>

<footer>
  <p>© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</p>
</footer>

</body>
</html>
