<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    .btn:hover {
        background-color: #218838;
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

    /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.5);
    }

    .modal-content {
        background-color: white;
        margin: 5% auto;
        padding: 30px;
        border-radius: 10px;
        width: 600px;
        position: relative;
    }

    .close {
        color: #aaa;
        position: absolute;
        top: 15px;
        right: 20px;
        font-size: 24px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover {
        color: black;
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
        box-sizing: border-box; /* Added box-sizing */
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

    .variant-controls button {
        background-color: #5cb85c;
        color: white;
        border: none;
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        margin-top: 10px;
    }

    .variant-controls button:hover {
        background-color: #4cae4c;
    }
</style>
</head>
<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="../admin/adminDashboard.jsp">Dashboard</a>
    <a href="#">Add Category</a>
    <a href="#">Products</a>
    <a href="#">Manage Users</a>
    <a href="#">Orders</a>
    <a href="#">Reports</a>
    <a href="#">Settings</a>
    <a href="#">Logout</a>
</div>

<div class="header">
    <h1>Product Management</h1>
</div>

<div class="content">
    <button class="btn" onclick="openModal()">+ Add Product</button>

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
                    <td>
    <button class="action-btn edit-btn">Edit</button>
    <button class="action-btn delete-btn">Delete</button>
</td>

                </td>
            </tr>
            </tbody>
    </table>
</div>

<div id="addProductModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 style="text-align:center;">Add New Product</h2>
        <form action="AddProductServlet" method="post" enctype="multipart/form-data">
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

            <div id="variants-container">
                <h3>Product Variants</h3>
                <div class="variant-section">
                    <h4>Variant 1</h4>
                    <div class="form-group">
                        <label for="size_1">Size:</label>
                        <input type="text" id="size_1" name="variants[0][size]">
                    </div>
                    <div class="form-group">
                        <label for="color_1">Color:</label>
                        <input type="text" id="color_1" name="variants[0][color]">
                    </div>
                    <div class="form-group">
                        <label for="stockQuantity_1">Stock Quantity:</label>
                        <input type="number" id="stockQuantity_1" name="variants[0][stockQuantity]" min="0">
                    </div>
                 <label for="image">Select Images:</label>
    <input type="file" id="image" name="productImages[]" accept="image/*" multiple>
    <div id="imagePreview"></div>

                </div>
            </div>

            

            <button type="submit" class="form-button">Add Product</button>
        </form>
    </div>
</div>

<script>
document.getElementById("image").addEventListener("change", function (event) {
    const preview = document.getElementById("imagePreview");
    preview.innerHTML = "";

    const files = event.target.files;
    console.log("Number of files selected:", files.length);

    if (!files.length) return;

    Array.from(files).forEach(file => {
        console.log("Processing file:", file.name);
        if (!file.type.startsWith("image/")) return;

        const reader = new FileReader();
        reader.onload = function (e) {
            const img = document.createElement("img");
            img.src = e.target.result;
            preview.appendChild(img);
        };
        reader.readAsDataURL(file);
    });
});
    let variantCounter = 1;

    function addVariant() {
        variantCounter++;
        const variantsContainer = document.getElementById('variants-container');
        const newVariantSection = document.createElement('div');
        newVariantSection.classList.add('variant-section');
        newVariantSection.innerHTML = `
            <h4>Variant ${variantCounter}</h4>
            <div class="form-group">
                <label for="size_${variantCounter}">Size:</label>
                <input type="text" id="size_${variantCounter}" name="variants[${variantCounter - 1}][size]">
            </div>
            <div class="form-group">
                <label for="color_${variantCounter}">Color:</label>
                <input type="text" id="color_${variantCounter}" name="variants[${variantCounter - 1}][color]">
            </div>
            <div class="form-group">
                <label for="stockQuantity_${variantCounter}">Stock Quantity:</label>
                <input type="number" id="stockQuantity_${variantCounter}" name="variants[${variantCounter - 1}][stockQuantity]" min="0">
            </div>
        `;
        variantsContainer.appendChild(newVariantSection);
    }

document.getElementById("image").addEventListener("change", function (event) {
    const preview = document.getElementById("imagePreview");
    preview.innerHTML = ""; // Clear previous previews

    const files = event.target.files;
    if (!files.length) return;

    Array.from(files).forEach(file => {
        if (!file.type.startsWith("image/")) return;

        const reader = new FileReader();
        reader.onload = function (e) {
            const img = document.createElement("img");
            img.src = e.target.result;
            img.style.width = "80px";
            img.style.height = "80px";
            img.style.objectFit = "cover";
            img.style.border = "1px solid #ccc";
            img.style.borderRadius = "6px";
            preview.appendChild(img);
        };
        reader.readAsDataURL(file);
    });
})
    function openModal() {
        document.getElementById("addProductModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("addProductModal").style.display = "none";
    }

    window.onclick = function(event) {
        let modal = document.getElementById("addProductModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>