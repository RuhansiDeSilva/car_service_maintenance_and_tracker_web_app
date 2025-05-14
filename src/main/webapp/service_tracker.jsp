<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Service" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Service Tracker</title>
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

<jsp:include page="header.jsp" />

<div class="container page-overlay">
    <h2 class="mb-4 text-white">Vehicle Service Tracker</h2>

    <%
        List<Service> services = (List<Service>) request.getAttribute("services");


        if (services != null && !services.isEmpty()) {
    %>
    <table class="table table-bordered table-striped align-middle table-dark">
        <thead>
        <tr>
            <th>Service ID</th>
            <th>Customer</th>
            <th>Type</th>
            <th>Date</th>
            <th>Cost</th>
            <th>Status</th>
            <th>Next Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Service s : services) {
                String nextStatus = null;
                if ("Sent".equalsIgnoreCase(s.getStatus())) {
                    nextStatus = "In Progress";
                } else if ("In Progress".equalsIgnoreCase(s.getStatus())) {
                    nextStatus = "Completed";
                }

                String statusClass = switch (s.getStatus()) {
                    case "Sent" -> "badge bg-warning text-dark";
                    case "In Progress" -> "badge bg-info text-dark";
                    case "Completed" -> "badge bg-success";
                    default -> "badge bg-secondary";
                };
        %>
        <tr>
            <td><%= s.getServiceId() %></td>
            <td><%= s.getCustomerName() %></td>
            <td><%= s.getServiceType() %></td>
            <td><%= s.getFormattedDate() %></td>
            <td><%= s.getCost() %></td>
            <td><span class="<%= statusClass %>"><%= s.getStatus() %></span></td>
            <td>
                <%
                    if (nextStatus != null) {
                %>
                <form method="post" action="service" class="d-inline">
                    <input type="hidden" name="action" value="updateStatus"/>
                    <input type="hidden" name="serviceId" value="<%= s.getServiceId() %>"/>
                    <input type="hidden" name="newStatus" value="<%= nextStatus %>"/>
                    <span class="me-2">→ <%= nextStatus %></span>
                    <button type="submit" class="btn btn-sm btn-orange-red">Update</button>
                </form>
                <%
                } else {
                %>
                <span class="text-muted">—</span>
                <%
                    }
                %>
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
    <div class="alert alert-info text-black">No service records available.</div>
    <%
        }
    %>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
