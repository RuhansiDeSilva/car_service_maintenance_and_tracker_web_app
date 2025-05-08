<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Invoice" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Invoice Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <div class="card-header">Create Invoice</div>
        <div class="card-body">
            <form method="post" action="service">
                <input type="hidden" name="action" value="addInvoice"/>

                <div class="mb-3">
                    <label>Customer Name</label>
                    <input type="text" name="customerName" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label>Service ID</label>
                    <input type="text" name="serviceId" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label>Amount</label>
                    <input type="number" name="amount" class="form-control" step="0.01" required/>
                </div>

                <button type="submit" class="btn btn-primary">Create Invoice</button>
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

    <form method="get" action="service" class="mb-3">
        <input type="hidden" name="view" value="invoices"/>
        <button class="btn btn-outline-secondary text-white">View Invoices</button>
    </form>

    <%
        List<Invoice> invoices = (List<Invoice>) request.getAttribute("invoices");
        if (invoices != null && !invoices.isEmpty()) {
    %>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>Invoice ID</th>
            <th>Customer</th>
            <th>Service ID</th>
            <th>Amount</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Invoice inv : invoices) {
        %>
        <tr>
            <td><%= inv.getInvoiceId() %></td>
            <td><%= inv.getCustomerName() %></td>
            <td><%= inv.getServiceId() %></td>
            <td><%= inv.getAmount() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p class="text-white">No invoices found.</p>
    <%
        }
    %>
</div>

</body>
</html>
