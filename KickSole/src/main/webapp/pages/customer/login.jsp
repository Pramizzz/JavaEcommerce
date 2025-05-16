<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        .registration-container {
            background: #fff;
            max-width: 500px;
            width: 100%;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            position: relative;
        }

        .form-title::before {
            content: "";
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            bottom: -8px;
            height: 3px;
            width: 50px;
            background: #4070f4;
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #4070f4;
            box-shadow: 0 0 0 2px rgba(64, 112, 244, 0.2);
        }

        .error-message {
            color: #e74c3c;
            font-size: 13px;
            margin-top: 5px;
        }

        .terms-check {
            display: flex;
            align-items: center;
            margin: 15px 0;
        }

        .terms-check input {
            margin-right: 8px;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #4070f4;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #3060e4;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }

        .login-link a {
            color: #4070f4;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <h1 class="form-title">Sign Up</h1>
        <form method="post" action="${pageContext.request.contextPath}/RegisterServlet" id="register-form">
            <!-- Full Name -->
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Your Name"
                    value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
                <% if ("emptyName".equals(request.getAttribute("status"))) { %>
                    <span class="error-message">Name must not be empty.</span>
                <% } else if ("invalidName".equals(request.getAttribute("status"))) { %>
                    <span class="error-message">Name must only contain letters.</span>
                <% } else if ("shortName".equals(request.getAttribute("status"))) { %>
                    <span class="error-message">Name must be at least 6 characters long.</span>
                <% } %>
            </div>

            <!-- Username -->
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Your Username"
                    value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
                <% if ("emptyUserName".equals(request.getAttribute("status"))) { %>
                    <span class="error-message">Username must not be empty.</span>
                <% } else if ("invalidUserName".equals(request.getAttribute("status"))) { %>
                    <span class="error-message">Only letters and numbers allowed.</span>
                <% } else if ("shortUserName".equals(request.getAttribute("status"))) { %>
                    <span class="error-message">Username must be at least 6 characters long.</span>
                <% } %>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Your Email"
                    value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
                <% if ("emptyEmail".equals(request.getAttribute("status"))) { %>
                    <span class="error-message">Email must not be empty.</span>
                <% } else if ("invalidEmail".equals(request.getAttribute("status"))) { %>
                    <span class="error-message">Please enter a valid email address.</span>
                <% } %>
            </div>

            <!-- Birthday -->
            <div class="form-group">
                <label for="birthday">Birthday</label>
                <input type="date" id="birthday" name="birthday"
                    value="<%= request.getParameter("birthday") != null ? request.getParameter("birthday") : "" %>">
                <% String status = (String) request.getAttribute("status");
                   if ("emptyBirthday".equals(status)) { %>
                    <span class="error-message">Birthday must not be empty.</span>
                <% } else if ("invalidBirthdayFormat".equals(status)) { %>
                    <span class="error-message">Invalid date format.</span>
                <% } else if ("invalidFutureBirthday".equals(status)) { %>
                    <span class="error-message">Birthday cannot be in the future.</span>
                <% } else if ("invalidAge".equals(status)) { %>
                    <span class="error-message">You must be 14–100 years old.</span>
                <% } %>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="pass">Password</label>
                <input type="password" id="pass" name="pass" placeholder="Password" autocomplete="new-password"
                    value="<%= request.getParameter("pass") != null ? request.getParameter("pass") : "" %>">
                <% if ("emptyPassword".equals(status)) { %>
                    <span class="error-message">Password must not be empty.</span>
                <% } else if ("invalidPassword".equals(status)) { %>
                    <span class="error-message">Must include uppercase, number, and special character.</span>
                <% } %>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label for="re_pass">Confirm Password</label>
                <input type="password" id="re_pass" name="re_pass" placeholder="Repeat your password"
                    value="<%= request.getParameter("re_pass") != null ? request.getParameter("re_pass") : "" %>">
                <% if ("emptyConfirmPassword".equals(status)) { %>
                    <span class="error-message">Please confirm your password.</span>
                <% } else if ("invalidConfirmPassword".equals(status)) { %>
                    <span class="error-message">Passwords do not match.</span>
                <% } %>
            </div>

            <!-- Phone Number -->
            <div class="form-group">
                <label for="contact">Phone Number</label>
                <input type="text" id="contact" name="contact" placeholder="Contact number"
                    value="<%= request.getParameter("contact") != null ? request.getParameter("contact") : "" %>">
                <% if ("emptyPhone".equals(status)) { %>
                    <span class="error-message">Phone number must not be empty.</span>
                <% } else if ("invalidPhone".equals(status)) { %>
                    <span class="error-message">Phone must be exactly 10 digits.</span>
                <% } %>
            </div>

            <!-- Terms -->
            <div class="terms-check">
                <input type="checkbox" name="agree-term" id="agree-term" 
                    <%= request.getParameter("agree-term") != null ? "checked" : "" %>>
                <label for="agree-term">I agree to the <a href="#">Terms of Service</a></label>
            </div>
            <% if ("termsNotAccepted".equals(status)) { %>
                <span class="error-message">You must accept the terms to register.</span>
            <% } %>

            <!-- Submit -->
            <button type="submit" class="submit-btn">Register</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="<%= request.getContextPath() %>/pages/customer/login.jsp">Sign in</a>
        </div>
    </div>
</body>
</html>
