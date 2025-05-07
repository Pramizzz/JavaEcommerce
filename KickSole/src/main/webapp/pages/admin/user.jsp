<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <link rel="stylesheet" href="../../css/admincss/admindashbord.css">
    <title>Manage Users - Kicksole Admin</title>
    <style>
        .search-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .search-input:focus {
            border-color: #2980b9;
            box-shadow: 0 0 5px rgba(41, 128, 185, 0.4);
            outline: none;
        }

        .but {
            display: inline-block;
            padding: 6px 12px;
            margin: 2px;
            font-size: 14px;
            text-decoration: none;
            background-color: #3498db;
            color: white;
            border-radius: 4px;
            transition: background-color 0.3s ease;
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
<div id="logoutModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:1000;">
    <div style="background:white; width:300px; margin:100px auto; padding:20px; border-radius:8px; text-align:center;">
        <p>Are you sure you want to logout?</p>
        <button onclick="confirmLogout()" style="margin-right:10px; padding:8px 16px;">Yes</button>
        <button onclick="hideLogoutModal()" style="padding:8px 16px;">No</button>
    </div>
</div>

<div class="header">
    <h1>Manage Users</h1>
</div>

<div class="content">
    <div class="card">
        <h2>User List</h2>

        <!-- Search Input -->
        <input type="text" id="userSearch" class="search-input" placeholder="🔍 Search by name or email...">

        <table style="width:100%; border-collapse: collapse;" id="userTable">
            <thead style="background-color:#ecf0f1;">
                <tr>
                    <th style="text-align:left; padding:10px;">User ID</th>
                    <th style="text-align:left; padding:10px;">Name</th>
                    <th style="text-align:left; padding:10px;">Email</th>
                    <th style="text-align:left; padding:10px;">Role</th>
                    <th style="text-align:left; padding:10px;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="padding:10px;">U001</td>
                    <td style="padding:10px;">John Doe</td>
                    <td style="padding:10px;">john@example.com</td>
                    <td style="padding:10px;">User</td>
                    <td style="padding:10px;">
                        <a href="#" class="but">Edit</a> |
                        <a href="#" class="but">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td style="padding:10px;">U002</td>
                    <td style="padding:10px;">Jane Smith</td>
                    <td style="padding:10px;">jane@example.com</td>
                    <td style="padding:10px;">Admin</td>
                    <td style="padding:10px;">
                        <a href="#" class="but">Edit</a> |
                        <a href="#" class="but">Delete</a>
                    </td>
                </tr>
                <!-- Add more user rows here -->
            </tbody>
        </table>
    </div>

    <div class="card">
        <h3>Add New User</h3>
        <form>
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" style="width:100%; padding:8px; margin-bottom:10px;"><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" style="width:100%; padding:8px; margin-bottom:10px;"><br>

            <label for="role">Role:</label><br>
            <select id="role" name="role" style="width:100%; padding:8px; margin-bottom:10px;">
                <option value="User">User</option>
                <option value="Admin">Admin</option>
            </select><br>

            <button type="submit" style="padding:10px 15px; background-color:#2980b9; color:white; border:none; border-radius:4px;">Add User</button>
        </form>
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
