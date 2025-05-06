<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/resources/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/pagescss/style.css">
</head>
<body>
<div class="main">
    <!-- Sign In Form -->
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure><img src="<%= request.getContextPath() %>/resourcesr/images/signin-image.jpg" alt="sign in image"></figure>
                    <a href="${pageContext.request.contextPath}/pages/customer/registration.jsp" class="signup-image-link">Create an account</a>
                </div>
                <div class="signin-form">
                    <h2 class="form-title">Login In</h2>
                    <form method="post" action="<%= request.getContextPath() %>/LoginServlet" class="register-form" id="login-form">

                        <!-- Username Field -->
                        <div class="form-group">
                            <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="username" id="username" placeholder="Your Username"
                                   value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
                        </div>
                        <% 
                            String status = (String) request.getAttribute("status");
                            if ("wrongUsername".equals(status)) {
                        %>
                            <p style="color: red; font-size: 13px; margin: -5px 0 10px 40px; display: block;">Wrong username.</p>
                        <% } else if ("emptyFields".equals(status)) { %>
                            <p style="color: red; font-size: 13px; margin: -5px 0 10px 40px; display: block;">Enter all the fields.</p>
                        <% } %>

                        <!-- Password Field -->
                        <div class="form-group">
                            <label for="password"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="Password">
                        </div>
                        <% 
                            if ("wrongPassword".equals(status)) {
                        %>
                            <p style="color: red; font-size: 13px; margin: -5px 0 10px 40px; display: block;">Wrong password.</p>
                        <% } else if ("emptyFields".equals(status)) { %>
                            <p style="color: red; font-size: 13px; margin: -5px 0 10px 40px; display: block;">Enter all the fields.</p>
                        <% } %>

                        <!-- Remember Me -->
                        <div class="form-group">
                            <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                            <label for="remember-me" class="label-agree-term">
                                <span><span></span></span>Remember me
                            </label>
                        </div>

                        <!-- Submit -->
                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
                        </div>
                    </form>

                    <!-- Social Login -->
                    <div class="social-login">
                        <span class="social-label">Or login with</span>
                        <ul class="socials">
                            <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                            <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                            <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>
