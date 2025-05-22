<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Userc" %>

<%
    Userc user = (Userc) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Change your password on Jordan Shadow Sneaks Hub">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="${pageContext.request.contextPath}/resources/javascript/script.js" defer></script>

    <style>
        body {
            background-color: #121212;
            color: #fff;
            font-family: 'Segoe UI', sans-serif;
        }

        main {
            max-width: 600px;
            margin: 3rem auto;
            padding: 2rem;
            background-color: #1e1e1e;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
        }

        h2 {
            text-align: center;
            color: #ff9966;
            margin-bottom: 1rem;
        }

        .alert {
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-radius: 8px;
            text-align: center;
        }

        .alert-success {
            background-color: rgba(40, 167, 69, 0.1);
            border: 1px solid #28a745;
            color: #28a745;
        }

        .alert-danger {
            background-color: rgba(220, 53, 69, 0.1);
            border: 1px solid #dc3545;
            color: #dc3545;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #ff9966;
        }

        .form-input {
            width: 100%;
            padding: 0.75rem;
            background: #2c2c2c;
            border: 1px solid #444;
            border-radius: 6px;
            color: #fff;
        }

        .form-input:focus {
            border-color: #ff5e62;
            outline: none;
        }

        .password-toggle {
            position: relative;
        }

        .password-toggle button {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #aaa;
            cursor: pointer;
            font-size: 1.2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-actions {
            text-align: center;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn-primary {
            background: #ff5e62;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background: #ff3d43;
        }

        .btn-secondary {
            background: transparent;
            color: #ccc;
            border: 1px solid #ccc;
            margin-left: 1rem;
        }

        .btn-secondary:hover {
            background-color: rgba(255, 255, 255, 0.05);
        }

        .password-requirements {
            background: rgba(255, 255, 255, 0.05);
            padding: 1rem;
            border-radius: 8px;
            margin-top: 1.5rem;
        }

        .password-requirements ul {
            padding-left: 1.2rem;
            list-style: disc;
            color: #ccc;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <main>
        <h2>Change Password</h2>

        <% if (successMessage != null) { %>
            <div class="alert alert-success"><%= successMessage %></div>
        <% } %>

        <% if (errorMessage != null) { %>
            <div class="alert alert-danger"><%= errorMessage %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/ChangePasswordServlet" method="post" id="passwordForm">
            <div class="form-group">
                <label for="currentPassword">Current Password</label>
                <div class="password-toggle">
                    <input type="password" name="currentPassword" id="currentPassword" class="form-input" required>
                    <button type="button" onclick="togglePassword('currentPassword')"><i class='bx bx-show'></i></button>
                </div>
            </div>

            <div class="form-group">
                <label for="newPassword">New Password</label>
                <div class="password-toggle">
                    <input type="password" name="newPassword" id="newPassword" class="form-input" required>
                    <button type="button" onclick="togglePassword('newPassword')"><i class='bx bx-show'></i></button>
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <div class="password-toggle">
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-input" required>
                    <button type="button" onclick="togglePassword('confirmPassword')"><i class='bx bx-show'></i></button>
                </div>
            </div>

            <div class="password-requirements">
                <strong>Password must include:</strong>
                <ul>
                    <li>At least 8 characters</li>
                    <li>At least 1 uppercase letter</li>
                    <li>At least 1 lowercase letter</li>
                    <li>At least 1 number</li>
                    <li>At least 1 special character</li>
                </ul>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary"><i class='bx bx-lock-alt'></i> Change Password</button>
                <a href="dashboard.jsp" class="btn btn-secondary"><i class='bx bx-arrow-back'></i> Cancel</a>
            </div>
        </form>
    </main>

    <%@ include file="footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const alerts = document.querySelectorAll('.alert');
            if (alerts.length > 0) {
                setTimeout(() => {
                    alerts.forEach(alert => {
                        alert.style.opacity = '0';
                        alert.style.transition = 'opacity 0.5s ease';
                        setTimeout(() => alert.style.display = 'none', 500);
                    });
                }, 5000);
            }

            document.getElementById('passwordForm').addEventListener('submit', function (e) {
                const newPassword = document.getElementById('newPassword').value;
                const confirmPassword = document.getElementById('confirmPassword').value;

                if (newPassword !== confirmPassword) {
                    e.preventDefault();
                    alert('New password and confirmation do not match.');
                    return;
                }

                const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                if (!passwordRegex.test(newPassword)) {
                    e.preventDefault();
                    alert('Password does not meet the requirements.');
                }
            });
        });

        function togglePassword(id) {
            const input = document.getElementById(id);
            const icon = event.currentTarget.querySelector('i');
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.replace('bx-show', 'bx-hide');
            } else {
                input.type = 'password';
                icon.classList.replace('bx-hide', 'bx-show');
            }
        }
    </script>
</body>
</html>
