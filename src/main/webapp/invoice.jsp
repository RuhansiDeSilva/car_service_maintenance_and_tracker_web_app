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

<jsp:include page="header.jsp" />

<div class="container page-overlay">

    <h3 class="text-white mb-4">Create Invoice</h3>

    <div class="card mb-4">
        <div class="card-body">
            <form method="post" action="service">
                <input type="hidden" name="action" value="addInvoice"/>

                <div class="mb-3">
                    <label class="text-black">Customer Name</label>
                    <input type="text" name="customerName" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label class="text-black">Service ID</label>
                    <input type="text" name="serviceId" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label class="text-black">Amount</label>
                    <input type="number" name="amount" class="form-control" step="0.01" required/>
                </div>

                <button type="submit" class="btn btn-orange-red">Create Invoice</button>
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
        <button class="btn btn-outline-light">View Invoices</button>
    </form>

    <%
        List<Invoice> invoices = (List<Invoice>) request.getAttribute("invoices");
        if (invoices != null && !invoices.isEmpty()) {
    %>
    <table class="table table-dark table-striped table-bordered">
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

<jsp:include page="serviceFooter.jsp" />

</body>
</html>
