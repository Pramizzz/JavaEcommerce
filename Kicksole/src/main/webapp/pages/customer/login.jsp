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
    <title>Login</title>
    <style>
        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        .wrapper {
            background: white;
            max-width: 430px;
            width: 100%;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            font-size: 24px;
            color: #333;
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

        .input-box {
            margin-bottom: 15px;
        }

        .input-box label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .input-box input[type="text"],
        .input-box input[type="password"] {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .input-box input:focus {
            border-color: #4070f4;
            outline: none;
            box-shadow: 0 0 0 2px rgba(64, 112, 244, 0.2);
        }

        .input-box.checkbox {
            display: flex;
            align-items: center;
        }

        .input-box.checkbox input {
            width: auto;
            margin-right: 10px;
        }

        .input-box.button input {
            width: 100%;
            padding: 12px;
            background-color: #4070f4;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .input-box.button input:hover {
            background-color: #3060e4;
        }

        p {
            color: #e74c3c;
            font-size: 13px;
            margin-top: 5px;
        }

        .text {
            text-align: center;
            margin-top: 20px;
        }

        .text a {
            color: #4070f4;
            text-decoration: none;
            font-weight: 500;
        }

        .text a:hover {
            text-decoration: underline;
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



    <div class="wrapper">
        <h2 class="form-title">Log In</h2>
        <form method="post" action="<%= request.getContextPath() %>/LoginServlet">
            <div class="input-box">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" placeholder="Your Username"
                        value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
              
                <c:if test="${status == 'wrongUsername'}"><p>Wrong username.</p></c:if>
                <c:if test="${status == 'emptyFields'}"><p>Enter all the fields.</p></c:if>
                
            </div>

            <div class="input-box">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Password">
                            	<c:if test="${status == 'wrongPassword'}"><p>Wrong password.</p></c:if>
                                <c:if test="${status == 'emptyFields'}"><p>Enter all the fields.</p></c:if>
            </div>

            <div class="input-box checkbox">
                <input type="checkbox" name="remember-me" id="remember-me">
                <label for="remember-me">Remember me</label>
            </div>

	<c:if test="${status == 'dbError'}">
        <p style="color:red; text-align:center;">Database connection error. Please try again later.</p>
    </c:if>

            <div class="input-box button">
                <input type="submit" value="Log in">
            </div>
        </form>
        <div class="text">
            <p>Don't have an account? <a href="<%= request.getContextPath() %>/pages/customer/registration.jsp">Sign up</a></p>
        </div>
    </div>
</body>
</html>