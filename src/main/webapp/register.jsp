<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://png.pngtree.com/background/20250119/original/pngtree-auto-mechanic-repairs-car-engine-picture-image_15516569.jpg?w=1200') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            flex-direction: column;
        }

        .overlay {
            background-color: rgba(7, 7, 7, 0.3);
            min-height: 100vh;
            padding-top: 60px;
            padding-bottom: 40px;
            flex-grow: 1;
        }

        .navbar {
            background-color: #8B0000;
        }

        .navbar-brand, .nav-link {
            color: #fff !important;
            font-weight: bold;
        }

        .register-form {
            background-color: rgba(50, 42, 42, 0.5);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(64, 59, 59, 0.3);
            max-width: 700px;
            margin: auto;
        }

        h2 {
            font-weight: bold;
            color: #ffffff;
        }

        .btn-custom {
            background-color: #dc3545;
            color: white;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background-color: #bb2d3b;
        }

        .back-to-home {
            color: #dc3545;
            font-weight: bold;
            text-decoration: none;
        }

        .back-to-home:hover {
            color: #bb2d3b;
        }

        footer {
            background-color: #8B0000;
            color: white;
            text-align: center;
            padding: 15px 0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">
            <i class="fas fa-car me-2"></i>AutoPulse
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp">Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Register Form -->
<div class="overlay">
    <div class="register-form">
        <h2 class="text-center mb-4">Create an Account</h2>
        <form action="register" method="post">
            <div class="mb-3">
                <input type="text" name="username" class="form-control" placeholder="Username" required />
            </div>
            <div class="mb-3">
                <input type="password" name="password" class="form-control" placeholder="Password" required />
            </div>
            <div class="mb-3">
                <input type="text" name="fullName" class="form-control" placeholder="Full Name" required />
            </div>
            <div class="mb-3">
                <input type="email" name="email" class="form-control" placeholder="Email" required />
            </div>
            <div class="mb-3">
                <input type="text" name="phone" class="form-control" placeholder="Phone Number" required />
            </div>
            <div class="mb-3">
                <label for="role" class="form-label">Select Role</label>
                <select name="role" id="role" class="form-select" required onchange="toggleSubrole()">
                    <option value="">-- Choose a Role --</option>
                    <option value="Customer">Customer</option>
                    <option value="Staff">Staff</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>
            <!-- Subrole -->
            <div class="mb-3" id="subroleDiv" style="display: none;">
                <label for="subrole" class="form-label">Sub Role</label>
                <select name="subrole" id="subrole" class="form-select">
                    <option value="">-- Choose Sub Role --</option>
                    <option value="Service">Service</option>
                    <option value="Management">Management</option>
                </select>
            </div>

            <!-- Staff ID (only if role == Staff) -->
            <div class="mb-3" id="staffIdDiv" style="display: none;">
                <input type="text" name="staffId" class="form-control" placeholder="Staff ID " />
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-custom">Register</button>
            </div>
        </form>

        <div class="text-center mt-3">
            <a href="home.jsp" class="back-to-home">Back to Home</a>
        </div>

        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger mt-3 text-center">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp" />

<!-- Scripts -->
<script>
    function toggleSubrole() {
        const role = document.getElementById("role").value;
        const subroleDiv = document.getElementById("subroleDiv");
        const staffIdDiv = document.getElementById("staffIdDiv");

        if (role === "Staff") {
            subroleDiv.style.display = "block";
            staffIdDiv.style.display = "block";
        } else {
            subroleDiv.style.display = "none";
            staffIdDiv.style.display = "none";
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>