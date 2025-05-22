<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  HttpSession sessionCheck = request.getSession(false);
if (sessionCheck != null && sessionCheck.getAttribute("username") != null) {
    String role = (String) sessionCheck.getAttribute("role");
    if ("admin".equals(role)) {
        response.sendRedirect(request.getContextPath() + "/pages/admin/adminDashboard.jsp");
    } else  {
        response.sendRedirect(request.getContextPath() + "/pages/customer/home.jsp");
    }
}
%>

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
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <title>Login</title>
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: Arial, sans-serif;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            padding: 20px;
        }

        .login-card {
            background: rgb(41, 43, 45);
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 420px;
            padding: 30px;
            margin: 40px 0;
            color: #333;
        }

        .login-title {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px;
        }

        .login-title::after {
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

        .form-control {
            width: 100%;
            padding: 12px 15px;
            font-size: 14px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .form-control::placeholder {
            color: #aaa;
        }

        .form-control:focus {
            outline: none;
            background-color: #444;
        }

        .form-check {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-check-input {
            margin-right: 10px;
        }

        .form-check-label {
            font-size: 14px;
            color: #555;
        }

        .login-btn {
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

        .login-btn:hover {
            background-color: #3060e4;
        }

        .signup-text {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }

        .signup-link {
            color: #4070f4;
            text-decoration: none;
            font-weight: 500;
        }

        .signup-link:hover {
            text-decoration: underline;
        }

        .error-text {
            color: #e74c3c;
            font-size: 13px;
            margin-top: 5px;
        }
    </style>
</head>

<%
    String msg = request.getParameter("msg");
    if ("registered".equals(msg)) {
%>
    <script>
        alert("User registered successfully!");
    </script>
<%
    }
%>

<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="login-container">
        <div class="login-card">
            <h2 class="login-title" style = "color: #fff;">Log In</h2>
            
            <form method="post" action="<%= request.getContextPath() %>/LoginServlet">
                <div class="form-group">
                    <label for="username" style = "color: #fff;">Username</label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="Your Username"
                           value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
                    
                    <c:if test="${status == 'wrongUsername'}"><p class="error-text">Wrong username.</p></c:if>
                    <c:if test="${status == 'emptyFields'}"><p class="error-text">Enter all the fields.</p></c:if>
                </div>

                <div class="form-group">
                    <label for="password" style = "color: #fff;">Password</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                    <c:if test="${status == 'wrongPassword'}"><p class="error-text">Wrong password.</p></c:if>
                    <c:if test="${status == 'emptyFields'}"><p class="error-text">Enter all the fields.</p></c:if>
                </div>

                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="remember-me" id="remember-me">
                    <label class="form-check-label" for="remember-me" style = "color: #fff;">Remember me</label>
                </div>

                <c:if test="${status == 'dbError'}">
                    <p class="error-text" style="text-align:center;">Database connection error. Please try again later.</p>
                </c:if>

                <button type="submit" class="login-btn">Log in</button>
            </form>
            
            <div class="signup-text">
                Don't have an account? <a href="<%= request.getContextPath() %>/pages/customer/registration.jsp" class="signup-link">Sign up</a>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>