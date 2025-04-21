<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/register/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/register/css/style.css">
     <link rel="stylesheet" href="<%= request.getContextPath() %>/register/css-all/style.css">
     <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

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

<div id="root">
        <header>
            <div class="logo">
                <img src="./images/Jordan Logo.png" alt="Jordan Logo" />
                <h1>Kicksole</h1>
            </div>
            <nav>
                <div class="menu-icon" id="menuToggle">
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                </div>
                <ul class="nav-links">
    <li ><a href="<%= request.getContextPath() %>/register/home.jsp">Home</a></li>
    <li><a href="<%= request.getContextPath() %>/register/products.jsp">Products</a></li>
    <li><a href="<%= request.getContextPath() %>/register/about.jsp">About Us</a></li>
    <li><a href="<%= request.getContextPath() %>/register/contact.jsp">Contact</a></li>
    <li class="active"><a href="<%= request.getContextPath() %>/register/login.jsp">Login</a></li>
</ul>

                </ul>
            </nav>
        </header>


<div class="main">
    <!-- Sign In Form -->
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure><img src="<%= request.getContextPath() %>/register/images/signin-image.jpg" alt="sign in image"></figure>
                    <a href="${pageContext.request.contextPath}/register/registration.jsp" class="signup-image-link">Create an account</a>
                </div>
                <div class="signin-form">
                    <h2 class="form-title">Login In</h2>
                    <form method="post" action="<%= request.getContextPath() %>/LoginServlet" class="register-form" id="login-form">

                        <div class="form-group">
                            <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="username" id="username" placeholder="Your Username"
                                   value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
                        </div>
                        <c:if test="${status == 'wrongUsername'}">
                            <p style="color: red; font-size: 13px; margin: -5px 0 10px 40px; display: block;">Wrong username.</p>
                        </c:if>
                        <c:if test="${status == 'emptyFields'}">
                            <p style="color: red; font-size: 13px; margin: -5px 0 10px 40px; display: block;">Enter all the fields.</p>
                        </c:if>

                        <div class="form-group">
                            <label for="password"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="Password">
                        </div>
                        <c:if test="${status == 'wrongPassword'}">
                            <p style="color: red; font-size: 13px; margin: -5px 0 10px 40px; display: block;">Wrong password.</p>
                        </c:if>
                        <c:if test="${status == 'emptyFields'}">
                            <p style="color: red; font-size: 13px; margin: -5px 0 10px 40px; display: block;">Enter all the fields.</p>
                        </c:if>

                        <div class="form-group">
                            <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                            <label for="remember-me" class="label-agree-term">
                                <span><span></span></span>Remember me
                            </label>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
                        </div>
                    </form>

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
<footer>
          
<footer>
            <div class="footer-content">
                <div class="footer-logo">
                    <img src="./images/Jordan Logo.png" alt="Jordan Logo" />
                    <h2>Kicksole</h2>
                </div>
                <div class="footer-links">
                    <div class="link-group">
                        <h3>Shop</h3>
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/register/products.jsp">New Releases</a></li>
                        </ul>
                    </div>
                    <div class="link-group">
                        <h3>Support</h3>
                        <ul>
                            <li><a href="#">Order Status</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="<%= request.getContextPath() %>/register/contact.jsp">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="link-group">
                        <h3>Company</h3>
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/register/about.jsp">About Us</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Partners</a></li>
                        </ul>
                    </div>
                </div>
            </div>
</body>
</html>
