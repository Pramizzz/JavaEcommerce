<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.List" %>
<%@ page import="model.AddCategory" %>
<%@ page import="DAO.CategoryModelDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admincss/admindashbord.css">
    <style>
        /* [Same styles as before] */
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
    <a href="${pageContext.request.contextPath}/pages/admin/category.jsp">Add Category</a>
    <a href="${pageContext.request.contextPath}/pages/admin/Addproducts.jsp">Products</a>
    <a href="${pageContext.request.contextPath}/pages/admin/user.jsp">Manage Users</a>
    <a href="${pageContext.request.contextPath}/pages/admin/order.jsp">Orders</a>
    <a href="${pageContext.request.contextPath}/pages/admin/report.jsp">Reports</a>
    <a href="${pageContext.request.contextPath}/pages/admin/setting.jsp">Settings</a>
    <a href="#" onclick="showLogoutModal()">Logout</a>
</div>

<div class="header">
    <h1>Add New Category</h1>
</div>

<div class="content">
    <!-- Message Display -->
    <%
        String message = (String) request.getAttribute("message");
        String status = (String) request.getAttribute("status");
        if (message != null && status != null) {
    %>
        <div class="message <%= status.equals("success") ? "success" : "error" %>">
            <%= message %>
        </div>
    <%
        }
    %>

    <!-- Add Category Form -->
    <form action="${pageContext.request.contextPath}/CategoryServlet" method="post">
        <input type="hidden" name="operation" value="addcategory">
        <label for="categoryName">Category Name:</label>
        <input type="text" id="categoryName" name="categoryName" required>
        <button type="submit" class="form-button">Add Category</button>
    </form>

<h2>Existing Categories</h2>

<%
    List<AddCategory> categories = new java.util.ArrayList<>();
    try {
        CategoryModelDAO dao = new CategoryModelDAO();
        categories = dao.getAllCategories();
    } catch (Exception e) {
        e.printStackTrace();
    }
    request.setAttribute("categories", categories);
%>


<table border="1" style="width: 80%; margin: auto; border-collapse: collapse; text-align: center;">
    <thead style="background-color: #f2f2f2;">
        <tr> 
            <th style="padding: 10px;">Category ID</th>
            <th style="padding: 10px;">Category Name</th>
            <th style="padding: 10px;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="cat" items="${categories}">
            <tr>
                <form action="${pageContext.request.contextPath}/CategoryServlet" method="post">
                    <td style="padding: 10px;">
                        <input type="hidden" name="categoryId" value="${cat.categoryId}" />
                        ${cat.categoryId}
                    </td>
                    <td style="padding: 10px;">
                        <input type="text" name="categoryName" value="${cat.categoryName}" style="width: 90%;" />
                    </td>
                    <td style="padding: 10px;">
                        <input type="hidden" name="operation" value="updatecategory" />
                        <button type="submit" style="margin-bottom: 5px;">Update</button>
                </form>

                <form action="${pageContext.request.contextPath}/CategoryServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this category?');">
                    <input type="hidden" name="operation" value="deletecategory" />
                    <input type="hidden" name="categoryId" value="${cat.categoryId}" />
                    <button type="submit">Delete</button>
                </form>
                    </td>
            </tr>
        </c:forEach>
    </tbody>
</table>


</div>

<!-- Logout modal script -->
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