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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admincss/Settingcss.css">
    <style>
       /* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

/* Sidebar Styles */
.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    width: 220px;
    height: 100%;
    background-color: #343a40;
    padding: 20px;
    box-sizing: border-box;
    color: white;
    font-weight: bold;
    overflow-y: auto;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 24px;
    border-bottom: 1px solid #495057;
    padding-bottom: 10px;
}

.sidebar a {
    display: block;
    padding: 12px 15px;
    color: white;
    text-decoration: none;
    margin-bottom: 8px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.sidebar a:hover {
    background-color: #007BFF;
    color: white;
}

/* Main Content Styles */
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

/* Logout Modal */
#logoutModal {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,0.5);
    z-index: 1000;
}

#logoutModal > div {
    background: white;
    width: 300px;
    margin: 100px auto;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
}

#logoutModal button {
    padding: 8px 16px;
    font-size: 16px;
    cursor: pointer;
    border: none;
    border-radius: 6px;
    margin: 0 10px;
    user-select: none;
}

#logoutModal button:first-child {
    background-color: #dc3545;
    color: white;
}

#logoutModal button:first-child:hover {
    background-color: #c82333;
}

#logoutModal button:last-child {
    background-color: #6c757d;
    color: white;
}

#logoutModal button:last-child:hover {
    background-color: #5a6268;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .sidebar {
        width: 180px;
    }
    .main-content {
        margin-left: 180px;
        padding: 30px 20px;
    }
    .settings-container {
        padding: 30px 20px;
    }
    .profile-image {
        width: 140px;
        height: 140px;
    }
}

@media (max-width: 480px) {
    .sidebar {
        position: relative;
        width: 100%;
        height: auto;
        padding: 10px 0;
    }
    .sidebar a {
        display: inline-block;
        margin: 5px 10px;
    }
    .main-content {
        margin-left: 0;
        padding: 20px 10px;
    }
    .settings-container {
        padding: 20px 10px;
    }
    .profile-image {
        width: 120px;
        height: 120px;
    }
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

<!-- Logout Modal -->
<div id="logoutModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:1000;">
    <div style="background:white; width:300px; margin:100px auto; padding:20px; border-radius:8px; text-align:center;">
        <p>Are you sure you want to logout?</p>
        <button onclick="confirmLogout()" style="margin-right:10px; padding:8px 16px;">Yes</button>
        <button onclick="hideLogoutModal()" style="padding:8px 16px;">No</button>
    </div>
</div>

<script>
    function showLogoutModal() {
        document.getElementById("logoutModal").style.display = "block";
    }

    function hideLogoutModal() {
        document.getElementById("logoutModal").style.display = "none";
    }

    function confirmLogout() {
        window.location.href = '<%= request.getContextPath() %>/LogoutServlet';
    }

    function toggleSection(id) {
        const section = document.getElementById(id);
        if(section.style.display === "block") {
            section.style.display = "none";
        } else {
            // Hide both first
            document.getElementById('editProfile').style.display = 'none';
            document.getElementById('changePassword').style.display = 'none';
            section.style.display = "block";
        }
    }
</script>

</body>
</html>