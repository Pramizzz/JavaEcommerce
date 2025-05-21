<style>


.sidebar {
    height: 100vh;
    width: 220px;
    background-color: #2c3e50;
    position: fixed;
    left: 0;
    top: 0;
    color: white;
    padding-top: 20px;
    z-index: 2000;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
}

.sidebar a {
    display: block;
    padding: 15px 20px;
    color: white;
    text-decoration: none;
}

.sidebar a:hover {
    background-color: #34495e;
}
</style>
<div class="sidebar">
    <h2>Admin Panel</h2>
   <a href="<%= request.getContextPath() %>/pages/customer/home.jsp">HomePage</a>
    <a href="<%= request.getContextPath() %>/pages/admin/adminDashboard.jsp">Dashboard</a>
    <a href="<%= request.getContextPath() %>/pages/admin/category.jsp">Add Category</a>
    <a href="<%= request.getContextPath() %>/pages/admin/AddBrand.jsp"> Add Brand</a>
    <a href="<%= request.getContextPath() %>/pages/admin/AddProducts.jsp">Products</a>
    <a href="<%= request.getContextPath() %>/pages/admin/user.jsp">Manage Users</a>
    <a href="<%= request.getContextPath() %>/pages/admin/order.jsp">Orders</a>
    <a href="<%= request.getContextPath() %>/pages/admin/report.jsp">Reports</a>
    <a href="<%= request.getContextPath() %>/pages/admin/setting.jsp">Settings</a>
    <a href="#" onclick="showLogoutModal()">Logout</a>
</div>