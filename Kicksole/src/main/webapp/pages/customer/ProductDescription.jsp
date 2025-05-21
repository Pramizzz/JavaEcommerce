<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.DisplayProductmodel" %>
<%@ page import="java.util.List" %>
<%
    // Assuming the product is passed via request attribute
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
    <meta charset="UTF-8">
    <title><%= product.getProductName() %> - View Product</title>
    <style>
        .product-card {
            background-color: #1e1e1e;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            max-width: 850px;
            width: 90%;
            display: flex;
            flex-direction: row;
        }

        .product-image {
            width: 50%;
            background-color: #000;
        }

        .product-image img {
            width: 100%;
            height: auto;
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
            margin-top: 20px;
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

        @media (max-width: 768px) {
            .product-card {
                flex-direction: column;
            }

            .product-image, .product-details {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<%@include file = "navbar.jsp" %>

<div class="product-card">
    <div class="product-image">
        <img src="<%= imageUrl %>" alt="Product Image">
    </div>
    <div class="product-details">
        <h1><%= product.getProductName() %></h1>
        <p class="price">$<%= product.getPrice() %></p>
        <p><strong>Size:</strong> <%= product.getVariantSize() %></p>
        <p><strong>Color:</strong> <%= product.getVariantColor() %></p>
        <p><strong>Stock:</strong> <%= product.getVariantStock() %> units</p>
        <a href="<%= request.getContextPath() %>/pages/customer/products.jsp" class="back-button">← Back to Products</a>
    </div>
</div>
<%@include file = "footer.jsp" %>
</body>
</html>