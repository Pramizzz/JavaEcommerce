<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sales Report - Kicksole Admin</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admincss/admindashboard.css">
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

    .filter-section {
        margin-bottom: 20px;
    }

    .filter-section label {
        margin-right: 10px;
    }

    .stat-card-container {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    .stat-card {
        background-color: #ecf0f1;
        padding: 20px;
        border-radius: 8px;
        text-align: center;
        flex: 1;
        margin: 0 10px;
    }

    .stat-card h4 {
        margin: 10px 0;
    }

    .stat-card p {
        font-size: 18px;
        font-weight: bold;
    }

    .card {
        margin-top: 20px;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>
<%@ include file="sidebar.jsp" %>

<div class="header">
    <h1>Sales Report</h1>
</div>

<div class="content">
    <!-- Stats Section (Grouped in one box) -->
    <div class="stat-card-container">
        <div class="stat-card">
            <h4>Total Sales Today</h4>
            <p>$1,200.00</p> <!-- Example value, replace with dynamic data -->
        </div>

        <div class="stat-card">
            <h4>Total Sales This Month</h4>
            <p>$15,350.00</p> <!-- Example value, replace with dynamic data -->
        </div>

        <div class="stat-card">
            <h4>Total Orders This Month</h4>
            <p>320 Orders</p> <!-- Example value, replace with dynamic data -->
        </div>
    </div>

    <!-- Filter Sales Report -->
    <div class="card">
        <h3>Filter Sales Report</h3>
        <div class="filter-section">
            <form action="#" method="POST">
                <label for="startDate">Start Date:</label>
                <input type="date" id="startDate" name="startDate" style="padding:8px; margin-right:10px;">
                <label for="endDate">End Date:</label>
                <input type="date" id="endDate" name="endDate" style="padding:8px; margin-right:10px;">
                <button type="submit" class="but">Generate Report</button>
            </form>
        </div>
    </div>

    <!-- Sales Overview Table -->
    <div class="card">
        <h3>Sales Overview</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Total Amount</th>
                    <th>Payment Status</th>
                    <th>Order Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>ORD001</td>
                    <td>John Doe</td>
                    <td>$59.99</td>
                    <td>Paid</td>
                    <td>2025-05-03</td>
                    <td>
                        <a href="#" class="but">View Details</a>
                    </td>
                </tr>
                <tr>
                    <td>ORD002</td>
                    <td>Jane Smith</td>
                    <td>$120.00</td>
                    <td>Paid</td>
                    <td>2025-05-01</td>
                    <td>
                        <a href="#" class="but">View Details</a>
                    </td>
                </tr>
                <!-- More rows can be dynamically added here -->
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
	window.location.href = '<%= request.getContextPath() %>/LogoutServlet';
}
</script>

</body>
</html>