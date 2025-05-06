<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products Management</title>
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

    .btn {
        background-color: #28a745;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        margin-bottom: 20px;
    }

    .action-btn {
        padding: 6px 14px;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        margin-right: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .edit-btn {
        background-color: #ffc107;
        color: #212529;
    }

    .edit-btn:hover {
        background-color: #e0a800;
    }

    .delete-btn {
        background-color: #dc3545;
        color: white;
    }

    .delete-btn:hover {
        background-color: #c82333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
    }

    th, td {
        padding: 12px;
        border: 1px solid #ccc;
        text-align: left;
    }

    td img {
        width: 60px;
        height: auto;
        border-radius: 4px;
    }

    input[type="text"],
    input[type="number"],
    textarea,
    select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
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
        width: 100%;
        cursor: pointer;
        font-size: 16px;
    }

    .form-button:hover {
        background-color: #0056b3;
    }

    .variant-section {
        border: 1px solid #ddd;
        padding: 15px;
        margin-bottom: 15px;
        border-radius: 4px;
    }

    .variant-section h4 {
        margin-top: 0;
        color: #333;
        margin-bottom: 10px;
    }

    #imagePreview {
        margin-top: 15px;
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }

    #imagePreview img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    #productFormContainer {
        display: none;
        margin-top: 20px;
    }
</style>
<script>
    function toggleForm() {
        var formContainer = document.getElementById("productFormContainer");
        if (formContainer.style.display === "none") {
            formContainer.style.display = "block";
        } else {
            formContainer.style.display = "none";
        }
    }
</script>
</head>
<body>
<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>

<% if (success != null && success.equals("1")) { %>
    Product added successfully!
  
<% } else if (error != null && error.equals("1")) { %>
    Failed to add product. Please try again.

<% } %>
    ProductDAO dao = new ProductDAO();
    List<ProductModel> products = dao.getAllProducts(); // This should return products with variants + image
    int index = 1;
    for (ProductModel product : products) {
%>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="../admin/adminDashbord.jsp">Dashboard</a>
    <a href="../admin/category.jsp">Add Category</a>
    <a href="../admin/products.jsp">Products</a>
    <a href="../admin/user.jsp">Manage Users</a>
    <a href="../admin/order.jsp">Orders</a>
    <a href="../admin/report.jsp">Reports</a>
    <a href="../admin/setting.jsp">Settings</a>
    <a href="../home.jsp">Logout</a>
</div>

<div class="header">
    <h1>Product Management</h1>
</div>

<div class="content">
    <button class="btn" onclick="toggleForm()">Add Product</button>

    <div id="productFormContainer">
        <h2 style="margin-bottom: 20px;">Add New Product</h2>
        <form action="${pageContext.request.contextPath}/AddProductServlet" method="post" enctype="multipart/form-data">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" required>

            <label for="brandId">Brand:</label>
            <select id="brandId" name="brandId" required>
                <option value="">-- Select Brand --</option>
                <option value="1">Nike</option>
                <option value="2">Adidas</option>
            </select>

            <label for="categoryId">Category:</label>
            <select id="categoryId" name="categoryId" required>
                <option value="">-- Select Category --</option>
                <option value="1">Sneakers</option>
                <option value="2">Running Shoes</option>
            </select>

            <div class="variant-section">
                <h4>Variant</h4>
                <label for="size">Size:</label>
                <input type="text" id="size" name="variantSize">

                <label for="color">Color:</label>
                <input type="text" id="color" name="variantColor">
                <label for="stockQuantity">Stock Quantity:</label>
                <input type="number" id="stockQuantity" name="variantStock" min="0">
            </div>

            <label for="image">Select Images:</label>
            <input type="file" id="image" name="productImages" accept="image/*" multiple>

            <div id="imagePreview"></div>

            <button type="submit" class="form-button">Add Product</button>
        </form>
    </div>

    <hr style="margin: 40px 0;">
    
    <h2>Existing Products</h2>
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Image</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Price ($)</th>
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td><img src="images/mouse.jpg" alt="Wireless Mouse"></td>
                <td>Wireless Mouse</td>
                <td>Electronics</td>
                <td>15.99</td>
                <td>45</td>
                <td>
                    <button class="action-btn edit-btn">Edit</button>
                    <button class="action-btn delete-btn">Delete</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

</body>
</html>




















