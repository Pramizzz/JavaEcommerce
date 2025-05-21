<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>

<%
    User admin = (User) session.getAttribute("admin");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Settings</title>
  
    <style>
     
.main-content {
    margin-left: 220px;
    padding: 50px;
    min-height: 100vh;
    box-sizing: border-box;
}

/* Container for the Settings/Profile Card */
.settings-container {
    max-width: 900px;
    margin: auto;
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 0 25px rgba(0,0,0,0.15);
    padding: 40px;
}

/* Profile Header */
.profile-header {
    text-align: center;
    margin-bottom: 25px;
}

.profile-header h2 {
    font-size: 28px;
    margin: 0;
}

/* Profile Image */
.profile-image {
    width: 160px;
    height: 160px;
    border-radius: 50%;
    object-fit: cover;
    border: 4px solid #007BFF;
    margin-bottom: 20px;
    box-shadow: 0 8px 20px rgba(0, 123, 255, 0.3);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    display: inline-block;
}

.profile-image:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 25px rgba(0, 123, 255, 0.5);
}

/* Profile Info */
.profile-info {
    text-align: center;
    margin-bottom: 30px;
    font-size: 18px;
    color: #333;
}

.profile-info div {
    margin: 8px 0;
}

/* Button Group */
.button-group {
    text-align: center;
    margin-top: 25px;
}

.btn {
    padding: 14px 28px;
    font-size: 16px;
    margin: 0 12px;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
    user-select: none;
}

.edit-btn {
    background-color: #007BFF;
    color: white;
}

.edit-btn:hover {
    background-color: #0056b3;
}

.password-btn {
    background-color: #6f42c1;
    color: white;
}

.password-btn:hover {
    background-color: #563d7c;
}

/* Form Sections (Edit Profile & Change Password) */
.form-section {
    display: none; /* hidden by default */
    margin-top: 40px;
    font-size: 16px;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
}

.form-section label {
    display: block;
    margin-top: 20px;
    font-weight: bold;
    color: #444;
}

.form-section input[type="text"],
.form-section input[type="email"],
.form-section input[type="password"],
.form-section input[type="file"] {
    width: 100%;
    padding: 14px;
    margin-top: 8px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 15px;
    box-sizing: border-box;
    transition: border-color 0.3s ease;
}

.form-section input[type="text"]:focus,
.form-section input[type="email"]:focus,
.form-section input[type="password"]:focus,
.form-section input[type="file"]:focus {
    border-color: #007BFF;
    outline: none;
}

/* Save and Cancel buttons inside forms */
.form-section .btn {
    margin-top: 25px;
    font-size: 15px;
    background-color: #28a745;
    color: white;
    padding: 12px 24px;
    border-radius: 6px;
}

.form-section .btn:hover {
    background-color: #218838;
}

.form-section .cancel-btn {
    background-color: #dc3545;
    margin-left: 12px;
}

.form-section .cancel-btn:hover {
    background-color: #c82333;
} 
    </style>
</head>
<body>
 
<%@ include file="sidebar.jsp" %>
<!-- Main Content -->
<div class="main-content">
    <div class="settings-container">
        <div class="profile-header">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS9WDX7JlmoXx1-KXqPeJAwiS0xWGDmjBEWw&s" alt="Admin Image" class="profile-image">
            <h2>Admin Profile</h2>
        </div>

        <div class="profile-info">
    <%
        if (admin != null && "admin".equalsIgnoreCase(admin.getRole())) {
    %>
        <div><strong>Name:</strong> <%= admin.getName() != null ? admin.getName() : "N/A" %></div>
        <div><strong>Username:</strong> <%= admin.getUsername() != null ? admin.getUsername() : "N/A" %></div>
        <div><strong>Email:</strong> <%= admin.getEmail() != null ? admin.getEmail() : "N/A" %></div>
        <div><strong>Phone:</strong> <%= admin.getPhone() != null ? admin.getPhone() : "N/A" %></div>
        <div><strong>Role:</strong> <%= admin.getRole() != null ? admin.getRole() : "N/A" %></div>
    <%
        } else {
    %>
        <p style="color: red;">Admin is not logged in.</p>
    <%
        }
    %>
</div>


        <div class="button-group">
    <a href="<%= request.getContextPath() %>/pages/customer/Profile_Edit.jsp" class="btn edit-btn">
        <i class='bx bx-edit'></i> Edit Profile
    </a>
    <a href="<%= request.getContextPath() %>/pages/customer/change-password.jsp" class="btn password-btn">
        <i class='bx bx-lock-alt'></i> Change Password
    </a>
</div>


        <!-- Edit Profile Section -->
        <div class="form-section" id="editProfile" style="display:none;">
            <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
                <label for="username">New Username</label>
                <input type="text" name="username" value="<%= admin != null ? admin.getUsername() : "" %>" required>

                <label for="email">New Email</label>
                <input type="email" name="email" value="<%= admin != null ? admin.getEmail() : "" %>" required>

                <label for="phone">Phone</label>
                <input type="text" name="phone" value="<%= admin != null ? admin.getPhone() : "" %>">

                <button type="submit" class="btn">Save</button>
                <button type="button" class="btn cancel-btn" onclick="toggleSection('editProfile')">Cancel</button>
            </form>
        </div>

        <!-- Change Password Section -->
        <div class="form-section" id="changePassword" style="display:none;">
            <form action="changePassword.jsp" method="post">
                <label for="currentPassword">Current Password</label>
                <input type="password" name="currentPassword" required>

                <label for="newPassword">New Password</label>
                <input type="password" name="newPassword" required>

                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" name="confirmPassword" required>

                <button type="submit" class="btn">Change Password</button>
                <button type="button" class="btn cancel-btn" onclick="toggleSection('changePassword')">Cancel</button>
            </form>
        </div>
    </div>
</div>


</body>
</html>