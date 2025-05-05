
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Service and Maintenance Tracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Car Service Tracker</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="service_tracker.jsp">Service Tracker</a> </li>
        <li class="nav-item"><a class="nav-link" href="invoice.jsp">Refresh Service</a> </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5 text-center">
    <h1 class="text-primary mb-4">Welcome to Car Service and Maintenance Tracker</h1>
  <p class="lead">Manage service records and generate invoices with ease.</p>

  <div class="d-grid gap-3 col-6 mx-auto mt-4">
    <a href="service_tracker.jsp" class="btn btn-outline-primary btn-lg">Go to Service Tracker</a>
    <a href="invoice.jsp" class="btn btn-outline-success btn-lg">Go to Invoice</a>
  </div>
</div>
</body>
</html>
