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
    
    // Get first name for greeting
    String firstName = "";
    if (user.getName() != null && !user.getName().isEmpty()) {
        int spaceIndex = user.getName().indexOf(" ");
        if (spaceIndex > 0) {
            firstName = user.getName().substring(0, spaceIndex);
        } else {
            firstName = user.getName();
        }
    } else {
        firstName = user.getUsername();
    }
    
    // Format birthday if available
    String formattedBirthday = "Not provided";
    if (user.getBirthday() != null && !user.getBirthday().isEmpty()) {
        try {
            java.text.SimpleDateFormat dbFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.text.SimpleDateFormat displayFormat = new java.text.SimpleDateFormat("MMMM d, yyyy");
            java.util.Date date = dbFormat.parse(user.getBirthday());
            formattedBirthday = displayFormat.format(date);
        } catch (Exception e) {
            // Keep default if parsing fails
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Jordan Shadow Sneaks Hub - Dashboard</title>
    <meta name="description" content="Premium Jordan sneakers collection" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/javascript/script.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

    <style>
        .dashboard-content {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: #1a1a1a;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.4);
        }

        .dashboard-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #333;
        }

        .dashboard-header h2 {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            color: #fff;
        }

        .profile-badge {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: linear-gradient(45deg, #ff9966, #ff5e62);
            font-size: 2rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: white;
        }

        .profile-info {
            padding: 1.5rem;
            background: #252525;
            border-radius: 8px;
        }

        .user-detail {
            margin-bottom: 1rem;
            padding: 0.8rem;
            background: #1e1e1e;
            border-radius: 6px;
        }

        .user-detail-label {
            color: #ff9966;
            font-size: 0.9rem;
            margin-bottom: 0.3rem;
        }

        .user-detail-value {
            color: #fff;
            font-size: 1rem;
        }

        .profile-actions {
            margin-top: 2rem;
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .profile-btn {
            padding: 0.8rem 1.5rem;
            background: #ff5e62;
            color: white;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .profile-btn:hover {
            background: #ff4757;
            transform: translateY(-2px);
        }
        
        .orders-section {
            margin-top: 2rem;
        }
        
        .orders-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }
        
        .orders-title {
            color: #fff;
            font-size: 1.2rem;
        }
        
        .view-all {
            color: #ff9966;
            text-decoration: none;
        }
        
        .view-all:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div id="root">
    <%@ include file="navbar.jsp" %>

    <div class="dashboard-content">
        <div class="dashboard-header">
            <h2>Welcome, <%= firstName %>!</h2>
            <p class="dashboard-subtitle">Your Account Overview</p>
        </div>

        <div class="profile-badge">
            <% 
            String initials = "";
            if (user.getName() != null && !user.getName().isEmpty()) {
                String[] nameParts = user.getName().split(" ");
                if (nameParts.length > 0) {
                    initials += nameParts[0].substring(0, 1).toUpperCase();
                }
                if (nameParts.length > 1) {
                    initials += nameParts[1].substring(0, 1).toUpperCase();
                }
            }
            if (initials.isEmpty()) {
                initials = user.getUsername().substring(0, Math.min(2, user.getUsername().length())).toUpperCase();
            }
            %>
            <%= initials %>
        </div>

        <div class="profile-info">
            
            <div class="user-detail">
                <div class="user-detail-label">Full Name</div>
                <div class="user-detail-value">
                    <%= user.getName() != null && !user.getName().isEmpty() ? user.getName() : "Not provided" %>
                </div>
            </div>

            <div class="user-detail">
                <div class="user-detail-label">Username</div>
                <div class="user-detail-value">
                    @<%= user.getUsername() %>
                </div>
            </div>
            
            <div class="user-detail">
                <div class="user-detail-label">Email</div>
                <div class="user-detail-value">
                    <%= user.getEmail() %>
                </div>
            </div>

            <div class="user-detail">
                <div class="user-detail-label">Birthday</div>
                <div class="user-detail-value">
                    <%= formattedBirthday %>
                </div>
            </div>

            <div class="user-detail">
                <div class="user-detail-label">Phone Number</div>
                <div class="user-detail-value">
                    <% if (user.getPhone() != null && !user.getPhone().isEmpty()) { %>
                        <%= user.getPhone() %>
                    <% } else { %>
                        Not provided
                    <% } %>
                </div>
            </div>

            <div class="user-detail">
                <div class="user-detail-label">Account Type</div>
                <div class="user-detail-value">
                    <%= user.getRole() != null ? user.getRole().toUpperCase() : "CUSTOMER" %>
                </div>
            </div>

            <div class="profile-actions">
               <a href="<%= request.getContextPath() %>/pages/customer/Profile_Edit.jsp" class="profile-btn">
                    <i class='bx bx-edit'></i> Edit Profile
                </a>
                <a href="${pageContext.request.contextPath}/ChangePasswordServlet" class="profile-btn">
                    <i class='bx bx-lock-alt'></i> Change Password
                </a>
            </div>
        </div>
        
        <!-- Recent Orders section if the user is a customer -->
        <% if (user.getRole() != null && user.getRole().equalsIgnoreCase("customer")) { %>
        <div class="orders-section">
            <div class="orders-header">
                <h3 class="orders-title">Recent Orders</h3>
                <a href="${pageContext.request.contextPath}/OrderHistoryServlet" class="view-all">View All</a>
            </div>
            <div class="profile-info">
                <!-- This section would typically be populated with order data from the database -->
                <p style="color: #ccc; text-align: center; padding: 1rem;">Your recent orders will appear here.</p>
            </div>
        </div>
        <% } %>
        

    </div>

    <%@ include file="footer.jsp" %>
</div>

<script>
    // Add any JavaScript needed for the dashboard here
    document.addEventListener('DOMContentLoaded', function() {
        console.log('Dashboard loaded successfully');
    });
</script>
</body>
</html>