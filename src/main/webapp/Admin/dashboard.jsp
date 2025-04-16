<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
    <div class="sidebar">
        <div class="logo">AdminPanel</div>
        <ul class="nav-menu">
            <li class="nav-item"><a href="dashboard.jsp">Dashboard</a></li>
            <li class="nav-item"><a href="users.html">Users</a></li>
            <li class="nav-item"><a href="addproduct.jsp">Products</a></li>
            <li class="nav-item"><a href="orders.jsp">Orders</a></li>
            <li class="nav-item"><a href="settings.jsp">Settings</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Dashboard Overview</h1>
            <div class="header-actions">
                <button class="btn btn-primary">New Order</button>
                <button class="btn btn-success">Add Product</button>
            </div>
        </div>

        <div class="stats-container">
            <div class="stat-card">
                <h3>Total Sales</h3>
                <p>$24,500</p>
            </div>
            <div class="stat-card">
                <h3>New Orders</h3>
                <p>145</p>
            </div>
            <div class="stat-card">
                <h3>Active Users</h3>
                <p>2,356</p>
            </div>
            <div class="stat-card">
                <h3>Conversion Rate</h3>
                <p>64%</p>
            </div>
        </div>

        <div class="chart-container">
            <h2>Sales Overview</h2>
            <div style="height: 300px; background: #f8f9fa; border-radius: 8px;">
                Chart placeholder
            </div>
        </div>

        <div class="recent-orders">
            <h2>Recent Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#1234</td>
                        <td>John Doe</td>
                        <td>$450</td>
                        <td>Completed</td>
                        <td><button class="btn btn-primary">View</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

</body>
</html>