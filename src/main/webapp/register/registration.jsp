 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/register/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/register/css/style.css">
    
    <style>
        .error {
            color: red;
            font-size: 13px;
            margin: -5px 0 10px 40px;
        }
    </style>
</head>
<body>
<div class="main">
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Sign up</h2>
                    <form method="post" action="${pageContext.request.contextPath}/RegisterServlet" class="register-form" id="register-form">
                        
                       <!-- Name -->
						<div class="form-group">
						    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
						    <input type="text" name="name" placeholder="Your Name"
						           value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
						</div>
						
						<% if ("emptyName".equals(request.getAttribute("status"))) { %>
						    <p class="error">Name must not be empty.</p>
						<% } else if ("invalidName".equals(request.getAttribute("status"))) { %>
						    <p class="error">Name must only contain letters.</p>
						<% } else if ("shortName".equals(request.getAttribute("status"))) { %>
						    <p class="error">Name must be at least 6 characters long.</p>
						<% } %>

						<!-- Username -->
						<div class="form-group">
						    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
						    <input type="text" name="username" placeholder="Your User Name"
						           value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
						</div>
						
						<% if ("emptyUserName".equals(request.getAttribute("status"))) { %>
						    <p class="error">Username must not be empty.</p>
						<% } else if ("invalidUserName".equals(request.getAttribute("status"))) { %>
						    <p class="error">Username must only contain letters and numbers (no special characters).</p>
						<% } else if ("shortUserName".equals(request.getAttribute("status"))) { %>
						    <p class="error">Username must be at least 6 characters long.</p>
						<% } %>


					    <!-- Email -->
						<div class="form-group">
						    <label for="email"><i class="zmdi zmdi-email"></i></label>
						    <input type="email" name="email" placeholder="Your Email"
						           value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
						</div>
						
						<% if ("emptyEmail".equals(request.getAttribute("status"))) { %>
						    <p class="error">Email must not be empty.</p>
						<% } else if ("invalidEmail".equals(request.getAttribute("status"))) { %>
						    <p class="error">Please enter a valid email address.</p>
						<% } %>


                        <!-- Birthday -->
						<div class="form-group">
						    <label for="birthday"><i class="zmdi zmdi-calendar"></i></label>
						    <input type="date" name="birthday"
						           value="<%= request.getParameter("birthday") != null ? request.getParameter("birthday") : "" %>">
						</div>
						
						<% 
						    String status = (String) request.getAttribute("status");
						    if ("emptyBirthday".equals(status)) { 
						%>
						    <p class="error">Birthday must not be empty.</p>
						<% } else if ("invalidBirthdayFormat".equals(status)) { %>
						    <p class="error">Invalid date format. Please enter a valid birthday.</p>
						<% } else if ("invalidFutureBirthday".equals(status)) { %>
						    <p class="error">Birthday cannot be in the future.</p>
						<% } else if ("invalidAge".equals(status)) { %>
						    <p class="error">You must be at least 14 years old and no older than 100 years old.</p>
						<% } %>


                        <!-- Password -->
						<div class="form-group">
						    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
						    <input type="password" name="pass" placeholder="Password" value="<%= request.getParameter("pass") != null ? request.getParameter("pass") : "" %>">
						</div>
						
						<% if ("emptyPassword".equals(status)) { %>
						    <p class="error">Password must not be empty.</p>
						<% } else if ("invalidPassword".equals(status)) { %>
						    <p class="error">
						        Password must be at least 6 characters long, include an uppercase letter, a number, and a special character.
						    </p>
						<% } %>


                        <!-- Confirm Password -->
						<div class="form-group">
						    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
						    <input type="password" name="re_pass" placeholder="Repeat your password" value="<%= request.getParameter("re_pass") != null ? request.getParameter("re_pass") : "" %>">
						</div>
						
						<% if ("emptyConfirmPassword".equals(status)) { %>
						    <p class="error">Please confirm your password.</p>
						<% } else if ("invalidConfirmPassword".equals(status)) { %>
						    <p class="error">Passwords do not match.</p>
						<% } %>


                        <!-- Phone -->
						<div class="form-group">
						    <label for="contact"><i class="zmdi zmdi-phone"></i></label>
						    <input type="text" name="contact" placeholder="Contact no"
						           value="<%= request.getParameter("contact") != null ? request.getParameter("contact") : "" %>">
						</div>
						
						<% if ("emptyPhone".equals(status)) { %>
						    <p class="error">Phone number must not be empty.</p>
						<% } else if ("invalidPhone".equals(status)) { %>
						    <p class="error">Phone number must be exactly 10 digits long.</p>
						<% } %>


                       <!-- Terms -->
						<div class="form-group">
						    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term"
						           <%= request.getParameter("agree-term") != null ? "checked" : "" %> />
						    <label for="agree-term" class="label-agree-term">
						        <span><span></span></span>
						        I agree all statements in <a href="#" class="term-service">Terms of service</a>
						    </label>
						</div>

						<% if ("termsNotAccepted".equals(status)) { %>
						    <p class="error">You must accept the terms of service to register.</p>
						<% } %>


                        <!-- Register Button -->
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                        </div>
                    </form>
                </div>

                <!-- Right Side Image -->
                <div class="signup-image">
                    <figure>
                        <img src="<%= request.getContextPath() %>/register/images/signup-image.jpg" alt="sign up image">
                    </figure>
                    <a href="${pageContext.request.contextPath}/register/login.jsp" class="signup-image-link">I am already member</a>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>
