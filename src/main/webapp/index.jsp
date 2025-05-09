<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Service Booking System</title>
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
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.7);
      z-index: -1;
    }
    /* Header */
    .navbar {
      background-color: var(--card-bg) !important;
      border-bottom: 3px solid var(--primary-red);
    }
    .navbar-brand { font-weight: 700; color: var(--white) !important; font-size: 1.5rem; }
    .nav-link { color: var(--light-gray) !important; transition: color 0.3s; padding: 0.5rem 1rem !important; }
    .nav-link:hover { color: var(--primary-red) !important; }
    .nav-btn { border-radius: 30px; padding: 0.5rem 1.5rem !important; margin-left: 0.5rem; transition: all 0.3s ease; }
    .nav-btn:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(255,0,0,0.4); }
    .nav-btn.book-btn { background-color: var(--primary-red); color: #fff !important; }
    .nav-btn.view-btn { border: 2px solid var(--primary-red); color: var(--primary-red) !important; }
    /* Main Content */
    .container.main {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 4rem 2rem;
      z-index: 1;
    }
    .box {
      background: rgba(26,26,26,0.8);
      padding: 2rem 3rem;
      border-radius: 12px;
      text-align: center;
      box-shadow: 0 10px 30px rgba(0,0,0,0.3);
      transition: transform 0.3s, box-shadow 0.3s;
    }
    .box:hover { transform: translateY(-5px); box-shadow: 0 15px 40px rgba(0,0,0,0.4); }
    .box h1 { color: var(--white); font-size: 2.5rem; margin-bottom: 2rem; }
    .box a {
      display: inline-block;
      margin: 0.5rem;
      padding: 0.75rem 2rem;
      font-size: 1.1rem;
      border-radius: 8px;
      text-transform: uppercase;
      letter-spacing: 1px;
      transition: background 0.3s, transform 0.3s;
    }
    .btn-red { background-color: var(--primary-red); color: var(--white); border: none; }
    .btn-red:hover { background-color: #cc0000; }
    .btn-outline-red { background-color: transparent; color: var(--primary-red); border: 2px solid var(--primary-red); }
    .btn-outline-red:hover { background-color: var(--primary-red); color: #fff; }
    /* Footer */
    footer {
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
        <li class="nav-item"><a class="nav-link" href="book_service.jsp">Book Service</a></li>
        <li class="nav-item"><a class="nav-link" href="appointments.jsp">My Appointments</a></li>
        <li class="nav-item"><a class="nav-link" href="feedback.jsp">Feedback</a></li>
      </ul>
    </div>
  </div>
</nav>
<main class="container main">
  <div class="box">
    <h1>Welcome to Service Booking</h1>
    <a href="book_service.jsp" class="btn btn-red">
      <i class="fas fa-book me-1"></i>Book Service
    </a>
    <a href="appointments.jsp" class="btn btn-outline-red">
      <i class="fas fa-list me-1"></i>View Appointments
    </a>
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