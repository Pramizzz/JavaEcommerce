<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="model.Userc" %>

<%
    // Get user from session
    Userc user = (Userc) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");

    String birthdayValue = "";
    if (user.getBirthday() != null && !user.getBirthday().isEmpty()) {
        birthdayValue = user.getBirthday(); // Assumes format yyyy-MM-dd
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Jordan Shadow Sneaks Hub - Edit Profile</title>
    <meta name="description" content="Edit your profile on Jordan Shadow Sneaks Hub" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/javascript/script.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

    <style>
        /* [CSS remains the same, no class name changes needed] */
        .edit-profile-content {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: #1a1a1a;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.4);
        }

        .edit-profile-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #333;
        }

        .edit-profile-header h2 {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            color: #fff;
        }

        .form-container {
            padding: 1.5rem;
            background: #252525;
            border-radius: 8px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            color: #ff9966;
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
        }

        .form-input {
            width: 100%;
            padding: 0.8rem;
            background: #1e1e1e;
            border: 1px solid #333;
            border-radius: 6px;
            color: #fff;
            font-size: 1rem;
        }

        .form-input:focus {
            outline: none;
            border-color: #ff5e62;
        }

        .alert {
            padding: 0.8rem;
            margin-bottom: 1rem;
            border-radius: 6px;
            text-align: center;
        }

        .alert-success {
            background-color: rgba(40, 167, 69, 0.2);
            border: 1px solid #28a745;
            color: #28a745;
        }

        .alert-danger {
            background-color: rgba(220, 53, 69, 0.2);
            border: 1px solid #dc3545;
            color: #dc3545;
        }

        .form-actions {
            margin-top: 2rem;
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border-radius: 25px;
            text-decoration: none;
            transition: all 0.3s ease;
            cursor: pointer;
            font-weight: 500;
        }

        .btn-primary {
            background: #ff5e62;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background: #ff4757;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: transparent;
            color: #ccc;
            border: 1px solid #ccc;
        }

        .btn-secondary:hover {
            background: rgba(204, 204, 204, 0.1);
            transform: translateY(-2px);
        }

        .form-input.readonly {
            background-color: #191919;
            color: #777;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
<div id="root">
    <%@ include file="navbar.jsp" %>

    <div class="edit-profile-content">
        <div class="edit-profile-header">
            <h2>Edit Profile</h2>
            <p class="edit-profile-subtitle">Update your personal information</p>
        </div>

        <% if (successMessage != null) { %>
        <div class="alert alert-success">
            <%= successMessage %>
        </div>
        <% } %>

        <% if (errorMessage != null) { %>
        <div class="alert alert-danger">
            <%= errorMessage %>
        </div>
        <% } %>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/UpdateProfileServlet" method="post">
                <div class="form-group">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" id="fullName" name="fullName" class="form-input" 
                           value="<%= user.getName() != null ? user.getName() : "" %>" placeholder="Enter your full name">
                </div>

                <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" id="username" name="username" class="form-input readonly" 
                           value="<%= user.getUsername() %>" readonly>
                    <small style="color: #777; display: block; margin-top: 0.3rem;">Username cannot be changed</small>
                </div>

                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-input" 
                           value="<%= user.getEmail() %>" placeholder="Enter your email">
                </div>

                <div class="form-group">
                    <label for="birthday" class="form-label">Birthday</label>
                    <input type="date" id="birthday" name="birthday" class="form-input" 
                           value="<%= birthdayValue %>">
                </div>

                <div class="form-group">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="tel" id="phone" name="phone" class="form-input" 
                           value="<%= user.getPhone() != null ? user.getPhone() : "" %>" placeholder="Enter your phone number">
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <i class='bx bx-save'></i> Save Changes
                    </button>
                    <a href="${pageContext.request.contextPath}/pages/customer/dashboard.jsp" class="btn btn-secondary">
                        <i class='bx bx-arrow-back'></i> Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const alerts = document.querySelectorAll('.alert');
        if (alerts.length > 0) {
            setTimeout(function() {
                alerts.forEach(function(alert) {
                    alert.style.opacity = '0';
                    alert.style.transition = 'opacity 0.5s ease';
                    setTimeout(function() {
                        alert.style.display = 'none';
                    }, 500);
                });
            }, 5000);
        }
    });
</script>
</body>
</html>
