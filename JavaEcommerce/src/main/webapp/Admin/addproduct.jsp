<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - Admin Panel</title>
    <link rel="stylesheet" href="../css/admin.css">
    <style>
        /* Modal CSS */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        /* Modal Styles */
.modal {
    display: none; /* Hidden by default */
    position: fixed;
    z-index: 1000; /* Ensures modal is on top */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Modal Content */
.modal-content {
    background: #fff;
    padding: 20px;
    width: 50%;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
    position: relative;
}

/* Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 20px;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
    color: #555;
}

.close:hover {
    color: #000;
}

/* Form Styling */
form {
    display: flex;
    flex-direction: column;
}

form label {
    font-weight: bold;
    margin-top: 10px;
}

form input,
form select,
form textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Textarea Styling */
form textarea {
    height: 80px;
    resize: none;
}

/* File Input */
input[type="file"] {
    border: none;
    padding: 5px;
}

/* Submit Button */
.btn-success {
    background-color: #28a745;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 15px;
    font-size: 16px;
}

.btn-success:hover {
    background-color: #218838;
}

    </style>
</head>
<body>
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
            <h1>Products</h1>
            <button class="btn btn-success" onclick="openProductForm()">+ Add New Product</button>
        </div>

        <div class="filter-container">
            <input type="text" placeholder="Search products..." class="search-box">
            <select class="filter-dropdown">
                <option value="all">All Categories</option>
                <option value="electronics">Electronics</option>
                <option value="fashion">Fashion</option>
                <option value="home">Home & Kitchen</option>
            </select>
        </div>

        <div class="product-list">
            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#101</td>
                        <td>Wireless Headphones</td>
                        <td>$99</td>
                        <td>50</td>
                        <td>Electronics</td>
                        <td>
                            <button class="btn btn-primary">Edit</button>
                            <button class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#102</td>
                        <td>Smartwatch</td>
                        <td>$149</td>
                        <td>30</td>
                        <td>Electronics</td>
                        <td>
                            <button class="btn btn-primary">Edit</button>
                            <button class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Add Product Form Modal -->
    <div id="productForm" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeProductForm()">&times;</span>
            <h2>Add New Product</h2>
            <form>
                <label>Product ID:</label>
                <input type="text" placeholder="Enter product ID">
                
                <label>Category:</label>
                <select>
                    <option value="electronics">Electronics</option>
                    <option value="fashion">Fashion</option>
                    <option value="home">Home & Kitchen</option>
                </select>
                
                <label>Sub-Category:</label>
                <select>
                    <option value="mobile">Mobile</option>
                    <option value="laptop">Laptop</option>
                    <option value="accessories">Accessories</option>
                </select>
                
                <label>Product Name:</label>
                <input type="text" placeholder="Enter product name">
                
                <label>Details:</label>
                <textarea placeholder="Enter product details"></textarea>
                
                <label>Price:</label>
                <input type="text" placeholder="Enter product price">
                
                <label>Stock:</label>
                <input type="number" placeholder="Enter stock quantity">
                
                <label>Upload Image:</label>
                <input type="file" accept="image/*">
                
                <button type="submit" class="btn btn-success">Save Product</button>
            </form>
        </div>
    </div>

  
        <script>
    
    document.addEventListener("DOMContentLoaded", function () {
        const addProductBtn = document.querySelector(".header .btn-success");
        const productForm = document.getElementById("productForm");
        const closeBtn = document.querySelector(".modal .close");

        // Ensure modal is hidden on page load
        productForm.style.display = "none"; 

        // Open modal when clicking "Add New Product"
        addProductBtn.addEventListener("click", function () {
            productForm.style.display = "flex";
        });

        // Close modal when clicking "×" button
        closeBtn.addEventListener("click", function () {
            productForm.style.display = "none";
        });

        // Close modal when clicking outside the modal content
        window.addEventListener("click", function (event) {
            if (event.target === productForm) {
                productForm.style.display = "none";
            }
        });
    });

    </script>
</body>
</html>
    