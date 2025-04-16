<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="stylesheet" href="../css/admin.css">
    <style>
        /* Add to existing CSS */
        .user-management {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .search-filter {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .search-box {
            padding: 8px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .user-table {
            width: 100%;
            border-collapse: collapse;
        }

        .user-table th {
            background: #f8f9fa;
            padding: 12px;
            text-align: left;
        }

        .user-table td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .status-active {
            color: #2ecc71;
            font-weight: 500;
        }

        .status-inactive {
            color: #e74c3c;
            font-weight: 500;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-danger {
            background: #e74c3c;
            color: white;
        }

        .btn-warning {
            background: #f1c40f;
            color: white;
        }

        .add-user-form {
            margin-top: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <!-- Keep the same sidebar -->
    <div class="sidebar">
        <div class="logo">AdminPanel</div>
        <ul class="nav-menu">
            <li class="nav-item"><a href="dashboard.jsp">Dashboard</a></li>
            <li class="nav-item"><a href="users.jsp">Users</a></li>
            <li class="nav-item"><a href="addproduct.jsp">Products</a></li>
            <li class="nav-item"><a href="orders.jsp">Orders</a></li>
            <li class="nav-item"><a href="settings.jsp">Settings</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>User Management</h1>
            <div class="header-actions">
                <button class="btn btn-primary" onclick="showAddUserForm()">Add New User</button>
            </div>
        </div>

        <div class="user-management">
            <div class="search-filter">
                <input type="text" class="search-box" placeholder="Search users...">
                <select class="form-control" style="width: 200px;">
                    <option>Filter by status</option>
                    <option>Active</option>
                    <option>Inactive</option>
                </select>
            </div>

            <table class="user-table">
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <img src="avatar1.jpg" class="user-avatar">
                            abin
                        </td>
                        <td>adfasdfsdfasdx.com</td>
                        <td>Administrator</td>
                        <td class="status-active">Active</td>
                        <td>
                            <div class="action-buttons">
                                <button class="btn btn-warning">Edit</button>
                                <button class="btn btn-danger">Delete</button>
                            </div>
                        </td>
                    </tr>
                    <!-- Add more user rows -->
                </tbody>
            </table>

            <div class="add-user-form" id="addUserForm" style="display: none;">
                <h3>Add New User</h3>
                <form>
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Role</label>
                        <select class="form-control">
                            <option>Administrator</option>
                            <option>Editor</option>
                            <option>Subscriber</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" required>
                    </div>
                    <div class="action-buttons">
                        <button type="submit" class="btn btn-success">Create User</button>
                        <button type="button" class="btn btn-danger" onclick="hideAddUserForm()">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

   
</body>
</html>