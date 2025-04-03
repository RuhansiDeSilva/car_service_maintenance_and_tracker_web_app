<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management System</title>
</head>
<body>
<h1>User Management</h1>

<%-- Display messages --%>
<% String message = (String) request.getAttribute("message"); %>
<% if (message != null) { %>
<div style="color: green;"><%= message %></div>
<% } %>

<%-- Error message --%>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<div style="color: red;"><%= error %></div>
<% } %>

<%-- Create User Form --%>
<h2>Add New User</h2>
<form action="user" method="post">
    <input type="hidden" name="action" value="create">
    Username: <label>
    <input type="text" name="username" required>
</label><br>
    Full Name: <label>
    <input type="text" name="name" required>
</label><br>
    Email: <label>
    <input type="email" name="email" required>
</label><br>
    Phone: <label>
    <input type="text" name="phone" required>
</label><br>
    Password: <label>
    <input type="password" name="password" required>
</label><br>
    Address: <label>
    <input type="text" name="address" required>
</label><br>
    Status:
    <label>
        <select name="status" required>
            <option value="customer">Customer</option>
            <option value="admin">Admin</option>
            <option value="technician">Technician</option>
        </select>
    </label><br>
    <button type="submit">Add User</button>
</form>

<%-- Display Users Table --%>
<h2>User List</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>Username</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Status</th>
    </tr>
    <%
        // Get users from the UserService directly if not in request
        List<User> users = (List<User>) request.getAttribute("users");
        if (users == null) {
            users = new lk.sliit.carservicemanagementgp99.projectname.UserService().getAllUsers();
        }
    %>
    <% if (users != null && !users.isEmpty()) { %>
    <% for (User user : users) { %>
    <tr>
        <td><%= user.getUsername() %></td>
        <td><%= user.getName() %></td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getPhone_number() %></td>
        <td><%= user.getAddress() %></td>
        <td><%= user.getStatus() %></td>
    </tr>
    <% } %>
    <% } else { %>
    <tr>
        <td colspan="6">No users found</td>
    </tr>
    <% } %>
</table>

<%-- Update User Form --%>
<h2>Update User</h2>
<form action="user" method="post">
    <input type="hidden" name="action" value="update">
    Username: <input type="text" name="username" required><br>
    Full Name: <input type="text" name="name" required><br>
    Email: <input type="email" name="email" required><br>
    Phone: <input type="text" name="phone" required><br>
    New Password: <input type="password" name="password"><br>
    Address: <input type="text" name="address" required><br>
    Status:
    <select name="status" required>
        <option value="customer">Customer</option>
        <option value="admin">Admin</option>
        <option value="technician">Technician</option>
    </select><br>
    <button type="submit">Update User</button>
</form>

<%-- Delete User Form --%>
<h2>Delete User</h2>
<form action="user" method="post">
    <input type="hidden" name="action" value="delete">
    Username: <input type="text" name="username" required><br>
    <button type="submit">Delete User</button>
</form>
</body>
</html>