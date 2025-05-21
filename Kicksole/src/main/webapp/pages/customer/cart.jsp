<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.CartItem" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }

    double total = 0.0;
    for (CartItem item : cart) {
        total += item.getPrice() * item.getQuantity();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
    <style>
        body {
            background-color: #f8f8f8;
            color: #000;
            font-family: Arial, sans-serif;
        }

        .cart-container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .cart-title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            background: #fff;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            margin-bottom: 15px;
        }

        .cart-item img {
            height: 80px;
            width: 80px;
            object-fit: cover;
            border-radius: 6px;
        }

        .cart-item-details {
            flex: 2;
            margin-left: 15px;
            color: #000;
        }

        .cart-item-actions {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 10px;
        }

        .cart-item-actions form {
            display: flex;
            gap: 5px;
        }

        .cart-item-actions button {
            padding: 6px 10px;
            font-size: 14px;
            background: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .cart-item-actions button:hover {
            background: #555;
        }

        .cart-summary {
            text-align: right;
            font-size: 20px;
            margin-top: 20px;
            font-weight: bold;
        }

        .cart-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .cart-buttons button {
            padding: 10px 20px;
            font-size: 16px;
            background: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .cart-buttons button:hover {
            background: #555;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="cart-container">
    <h2 class="cart-title">Your Shopping Cart</h2>

    <c:if test="${empty cart}">
        <p>Your cart is currently empty.</p>
    </c:if>

    <c:forEach var="item" items="${cart}">
        <div class="cart-item">
            <img src="${pageContext.request.contextPath}/${item.imagePath}" alt="${item.productName}">
            <div class="cart-item-details">
                <h4>${item.productName}</h4>
                <p>Size: ${item.variantSize}</p>
                <p>Price: ₹${item.price}</p>
                <p>Quantity: ${item.quantity}</p>
            </div>
            <div class="cart-item-actions">
                <form action="${pageContext.request.contextPath}/UpdateCartServlet" method="post">
                    <input type="hidden" name="variantId" value="${item.variantId}">
                    <input type="number" name="quantity" value="${item.quantity}" min="1" />
                    <button type="submit">Update</button>
                </form>
                <form action="${pageContext.request.contextPath}/RemoveFromCartServlet" method="post">
                    <input type="hidden" name="variantId" value="${item.variantId}">
                    <button type="submit">Remove</button>
                </form>
            </div>
        </div>
    </c:forEach>

    <div class="cart-summary">
        <p>Total: ₹<%= String.format("%.2f", total) %></p>
    </div>

    <div class="cart-buttons">
        <form action="${pageContext.request.contextPath}/ClearCartServlet" method="post">
            <button type="submit">Clear Cart</button>
        </form>
        <form action="${pageContext.request.contextPath}/pages/customer/checkout.jsp" method="post">
            <button type="submit">Proceed to Checkout</button>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
