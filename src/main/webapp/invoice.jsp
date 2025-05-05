<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Invoice" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Service" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
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
                <li class="nav-item"><a class="nav-link" href="service_tracker.jsp">Service Tracker</a> </li>
                <li class="nav-item"><a class="nav-link active" href="invoice.jsp">Invoice</a> </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">

    <h2 class="text-primary">Latest Invoice</h2>
    <%
        Invoice invoice= (Invoice) request.getAttribute("invoice");
        if(invoice != null) {
            Service service = invoice.getService();
    %>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Invoice ID: <%= invoice.getInvoiceID() %></h5>
                <p>Service ID: <%= service.getServiceID() %></p>
                <p>Customer: <%= service.getCustomerName() %></p>
                <p>Vehicle: <%= service.getVehicleNumber() %></p>
                <p>Type: <%= service.getServiceType() %></p>
                <p>Date: <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(service.getServiceDate()) %></p>
                <p><strong>Total Rs. <%= invoice.getTotalAmount() %></strong></p>
            </div>
        </div>
    <%
        } else {
    %>
        <p>No new invoice generated in this session.</p>
    <%
        }
    %>

    <hr class="my-5">
    <h2 class="text-primary">All Invoices</h2>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Invoice ID</th>
                <th>Service Id</th>
                <th>Total (Rs.)</th>
            </tr>
        </thead>
        <tbody>
        <%
            String path = application.getRealPath("/data/invoices.txt");
            File file = new File(path);
            if(file.exists()) {
                BufferedReader br = new BufferedReader(new FileReader(file));
                String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
        %>
                <tr>
                    <td><%= parts[0] %></td>
                    <td><%= parts[1] %></td>
                    <td><%= parts[2] %></td>
                </tr>
        <%
            }
            br.close();
            } else {
        %>
                <tr><td colspan="3">No invoices found.</td> </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
