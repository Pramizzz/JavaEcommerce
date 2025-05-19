<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Settings</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admincss/admindashboard.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .main-content {
            margin-left: 220px;
            padding: 50px;
        }

        .settings-container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 0 25px rgba(0,0,0,0.15);
            padding: 40px;
        }

        .profile-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .profile-image {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007BFF;
            margin-bottom: 20px;
        }

        .profile-info {
            text-align: center;
            margin-bottom: 30px;
            font-size: 18px;
        }

        .profile-info div {
            margin: 8px 0;
        }

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
            transition: background-color 0.3s;
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

        .form-section {
            display: none;
            margin-top: 40px;
            font-size: 16px;
        }

        .form-section label {
            display: block;
            margin-top: 20px;
            font-weight: bold;
        }

        .form-section input {
            width: 100%;
            padding: 14px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .form-section .btn {
            margin-top: 25px;
            font-size: 15px;
            background-color: #28a745;
            color: white;
        }

        .form-section .cancel-btn {
            background-color: #dc3545;
            margin-left: 12px;
        }
        .profile-image {
    width: 180px;
    height: 180px;
    border-radius: 50%;
    object-fit: cover;
    border: 5px solid #007BFF;
    box-shadow: 0 8px 20px rgba(0, 123, 255, 0.3);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.profile-image:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 25px rgba(0, 123, 255, 0.5);
}
        
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="../customer/home.jsp">HomePage</a>
    <a href="<%= request.getContextPath() %>/pages/admin/adminDashboard.jsp">Dashboard</a>
    <a href="<%= request.getContextPath() %>/pages/admin/category.jsp">Add Category</a>
    <a href="../admin/AddBrand.jsp"> Add Brand</a>
    <a href="<%= request.getContextPath() %>/pages/admin/AddProducts.jsp">Products</a>
    
    <a href="<%= request.getContextPath() %>/pages/admin/user.jsp">Manage Users</a>
    <a href="<%= request.getContextPath() %>/pages/admin/order.jsp">Orders</a>
    <a href="<%= request.getContextPath() %>/pages/admin/report.jsp">Reports</a>
    <a href="<%= request.getContextPath() %>/pages/admin/setting.jsp">Settings</a>
    <a href="#" onclick="showLogoutModal()">Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="settings-container">
        <div class="profile-header">
            <img src="https://boreddaddy.com/wp-content/uploads/2021/09/ashly1-495x500.jpg" alt="Admin Image" class="profile-image">
            <h2>Admin Profile</h2>
        </div>

        <div class="profile-info">
            <div><strong>Username:</strong> Susmarika Koirala</div>
            <div><strong>Email:</strong> susmarikakoirala06@gmail.com</div>
            <div><strong>Phone:</strong> 981232355</div>
            <div><strong>Role:</strong> Admin</div>
           
        </div>

        <div class="button-group">
            <button class="btn edit-btn" onclick="toggleSection('editProfile')">Edit Profile</button>
            <button class="btn password-btn" onclick="toggleSection('changePassword')">Change Password</button>
        </div>

        <!-- Edit Profile Section -->
        <div class="form-section" id="editProfile">
            <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
                <label for="username">New Username</label>
                <input type="text" name="username" value="admin123" required>

                <label for="email">New Email</label>
                <input type="email" name="email" value="admin@example.com" required>

                <label for="phone">Phone</label>
                <input type="text" name="phone" value="+91 9876543210">

                <label for="image">Change Profile Image</label>
                <input type="file" name="image">

                <button type="submit" class="btn">Save</button>
                <button type="button" class="btn cancel-btn" onclick="toggleSection('editProfile')">Cancel</button>
            </form>
        </div>

        <!-- Change Password Section -->
        <div class="form-section" id="changePassword">
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

<!-- JavaScript -->
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
        section.style.display = section.style.display === "block" ? "none" : "block";
    }
</script>

</body>
</html>