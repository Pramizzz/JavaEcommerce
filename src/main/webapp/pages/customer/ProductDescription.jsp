<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.DisplayProductmodel" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*, database.DatabaseConnection" %>

<%
    // Get single product from request attribute
    DisplayProductmodel product = (DisplayProductmodel) request.getAttribute("product");
    if (product == null) {
        out.println("<h2 style='color:white;'>Product not found.</h2>");
        return;
    }

    List<String> images = product.getImagePaths();
    String imageUrl = (images != null && !images.isEmpty()) ? images.get(0) : "https://via.placeholder.com/300";
%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= product.getProductName() %> - View Product</title>
    <meta name="description" content="Premium Jordan sneakers collection" />
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/javascript/script.js"></script>
    <style>
        /* Your CSS styles here - unchanged */
        .product-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 75vh;
            width: 100%;
            padding: 40px 20px;
        }

        .product-card {
            background-color: #1e1e1e;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            max-width: 850px;
            width: 90%;
            display: flex;
            flex-direction: row-reverse;
            margin: 0 auto;
        }

        .product-image {
    width: 50%;
    background-color: #000;
    height: 400px; /* Or use height: 100% for dynamic sizing */
}

.product-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
}


        .product-details {
            padding: 30px;
            flex: 1;
        }

        .product-details h1 {
            margin-top: 0;
            font-size: 28px;
            color: #f1f1f1;
        }

        .product-details p {
            color: #ccc;
            margin: 10px 0;
        }

        .product-details .price {
            font-size: 24px;
            color: #00e676;
            font-weight: bold;
        }

        .back-button {
            display: inline-block;
            margin-top: -2px;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            transition: background 0.3s;
        }

        .back-button:hover {
            background-color: #555;
        }

        .product-actions {
            margin-top: 20px;
        }

        .product-actions form {
            display: block;
            margin-bottom: 10px;
        }

        .product-actions input[type="number"] {
            width: 60px;
            padding: 5px;
            margin-right: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .product-actions button {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .product-actions .cart-button {
            background-color: #3f51b5;
        }

        .product-actions .cart-button:hover {
            background-color: #5c6bc0;
        }

        .product-actions .buy-button {
            background-color: #28a745;
        }

        .product-actions .buy-button:hover {
            background-color: #218838;
        }

        @media (max-width: 768px) {
            .product-card {
                flex-direction: column-reverse;
            }

            .product-image, .product-details {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="product-container">
    <div class="product-card">
        <div class="product-image">
            <img src="<%= imageUrl %>" alt="Product Image">
        </div>
        <div class="product-details">
            <h1><%= product.getProductName() %></h1>
            <p class="price">₹<%= product.getPrice() %></p>
            <p><strong>Size:</strong> <%= product.getVariantSize() %></p>
            <p><strong>Color:</strong> <%= product.getVariantColor() %></p>
            <p><strong>Stock:</strong> <%= product.getVariantStock() %> units</p>

            <div class="product-actions">
                <!-- Add to Cart -->
                <form action="<%= request.getContextPath() %>/AddToCartServlet" method="post">
                    <input type="hidden" name="variantId" value="<%= product.getVariantId() %>" />
                   
                    <button type="submit" class="cart-button">View Cart</button>
                </form>

                
                <a href="<%= request.getContextPath() %>/pages/customer/product.jsp" class="back-button">← Back to Products</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>