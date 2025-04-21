<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../admincss/admindashboard.css">
<title>Kicksole Admin Dashboard</title>
<
</head>
<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="#">Dashboard</a>
    <a href="">Add Category</a>
    <a href="../admin/products.jsp">Products</a>

    <a href="#">Manage Users</a>
    <a href="#">Orders</a>
    <a href="#">Reports</a>
    <a href="#">Settings</a>
    <a href="#">Logout</a>
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

</body>
</html>
