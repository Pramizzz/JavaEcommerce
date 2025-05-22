<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Premium Jordan sneakers collection" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/javascript/script.js"></script>
    <title>Registration Form</title>
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .navbar {
            background: #000;
            padding: 10px 20px;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar a {
            color: #fff;
            margin: 0 15px;
            text-decoration: none;
        }

        .registration-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
            padding: 20px;
        }

        .registration-card {
            background: rgb(41, 43, 45);
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 420px;
            padding: 30px;
            margin: 40px 0;
            color: #333;
        }

        .form-title {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px;
        }

        .form-title::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background-color: #4070f4;
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #555;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            font-size: 14px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .form-group input::placeholder {
            color: #aaa;
        }

        .form-group input:focus {
            outline: none;
            background-color: #444;
        }

        .error-message {
            color: #e74c3c;
            font-size: 13px;
            margin-top: 5px;
        }

        .terms-check {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .terms-check input {
            margin-right: 10px;
        }

        .terms-check-label {
            font-size: 14px;
            color: #555;
        }

        .submit-btn {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #4070f4;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #3060e4;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }

        .login-link a {
            color: #4070f4;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .footer {
            background: #000;
            color: #fff;
            padding: 20px;
            text-align: center;
            width: 100%;
        }

        .footer a {
            color: #fff;
            margin: 0 10px;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%
String msg = request.getParameter("msg");
if ("failed".equals(msg)) {
%>
<script>
alert("Failed to register user. Try again.");
</script>
<%
} else if ("error".equals(msg)) {
%>
<script>
alert("Database error occurred. Contact admin.");
</script>
<%
}
%>

<div class="registration-container">
    <div class="registration-card">
        <h1 class="form-title" style = "color: #fff;">Sign Up</h1>
        <form method="post" action="${pageContext.request.contextPath}/RegisterServlet" id="register-form">
            <!-- Full Name -->
            <div class="form-group">
                <label for="name" style = "color: #fff;">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Your Name"
                       value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
                <% if ("emptyName".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Name must not be empty.</p>
                <% } else if ("invalidName".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Name must only contain letters.</p>
                <% } else if ("shortName".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Name must be at least 6 characters long.</p>
                <% } %>
            </div>

            <!-- Username -->
            <div class="form-group">
                <label for="username" style = "color: #fff;">Username</label>
                <input type="text" id="username" name="username" placeholder="Your Username"
                       value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
                <% if ("emptyUserName".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Username must not be empty.</p>
                <% } else if ("invalidUserName".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Username must only contain letters and numbers (no special characters).</p>
                <% } else if ("shortUserName".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Username must be at least 6 characters long.</p>
                <% } else if ("allNumbersUserName".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Username cannot contain only numbers. Please include letters as well.</p>
                <% } %>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email" style = "color: #fff;">Email</label>
                <input type="email" id="email" name="email" placeholder="Your Email"
                       value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
                <% if ("emptyEmail".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Email must not be empty.</p>
                <% } else if ("invalidEmail".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Only letters and numbers are allowed.</p>
                <% } else if ("shortEmailPrefix".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Email prefix must be at least 6 characters long.</p>
                <% } else if ("noLetterInEmailPrefix".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Email prefix must include letters </p>
                <% } %>
            </div>

            <!-- Birthday -->
            <div class="form-group">
                <label for="birthday" style = "color: #fff;">Birthday</label>
                <input type="date" id="birthday" name="birthday"
                       value="<%= request.getParameter("birthday") != null ? request.getParameter("birthday") : "" %>">
                <%
                    String status = (String) request.getAttribute("status");
                    if ("emptyBirthday".equals(status)) {
                %>
                <p class="error-message">Birthday must not be empty.</p>
                <% } else if ("invalidBirthdayFormat".equals(status)) { %>
                <p class="error-message">Invalid date format. Please enter a valid birthday.</p>
                <% } else if ("invalidFutureBirthday".equals(status)) { %>
                <p class="error-message">Birthday cannot be in the future.</p>
                <% } else if ("invalidAge".equals(status)) { %>
                <p class="error-message">You must be at least 14 years old and no older than 100 years old.</p>
                <% } %>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="pass" style = "color: #fff;">Password</label>
                <input type="password" id="pass" name="pass" placeholder="Password" autocomplete="new-password"
                       value="<%= request.getParameter("pass") != null ? request.getParameter("pass") : "" %>">
                <% if ("emptyPassword".equals(status)) { %>
                <p class="error-message">Password must not be empty.</p>
                <% } else if ("invalidPassword".equals(status)) { %>
                <p class="error-message">
                    Password must be at least 6 characters long, include an uppercase letter, a number, and a special character.
                </p>
                <% } %>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label for="re_pass" style = "color: #fff;">Confirm Password</label>
                <input type="password" id="re_pass" name="re_pass" placeholder="Repeat your password"
                       value="<%= request.getParameter("re_pass") != null ? request.getParameter("re_pass") : "" %>">
                <% if ("emptyConfirmPassword".equals(status)) { %>
                <p class="error-message">Please confirm your password.</p>
                <% } else if ("invalidConfirmPassword".equals(status)) { %>
                <p class="error-message">Passwords do not match.</p>
                <% } %>
            </div>

            <!-- Phone Number -->
            <div class="form-group">
                <label for="contact" style = "color: #fff;">Phone Number</label>
                <input type="text" id="contact" name="contact" placeholder="Contact number"
                       value="<%= request.getParameter("contact") != null ? request.getParameter("contact") : "" %>">
                <% if ("emptyPhone".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Phone number must not be empty.</p>
                <% } else if ("phoneHasLetters".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Phone number should not contain letters.</p>
                <% } else if ("invalidPhone".equals(request.getAttribute("status"))) { %>
                <p class="error-message">Phone number must be exactly 10 digits.</p>
                <% } %>
            </div>

            <!-- Terms -->
            <div class="terms-check">
                <input type="checkbox" name="agree-term" id="agree-term"
                       <%= request.getParameter("agree-term") != null ? "checked" : "" %>>
                <label for="agree-term" class="terms-check-label">I agree to the <a href="#">Terms of Service</a></label>
            </div>
            <% if ("termsNotAccepted".equals(status)) { %>
            <p class="error-message">You must accept the terms of service to register.</p>
            <% } %>

            <!-- Submit -->
            <button type="submit" class="submit-btn">Register</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="<%= request.getContextPath() %>/pages/customer/login.jsp">Sign in</a>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>