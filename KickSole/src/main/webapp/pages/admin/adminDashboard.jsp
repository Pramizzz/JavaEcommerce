<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/admincss/admindashbord.css">
<title>Kicksole Admin Dashboard</title>
<style>
/* Modal Style */
#logoutModal {
    display: none;
    position: fixed;
    z-index: 9999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fff;
    margin: 15% auto;
    padding: 20px;
    border-radius: 8px;
    width: 300px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.modal-content button {
    padding: 10px 20px;
    margin: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

#yesBtn {
    background-color: #e74c3c;
    color: white;
}

#noBtn {
    background-color: #2ecc71;
    color: white;
}
</style>
</head>
<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="../admin/adminDashbord.jsp">Dashboard</a>
    <a href="../admin/category.jsp">Add Category</a>
    <a href="../admin/addproducts.jsp">Products</a>
    <a href="../admin/user.jsp">Manage Users</a>
    <a href="../admin/order.jsp">Orders</a>
    <a href="../admin/report.jsp">Reports</a>
    <a href="../admin/setting.jsp">Settings</a>
    <a href="#" onclick="showLogoutModal()">Logout</a>
</div>

<div class="header">
    <h1>Welcome, Admin</h1>
</div>

<div class="content">
    <div class="card">
        <h2>Quick Stats</h2>
        <p>Categories: <strong>12</strong></p>
        <p>Products: <strong>250</strong></p>
        <p>Users: <strong>1,450</strong></p>
        <p>Pending Orders: <strong>7</strong></p>
    </div>

    <div class="card">
        <h3>Recent Orders</h3>
        <ul>
            <li>Order #1023 - $59.99 - <em>Pending</em></li>
            <li>Order #1022 - $119.49 - <em>Shipped</em></li>
            <li>Order #1021 - $24.00 - <em>Delivered</em></li>
        </ul>
    </div>

    <div class="card">
        <h3>Admin Actions</h3>
        <ul>
            <li><a href="#">➕ Add New Category</a></li>
            <li><a href="#">📦 Add New Product</a></li>
            <li><a href="#">👥 Manage Users</a></li>
            <li><a href="#">📊 View Reports</a></li>
        </ul>
    </div>
</div>

<!-- Logout Confirmation Modal -->
<div id="logoutModal">
    <div class="modal-content">
        <p>Are you sure you want to logout?</p>
        <button id="yesBtn" onclick="confirmLogout()">Yes</button>
        <button id="noBtn" onclick="hideLogoutModal()">No</button>
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
    window.location.href = '../home.jsp';
}
</script>

</body>
</html>
