<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.DisplayProductmodel,DAO.AddProductDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="../../css/admincss/adminproduct.css">
<meta charset="UTF-8">
<title>Products Management</title>
<style>
/* [existing styles remain unchanged] */
/* Add Product Button */
#toggleProductForm {
    background-color: #28a745;
    color: white;
    padding: 10px 20px;
    border-radius: 6px;
    border: none;
    cursor: pointer;
    font-size: 16px;
    margin-bottom: 20px;
}

#toggleProductForm:hover {
    background-color: #218838;
}
</style>
</head>
<body>

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
    <button id="toggleProductForm">Add Product</button>

    <!-- Product Form Container (Initially Hidden) -->
    <div id="productFormWrapper" style="display: none;">
        <div id="productFormContainer">
            <h2 style="margin-bottom: 20px;">Add New Product</h2>
            <form action="${pageContext.request.contextPath}/AddProductServlet" method="post" enctype="multipart/form-data">
                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName" class="form-input" required>

                <label for="price">Price:</label>
                <input type="number" id="price" name="productprice" class="form-input" required>

                <label for="brandId">Brand:</label>
                <select id="brandId" name="brandId" class="form-input" required>
                    <option value="">-- Select Brand --</option>
                    <option value="1">Nike</option>
                    <option value="2">Adidas</option>
                </select>

                <label for="categoryId">Category:</label>
                <select id="categoryId" name="categoryId" class="form-input" required>
                    <option value="">-- Select Category --</option>
                    <option value="1">Sneakers</option>
                    <option value="2">Running Shoes</option>
                </select>

                <div class="variant-section">
                    <h4>Variant</h4>
                    <label for="size">Size:</label>
                    <input type="text" id="size" name="variantSize" class="form-input">

                    <label for="color">Color:</label>
                    <input type="text" id="color" name="variantColor" class="form-input">

                    <label for="stockQuantity">Stock Quantity:</label>
                    <input type="number" id="stockQuantity" name="variantStock" class="form-input" min="0">
                </div>

                <label for="image">Select Images:</label>
                <input type="file" id="image" name="productImages" class="form-input" accept="image/*" multiple>

                <div id="imagePreview" class="image-preview"></div>

                <button type="submit" class="form-button">Add Product</button>
            </form>
        </div>
    </div>

    <h2>Existing Products</h2>

    <%
    AddProductDAO dao = new AddProductDAO(); 
    List<DisplayProductmodel> products = dao.getAllProducts(); 
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Image</th>
            <th>Brand</th>
            <th>Category</th>
            <th>Actions</th>
        </tr>
        <%
        for(DisplayProductmodel p : products) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getQuantity() %></td>
            <td><img src="uploads/<%= p.getImage() %>" alt="<%= p.getName() %>"/></td>
            <td><%= p.getBrand() %></td>
            <td><%= p.getCategory() %></td>
            <td>
                <a href="javascript:void(0);" class="edit-btn" onclick="openEditModal(<%= p.getId() %>, '<%= p.getName() %>', <%= p.getPrice() %>)">Edit</a>
                <a href="deleteProduct?id=<%= p.getId() %>" class="delete-btn">Delete</a>
            </td>
        </tr>
        <%
        }
        %>
    </table>
</div>

<!-- Modal for Editing -->
<div id="editModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeEditModal()">&times;</span>
    <h3>Edit Product</h3>
    <form action="updateProduct" method="post">
        <input type="hidden" name="productId" id="editProductId">
        <label>Name:</label>
        <input type="text" name="productName" id="editProductName" class="form-input" required>
        <label>Price:</label>
        <input type="number" name="productPrice" id="editProductPrice" class="form-input" required>
        <button type="submit" class="form-button">Update Product</button>
    </form>
  </div>
</div>

<script>
    // Toggle Add Product Form
    document.getElementById('toggleProductForm').addEventListener('click', function () {
        const formWrapper = document.getElementById('productFormWrapper');
        formWrapper.style.display = formWrapper.style.display === 'none' ? 'block' : 'none';
    });

    // Edit Modal
    function openEditModal(id, name, price) {
        document.getElementById('editProductId').value = id;
        document.getElementById('editProductName').value = name;
        document.getElementById('editProductPrice').value = price;
        document.getElementById('editModal').style.display = "block";
    }

    function closeEditModal() {
        document.getElementById('editModal').style.display = "none";
    }

    window.onclick = function(event) {
        var modal = document.getElementById('editModal');
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
</script>

</body>
</html>
