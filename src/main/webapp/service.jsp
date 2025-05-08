
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Service" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Service Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background: url('images/19613.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
        }
        .page-overlay {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 40px;
            border-radius: 15px;
            margin-top: 30px;
        }
        .btn-orange-red {
            background-color: #e63900;
            color: white;
            border: none;
        }
        .btn-orange-red:hover {
            background-color: #cc3300;
            color: white;
        }
    </style>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Car Service Tracker</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="service.jsp">Manage Services</a></li>
                <li class="nav-item"><a class="nav-link" href="service?view=tracker">Service Tracker</a></li>
                <li class="nav-item"><a class="nav-link" href="invoice.jsp">Manage Invoices</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">

    <div class="card mb-4">
        <div class="card-header">Add Service Record</div>
        <div class="card-body">
            <form method="post" action="service">
                <input type="hidden" name="action" value="addService"/>

                <div class="mb-3">
                    <label>Service Type</label>
                    <select name="serviceType" class="form-control" required>
                        <option value="Regular">Regular</option>
                        <option value="MajorRepair">Major Repair</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label>Customer Name</label>
                    <input type="text" name="customerName" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label>Date</label>
                    <input type="date" name="date" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label>Cost</label>
                    <input type="number" name="cost" class="form-control" step="0.01" required/>
                </div>

                <div class="mb-3">
                    <label>Status</label>
                    <select name="status" class="form-control" required>
                        <option value="Sent">Sent to Service</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Completed">Completed</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Add Service</button>
            </form>
        </div>
    </div>

    <%
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");
        if (message != null) {
    %>
    <div class="alert alert-success"><%= message %></div>
    <% } else if (error != null) { %>
    <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <div class="d-flex justify-content-between align-items-center mb-2">
        <h4 class="text-white">Service Records</h4>
        <form method="get" action="service">
            <input type="hidden" name="view" value="services"/>
            <button class="btn btn-outline-secondary text-white">View All Services</button>
        </form>
    </div>

    <%
        List<Service> services = (List<Service>) request.getAttribute("services");
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        if (services != null && !services.isEmpty()) {
    %>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Service ID</th>
            <th>Customer</th>
            <th>Type</th>
            <th>Date</th>
            <th>Cost</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Service s : services) {
        %>
        <tr>
            <td><%= s.getServiceId() %></td>
            <td><%= s.getCustomerName() %></td>
            <td><%= s.getServiceType() %></td>
            <td><%= sdf.format(s.getDate()) %></td>
            <td><%= s.getCost() %></td>
            <td>
                <%
                    String statusClass = switch (s.getStatus()) {
                        case "Sent" -> "badge bg-warning text-dark";
                        case "In Progress" -> "badge bg-info text-dark";
                        case "Completed" -> "badge bg-success";
                        default -> "badge bg-secondary";
                    };
                %>
                <span class="<%= statusClass %>"><%= s.getStatus() %></span>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p class="text-white">No service records found.</p>
    <%
        }
    %>
</div>
</body>
</html>

