<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Userc" %>

<%
    // Get user from session
    Userc user= (Userc) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Get messages from request if available
    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Jordan Shadow Sneaks Hub - Change Password</title>
    <meta name="description" content="Change your password on Jordan Shadow Sneaks Hub" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/javascript/script.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

    <style>
        .change-password-content {
            max-width: 600px;
            margin: 2rem auto;
            padding: 2rem;
            background: #1a1a1a;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.4);
        }

        .change-password-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #333;
        }

        .change-password-header h2 {
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
        
        .password-toggle {
            position: relative;
        }
        
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #999;
            cursor: pointer;
            font-size: 1.2rem;
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

        .password-requirements {
            margin-top: 1rem;
            padding: 1rem;
            background: rgba(0, 0, 0, 0.2);
            border-radius: 6px;
        }

        .password-requirements h4 {
            color: #ff9966;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }

        .password-requirements ul {
            list-style-type: none;
            padding-left: 1rem;
        }

        .password-requirements li {
            color: #ccc;
            font-size: 0.85rem;
            margin-bottom: 0.3rem;
            position: relative;
        }

        .password-requirements li:before {
            content: "•";
            position: absolute;
            left: -1rem;
            color: #ff9966;
        }
    </style>
</head>
<body>
<div id="root">
   <%@ include file="navbar.jsp" %>

    <div class="change-password-content">
        <div class="change-password-header">
            <h2>Change Password</h2>
            <p class="change-password-subtitle">Update your account security</p>
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
            <form action="${pageContext.request.contextPath}/ChangePasswordServlet" method="post" id="passwordForm">
                <div class="form-group">
                    <label for="currentPassword" class="form-label">Current Password</label>
                    <div class="password-toggle">
                        <input type="password" id="currentPassword" name="currentPassword" class="form-input" required>
                        <button type="button" class="toggle-password" onclick="togglePassword('currentPassword')">
                            <i class='bx bx-show'></i>
                        </button>
                    </div>
                </div>

                <div class="form-group">
                    <label for="newPassword" class="form-label">New Password</label>
                    <div class="password-toggle">
                        <input type="password" id="newPassword" name="newPassword" class="form-input" required>
                        <button type="button" class="toggle-password" onclick="togglePassword('newPassword')">
                            <i class='bx bx-show'></i>
                        </button>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword" class="form-label">Confirm New Password</label>
                    <div class="password-toggle">
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-input" required>
                        <button type="button" class="toggle-password" onclick="togglePassword('confirmPassword')">
                            <i class='bx bx-show'></i>
                        </button>
                    </div>
                </div>

                <div class="password-requirements">
                    <h4>Password Requirements</h4>
                    <ul>
                        <li>At least 8 characters long</li>
                        <li>At least one uppercase letter</li>
                        <li>At least one lowercase letter</li>
                        <li>At least one number</li>
                        <li>At least one special character</li>
                    </ul>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <i class='bx bx-lock-alt'></i> Change Password
                    </button>
                    <a href="dashboard.jsp" class="btn btn-secondary">
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
        // Auto-hide alerts after 5 seconds
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
        
        // Form validation
        document.getElementById('passwordForm').addEventListener('submit', function(event) {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            // Check if passwords match
            if (newPassword !== confirmPassword) {
                event.preventDefault();
                alert('New password and confirm password do not match.');
                return;
            }
            
            // Check password strength
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordRegex.test(newPassword)) {
                event.preventDefault();
                alert('Password does not meet the requirements.');
                return;
            }
        });
    });
    
    // Function to toggle password visibility
    function togglePassword(inputId) {
        const input = document.getElementById(inputId);
        const icon = event.currentTarget.querySelector('i');
        
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('bx-show');
            icon.classList.add('bx-hide');
        } else {
            input.type = 'password';
            icon.classList.remove('bx-hide');
            icon.classList.add('bx-show');
        }
    }
</script>
</body>
</html>