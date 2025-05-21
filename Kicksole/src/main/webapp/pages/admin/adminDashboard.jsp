<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DAO.DashboardDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admincss/admindashboard.css">

<title>Kicksole Admin Dashboard</title>
<style>


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
<%@ include file="sidebar.jsp" %>

<div class="header">
    <h1>Dashboard</h1>
    <div class="welcome">Welcome, Admin</div>
</div>



<%
    int totalCategories = 0;
    int totalBrands = 0;
    int totalProducts = 0;
    int totalUsers = 0;
    int totalOrders =0;
    int pendingOrders = 0;
    int shippedOrders = 0;
    int canceledOrders = 0;
    int deliveredOrders = 0;
   

    try {
        DashboardDAO dao = new DashboardDAO();

        totalCategories = dao.getTotalCategories();
        totalBrands = dao.getTotalBrands();
        totalProducts = dao.getTotalProducts();
        totalUsers = dao.getTotalUsers();
        totalOrders = dao.getTotalOrders();
        shippedOrders = dao.getShippedOrders();
        canceledOrders = dao.getCancelledOrders();
        deliveredOrders = dao.getDeliveredOrders();
        pendingOrders=dao.getPendingOrders();
  
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error fetching dashboard data: " + e.getMessage() + "</p>");
    }
%>

<div class="content">
   <div class="card">
    <h2>Quick Stats</h2>
    <p>Categories: <strong><%= totalCategories %></strong></p>
    <p>Brands: <strong><%= totalBrands %></strong></p>
    <p>Products: <strong><%= totalProducts %></strong></p>
    <p>Users: <strong><%= totalUsers %></strong></p>
    

</div>
    <div class="card">
        <h3>Recent Orders</h3>
        <ul>
     <p>Total Orders: <strong><%= totalOrders %></strong></p>
    <p>Pending Orders: <strong><%= pendingOrders %></strong></p>
    <p>Shipped Orders: <strong><%= shippedOrders %></strong></p>
    <p>Canceled Orders: <strong><%= canceledOrders %></strong></p>
    <p>Delivered Orders: <strong><%= deliveredOrders %></strong></p>
        </ul>
    </div>

    <div class="card">
        <h3>Admin Actions</h3>
        <ul>
            <li><a href="<%= request.getContextPath() %>/pages/admin/category.jsp">➕ Add New Category</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/admin/AddProducts.jsp">📦 Add New Product</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/admin/user.jsp">👥 Manage Users</a></li>
            <li><a href="report.jsp">📊 View Reports</a></li>
        </ul>
    </div>
</div>


</body>
</html>