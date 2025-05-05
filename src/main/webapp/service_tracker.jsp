<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.ServiceHistory" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Service" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Service Tracker</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Car Service Tracker</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link active" href="service_tracker.jsp">Service Tracker</a> </li>
        <li class="nav-item"><a class="nav-link" href="service">Refresh Service</a> </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-4">

  <h2 class="text-primary">Add Service Record</h2>
  <form action="service" method="post" class="row g-3">
    <div class="col-md-6">
      <label>Customer Name</label>
      <input type="text" name="customerName" class="form-control" required>
    </div>
    <div class="col-md-6">
      <label>Vehicle Number</label>
      <input type="text" name="vehicleNumber" class="form-control" required>
    </div>
    <div class="col-md-6">
      <label>Service Date</label>
      <input type="date" name="ServiceDate" class="form-control" required>
    </div>
    <div class="col-md-6">
      <label>Service Type</label>
      <input type="text" name="serviceType" class="form-control" required>
    </div>
    <div class="col-md-6">
      <label>Cost(Rs.)</label>
      <input type="number" step="0.01" name="cost" class="form-control" required>
    </div>
    <div class="col-12">
    <button type="submit" class="btn btn-success">Submit Service</button>
    </div>
  </form>

  <hr class="my-5">

  <h2 class="text-primary">View Service Records</h2>

  <%
    ServiceHistory serviceHistory = (ServiceHistory) request.getAttribute("serviceHistory");
    if(serviceHistory != null && serviceHistory.getHead() != null) {
  %>
    <table class="table table-bordered table-striped mt-3">
      <thead class="table-dark">
          <tr>
            <th>Service ID</th>
            <th>Customer</th>
            <th>Vehicle</th>
            <th>Date</th>
            <th>Type</th>
            <th>Cost (Rs.)</th>
          </tr>
      </thead>
      <tbody>
      <%
          ServiceHistory.Node current = serviceHistory.getHead();
          while (current != null) {
            Service s = current.service;
      %>
          <tr>
            <td><%= s.getServiceID()%></td>
            <td><%= s.getCustomerName()%></td>
            <td><%= s.getVehicleNumber()%></td>
            <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(s.getServiceDate())%></td>
            <td><%= s.getServiceType()%></td>
            <td><%= s.getCost()%></td>
          </tr>
      <%
              current = current.next;
          }
      %>
      </tbody>
    </table>
  <%
    } else {
  %>
    <p>No service records found.</p>
  <%
    }
  %>
</div>
</body>
</html>
