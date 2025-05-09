<%@ page language="java" %>
<html>
<head>
    <title>Feedback | Car Service Tracker</title>
    <!-- Bootstrap + FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: url('images/feedback-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }

        .feedback-container {
            background: rgba(0, 0, 0, 0.85);
            padding: 40px;
            border-radius: 10px;
            margin-top: 50px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.6);
        }

        .form-control {
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }

        .form-control::placeholder {
            color: #ccc;
        }

        label {
            font-weight: bold;
        }

        .btn-submit {
            width: 100%;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="feedback-container">
        <h3 class="text-center mb-4"><i class="fas fa-comment-dots"></i> Feedback Form</h3>
        <form action="FeedbackServlet" method="POST">
            <div class="mb-3">
                <label><i class="fas fa-user"></i> Name:</label>
                <input type="text" name="name" class="form-control" placeholder="Your name" required>
            </div>

            <div class="mb-3">
                <label><i class="fas fa-envelope"></i> Email:</label>
                <input type="email" name="email" class="form-control" placeholder="Your email" required>
            </div>

            <div class="mb-3">
                <label><i class="fas fa-star"></i> Rating:</label>
                <select class="form-control" name="rating" required>
                    <option value="" disabled selected>Rate our service</option>
                    <option value="5">⭐⭐⭐⭐⭐ - Excellent</option>
                    <option value="4">⭐⭐⭐⭐ - Good</option>
                    <option value="3">⭐⭐⭐ - Average</option>
                    <option value="2">⭐⭐ - Poor</option>
                    <option value="1">⭐ - Very Poor</option>
                </select>
            </div>

            <div class="mb-3">
                <label><i class="fas fa-comment"></i> Comments:</label>
                <textarea name="comments" class="form-control" rows="4" placeholder="Write your feedback here..." required></textarea>
            </div>

            <button type="submit" class="btn btn-success btn-submit"><i class="fas fa-paper-plane"></i> Submit Feedback</button>
        </form>

        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-outline-light btn-sm"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
</div>

</body>
</html>
