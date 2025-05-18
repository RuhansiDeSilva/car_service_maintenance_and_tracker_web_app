<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Invoice" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Invoice Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background: url('images/19613.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            margin: 0;
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
        .table thead th {
            color: #e63900;
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
                    <label class="text-white">Customer Name</label>
                    <input type="text" name="customerName" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label class="text-white">Service ID</label>
                    <input type="text" name="serviceId" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label class="text-white">Amount</label>
                    <input type="number" name="amount" class="form-control" step="0.01" required/>
                </div>

                <button type="submit" class="btn btn-orange-red">Create Invoice</button>
            </form>
        </div>
    </div>

    <% String message = (String) request.getAttribute("message");
       String error = (String) request.getAttribute("error");
       if (message != null) { %>
        <div class="alert alert-success"><%= message %></div>
    <% } else if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <h3 class="text-white mb-4">Invoice List</h3>

    <form class="row mb-4" method="get" action="service">
        <input type="hidden" name="view" value="invoices"/>
        <div class="col-md-4">
            <input type="text" name="search" class="form-control" placeholder="Search by customer name or Service ID"/>
        </div>
        <div class="col-md-2">
            <button class="btn btn-outline-light">Search</button>
        </div>
    </form>

    <form method="get" action="service" class="mb-3">
        <input type="hidden" name="view" value="invoices"/>
        <button class="btn btn-outline-light">View All Invoices</button>
    </form>

    <%
        List<Invoice> invoices = (List<Invoice>) request.getAttribute("invoices");
        if (invoices != null && !invoices.isEmpty()) {
    %>
    <table class="table table-dark table-striped table-bordered">
        <thead>
        <tr>
            <th>Invoice ID</th>
            <th>Customer Name</th>
            <th>Service Type</th>
            <th>Service ID</th>
            <th>Amount</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Invoice invoice : invoices) { %>
        <tr>
            <td><%= invoice.getInvoiceId() %></td>
            <td><%= invoice.getCustomerName() %></td>
            <td><%= invoice.getSpecificServiceType() %></td>
            <td><%= invoice.getServiceId() %></td>
            <td>Rs. <%= invoice.getTotalAmount() != 0 ? invoice.getTotalAmount() : invoice.getAmount() %></td>
            <td>
                <form action="invoice_details.jsp" method="get">
                    <input type="hidden" name="invoiceId" value="<%= invoice.getInvoiceId() %>"/>
                    <input type="hidden" name="customerName" value="<%= invoice.getCustomerName() %>"/>
                    <input type="hidden" name="serviceType" value="<%= invoice.getSpecificServiceType() %>"/>
                    <input type="hidden" name="totalAmount" value="<%= invoice.getTotalAmount() != 0 ? invoice.getTotalAmount() : invoice.getAmount() %>"/>
                    <button type="submit" class="btn btn-sm btn-orange-red">View</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
        <div class="alert alert-warning text-white">No invoices found.</div>
    <% } %>

    <a href="index.jsp" class="btn btn-secondary mt-3">Back to Home</a>

</div>

<jsp:include page="serviceFooter.jsp" />

</body>
</html>

