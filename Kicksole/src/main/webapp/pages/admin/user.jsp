<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.RegisterModelDAO" %>
<%@ page import="model.ListModel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admincss/admindashboard.css">
    <title>Manage Users - Kicksole Admin</title>
    <style>
        .btn {
            display: inline-block;
            padding: 6px 12px;
            margin: 2px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            text-align: center;
        }
        .btn-edit {
            background-color: #2ecc71;
        }
        .btn-edit:hover {
            background-color: #27ae60;
        }
        .btn-delete {
            background-color: #e74c3c;
        }
        .btn-delete:hover {
            background-color: #c0392b;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-family: Arial, sans-serif;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f9f9f9;
        }

        select.role-select {
            padding: 6px 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
            cursor: pointer;
        }

        .action-cell {
            display: flex;
            justify-content: center;
            gap: 8px;
        }

       
        .card h2 {
            margin-bottom: 10px;
        }

        .delete-btn {
            padding: 6px 12px;
            background-color: #e74c3c;
            color: white;
            font-weight: bold;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            border: none;
        }

        .delete-btn:hover {
            background-color: #c0392b;
            color: white;
        }
    </style>
</head>

<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="../customer/home.jsp">HomePage</a>
    <a href="<%= request.getContextPath() %>/pages/admin/adminDashboard.jsp">Dashboard</a>
    <a href="<%= request.getContextPath() %>/pages/admin/category.jsp">Add Category</a>
    <a href="../admin/AddBrand.jsp"> Add Brand</a>
    <a href="<%= request.getContextPath() %>/pages/admin/AddProducts.jsp">Products</a>
    <a href="<%= request.getContextPath() %>/pages/admin/user.jsp">Manage Users</a>
    <a href="<%= request.getContextPath() %>/pages/admin/order.jsp">Orders</a>
    <a href="<%= request.getContextPath() %>/pages/admin/report.jsp">Reports</a>
    <a href="<%= request.getContextPath() %>/pages/admin/setting.jsp">Settings</a>
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

        <%
            RegisterModelDAO dao = new RegisterModelDAO();
            List<ListModel> users = dao.getAllUsers();
        %>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Birthday</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            <%
                for (ListModel user : users) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getUsername() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getBirthday() %></td>
                <td><%= user.getContact() %></td>

                <!-- Role Dropdown -->
                <td>
                    <form action="<%= request.getContextPath() %>/updateRole" method="post">
                        <input type="hidden" name="id" value="<%= user.getId() %>" />
                        <select class="role-select" name="role">
                            <option value="customer" <%= "customer".equals(user.getRole()) ? "selected" : "" %>>customer</option>
                            <option value="admin" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>admin</option>
                        </select>
                </td>

                <!-- Actions -->
                <td class="action-cell">
                        <button type="submit" class="btn btn-edit" onclick="return confirm('Are you sure you want to update the role?');">Done</button>

                    </form>
                    <form action="<%= request.getContextPath() %>/deleteUser" method="get" onsubmit="return confirm('Are you sure you want to delete this user?');">
                        <input type="hidden" name="id" value="<%= user.getId() %>" />
                        <button type="submit" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
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
        window.location.href = "<%= request.getContextPath() %>/LogoutServlet";
    }
</script>

</body>
</html>
