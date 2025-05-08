<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    .nav-link { color: var(--light-gray) !important; transition: color 0.3s; padding: 0.5rem 1rem !important; }
    .nav-link:hover { color: var(--primary-red) !important; }
    .nav-item .nav-link { margin-left: 0.5rem; }
    .container.form-container {
      width: 100%; max-width: 600px;
      background:rgba(55,52,52,0.5);
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      z-index: 1;
      margin: 2rem auto;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      color: #333;
    }
    .container.form-container:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
    }
    .container.form-container h2 {
      font-size: 1.8rem;
      color: #ffffff;
      font-weight: 600;
      margin-bottom: 1.5rem;
      text-align: center;
      text-transform: uppercase;
    }
    .container.form-container label { font-size: 1rem; color: #ffffff; margin-bottom: 0.5rem; display: block; }
    .container.form-container input[type="text"],
    .container.form-container input[type="date"],
    .container.form-container input[type="time"],
    .container.form-container select {
      width: 100%; padding: 0.75rem; margin-bottom: 1.5rem; border-radius: 8px; border: 1px solid #ccc; font-size: 1rem;
    }
    .container.form-container input[type="text"]:focus,
    .container.form-container input[type="date"]:focus,
    .container.form-container input[type="time"]:focus,
    .container.form-container select:focus {
      border-color: var(--primary-red);
      outline: none;
    }
    .container.form-container input[type="submit"] {
      width: 100%; padding: 0.75rem; background-color: var(--primary-red); color: #fff; border: none; border-radius: 8px; font-size: 1.1rem; cursor: pointer; transition: background 0.3s ease;
    }
    .container.form-container input[type="submit"]:hover {
      background-color: #cc0000;
    }
    .back-btn {
      display: inline-block;
      background: var(--primary-red);
      color: #fff;
      padding: 0.5rem 1rem;
      border-radius: 8px;
      text-decoration: none;
      text-align: center;
      font-size: 1rem;
      transition: background 0.3s ease, transform 0.3s ease;
      margin-top: 1rem;
    }
    .back-btn:hover { background: #cc0000; transform: scale(1.05); }
    .back-btn i { margin-right: 0.5rem; }
    footer {
      background-color: var(--card-bg);
      padding: 1.5rem 0;
      text-align: center;
      border-top: 3px solid var(--primary-red);
      margin-top: auto;
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
<div class="container form-container">
  <h2>Book a Service Appointment</h2>
  <form action="BookServiceServlet" method="post">
    <%--@declare id="name"--%><%--@declare id="vehicletype"--%><%--@declare id="servicetype"--%><%--@declare id="date"--%><%--@declare id="time"--%><label for="name">Name:</label>
    <input type="text" name="name" required>
    <label for="vehicleType">Vehicle Type:</label>
    <input type="text" name="vehicleType" required>
    <label for="serviceType">Service Type:</label>
    <select name="serviceType" required>
      <option value="Oil Change">Oil Change</option>
      <option value="Full Inspection">Full Inspection</option>
      <option value="Engine Tuning">Engine Tuning</option>
      <option value="AC Repair">AC Repair</option>
    </select>
    <label for="date">Appointment Date:</label>
    <input type="date" name="date" required>
    <label for="time">Appointment Time:</label>
    <input type="time" name="time" required>
    <input type="submit" value="Book Appointment">
  </form>
  <a class="back-btn" href="index.jsp"><i class="bi bi-arrow-left me-1"></i>Back to Home</a>
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