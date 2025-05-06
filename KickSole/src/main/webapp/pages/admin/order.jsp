<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Orders - Kicksole Admin</title>
<link rel="stylesheet" href="../../css/admincss/admindashbord.css">
<style>
.search-input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}

.table th, .table td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}

.table th {
    background-color: #ecf0f1;
}

.but {
    background-color: #3498db;
    color: white;
    padding: 6px 12px;
    border-radius: 4px;
    text-decoration: none;
    margin: 2px;
    display: inline-block;
}

.but:hover {
    background-color: #2980b9;
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
    <h1>Manage Orders</h1>
</div>

<div class="content">
    <div class="card">
        <input type="text" id="searchInput" class="search-input" placeholder="Search orders by ID, customer name, or status..." onkeyup="filterOrders()">

        <table class="table" id="ordersTable">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>ORD001</td>
                    <td>John Doe</td>
                    <td>$59.99</td>
                    <td>Pending</td>
                    <td>2025-05-03</td>
                    <td>
                        <a href="#" class="but">Update</a>
                        <a href="#" class="but">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>ORD002</td>
                    <td>Jane Smith</td>
                    <td>$120.00</td>
                    <td>Shipped</td>
                    <td>2025-05-01</td>
                    <td>
                        <a href="#" class="but">Update</a>
                        <a href="#" class="but">Delete</a>
                    </td>
                </tr>
                <!-- More sample rows -->
            </tbody>
        </table>
    </div>
</div>

<!-- Logout Confirmation Modal -->
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
    window.location.href = '../home.jsp';
}

function filterOrders() {
    var input = document.getElementById("searchInput");
    var filter = input.value.toLowerCase();
    var table = document.getElementById("ordersTable");
    var rows = table.getElementsByTagName("tr");

    for (var i = 1; i < rows.length; i++) {
        var row = rows[i];
        var text = row.textContent.toLowerCase();
        row.style.display = text.includes(filter) ? "" : "none";
    }
}
</script>

</body>
</html>
