<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
    <link rel="stylesheet" href="../../css/admincss/admindashbord.css">
</head>
<body>
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

        form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            max-width: 600px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="file"] {
            margin-top: 10px;
        }

        .form-button {
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-button:hover {
            background-color: #0056b3;
        }

        #categoryImagePreview {
            margin-top: 15px;
        }

        #categoryImagePreview img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

</style>
<!-- Sidebar -->
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

<!-- Header -->
<div class="header">
    <h1>Add New Category</h1>
</div>
<div id="logoutModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:1000;">
    <div style="background:white; width:300px; margin:100px auto; padding:20px; border-radius:8px; text-align:center;">
        <p>Are you sure you want to logout?</p>
        <button onclick="confirmLogout()" style="margin-right:10px; padding:8px 16px;">Yes</button>
        <button onclick="hideLogoutModal()" style="padding:8px 16px;">No</button>
    </div>
</div>


<!-- Main Content -->
<div class="content">
    <form action="${pageContext.request.contextPath}/CategoryServlet" method="post" enctype="multipart/form-data">
        <label for="categoryName">Category Name:</label>
        <input type = 'hidden' name = 'operation' value = 'addcategory'>
        <input type="text" id="categoryName" name="categoryName" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>


        <button type="submit" class="form-button">Add Category</button>
    </form>
</div>

<script>
    document.getElementById("categoryImage").addEventListener("change", function (event) {
        const preview = document.getElementById("categoryImagePreview");
        preview.innerHTML = "";

        const file = event.target.files[0];
        if (!file || !file.type.startsWith("image/")) return;

        const reader = new FileReader();
        reader.onload = function (e) {
            const img = document.createElement("img");
            img.src = e.target.result;
            preview.appendChild(img);
        };
        reader.readAsDataURL(file);
    });
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
