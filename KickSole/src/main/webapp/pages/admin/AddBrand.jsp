<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Brand</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admincss/admindashbord.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
        }
        .sidebar {
            height: 100vh;
            width: 220px;
            background-color: #2c3e50;
            position: fixed;
            left: 0;
            top: 0;
            color: white;
            padding-top: 20px;
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
        .header {
            margin-left: 220px;
            padding: 20px;
            background-color: #2980b9;
            color: white;
        }
        .content {
            margin-left: 220px;
            padding: 30px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        .form-button {
            margin-top: 15px;
            padding: 8px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .form-button:hover {
            background-color: #2980b9;
        }
        .message {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            font-weight: bold;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="${pageContext.request.contextPath}/pages/admin/adminDashbord.jsp">Dashboard</a>
    <a href="${pageContext.request.contextPath}/pages/admin/category.jsp">Category</a>
    <a href="${pageContext.request.contextPath}/pages/admin/brand.jsp">Brand</a>
    <a href="${pageContext.request.contextPath}/pages/admin/Addproducts.jsp">Products</a>
    <a href="${pageContext.request.contextPath}/pages/admin/user.jsp">Manage Users</a>
    <a href="${pageContext.request.contextPath}/pages/admin/order.jsp">Orders</a>
    <a href="${pageContext.request.contextPath}/pages/admin/report.jsp">Reports</a>
    <a href="${pageContext.request.contextPath}/pages/admin/setting.jsp">Settings</a>
    <a href="#" onclick="showLogoutModal()">Logout</a>
</div>

<div class="header">
    <h1>Add New Brand</h1>
</div>

<div class="content">
    <!-- Message Display -->
    <c:if test="${not empty message && not empty status}">
        <div class="message ${status == 'success' ? 'success' : 'error'}">
            ${message}
        </div>
    </c:if>

    <!-- Add Brand Form -->
    <form action="${pageContext.request.contextPath}/AddBrandServlet" method="post">
        <input type="hidden" name="operation" value="addbrand">
        <label for="brandName">Brand Name:</label>
        <input type="text" id="brandName" name="brandName" required>
        <button type="submit" class="form-button">Add Brand</button>
    </form>

    <h2>Existing Brands</h2>
    <table border="1" style="width: 80%; margin: auto; border-collapse: collapse; text-align: center;">
        <thead style="background-color: #f2f2f2;">
            <tr>
                <th style="padding: 10px;">Brand ID</th>
                <th style="padding: 10px;">Brand Name</th>
                <th style="padding: 10px;">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="brand" items="${brands}">
                <tr>
                    <form action="${pageContext.request.contextPath}/AddBrandServlet" method="post">
                        <td style="padding: 10px;">
                            <input type="hidden" name="brandId" value="${brand.brandId}" />
                            ${brand.brandId}
                        </td>
                        <td style="padding: 10px;">
                            <input type="text" name="brandName" value="${brand.brandName}" style="width: 90%;" />
                        </td>
                        <td style="padding: 10px;">
                            <input type="hidden" name="operation" value="updatebrand" />
                            <button type="submit" style="margin-bottom: 5px;">Update</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/AddBrandServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this brand?');">
                        <input type="hidden" name="operation" value="deletebrand" />
                        <input type="hidden" name="brandId" value="${brand.brandId}" />
                        <button type="submit">Delete</button>
                    </form>
                        </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
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
