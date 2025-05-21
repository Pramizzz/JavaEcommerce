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

/* Logout Modal Styles */
#logoutModal {
    display: none;
    position: fixed;
    top: 35%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: white;
    border: 2px solid #ccc;
    border-radius: 10px;
    padding: 20px;
    z-index: 3000;
    text-align: center;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
}

#logoutModal button {
    margin: 10px;
    padding: 8px 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

#logoutModal button#yesBtn {
    background-color: #e74c3c;
    color: white;
}

#logoutModal button#noBtn {
    background-color: #bdc3c7;
    color: black;
}
</style>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="<%= request.getContextPath() %>/pages/customer/home.jsp">HomePage</a>
    <a href="<%= request.getContextPath() %>/pages/admin/adminDashboard.jsp">Dashboard</a>
    <a href="<%= request.getContextPath() %>/pages/admin/category.jsp">Add Category</a>
    <a href="<%= request.getContextPath() %>/pages/admin/AddBrand.jsp">Add Brand</a>
    <a href="<%= request.getContextPath() %>/pages/admin/AddProducts.jsp">Products</a>
    <a href="<%= request.getContextPath() %>/pages/admin/user.jsp">Manage Users</a>
    <a href="<%= request.getContextPath() %>/pages/admin/order.jsp">Orders</a>
    <a href="<%= request.getContextPath() %>/pages/admin/report.jsp">Reports</a>
    <a href="<%= request.getContextPath() %>/pages/admin/setting.jsp">Settings</a>
    <a href="javascript:void(0);" onclick="showLogoutModal()">Logout</a>
</div>

<!-- Logout Confirmation Modal -->
<div id="logoutModal">
    <p>Are you sure you want to logout?</p>
    <form action="<%= request.getContextPath() %>/LogoutServlet" method="get" style="display: inline;">
        <button type="submit" id="yesBtn">Yes</button>
    </form>
    <button id="noBtn" onclick="hideLogoutModal()">No</button>
</div>

<script>
function showLogoutModal() {
    document.getElementById("logoutModal").style.display = "block";
}
function hideLogoutModal() {
    document.getElementById("logoutModal").style.display = "none";
}
</script>
