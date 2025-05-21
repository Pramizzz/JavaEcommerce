<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>
<%@ page import="DAO.CartDAO" %>
<%@ page import="java.sql.SQLException" %>



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

<%


if (session.getAttribute("userId") == null) {
    response.sendRedirect(request.getContextPath() + "/pages/customer/login.jsp");
    return;
    
}

//out.println("User ID from session: " + session.getAttribute("userId") + "<br>");
    // Assuming userId is stored in session attribute "userId"
    Integer userId = (Integer) session.getAttribute("userId");
    List<CartItem> cartItems = null;
    double totalPrice = 0;

    if (userId != null) {
        try {
            CartDAO cartDAO = new CartDAO();
            cartItems = cartDAO.getCartItemsByUserId(userId);
           // out.println("Cart Items Fetched: " + (cartItems != null ? cartItems.size() : "null") + "<br>");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
%>

<div class="cart-container">
    <h2 class="cart-title">Your Cart</h2>

    <%
    if (cartItems != null && !cartItems.isEmpty()) {
        for (CartItem item : cartItems) {
            double itemTotal = item.getPrice() * item.getQuantity();
            totalPrice += itemTotal;
    %>
        <div class="cart-item">
            <div class="cart-item-details">
                <h4><%= item.getProductName() %></h4>
                <p>Size: <%= item.getVariantSize() %></p>
                <p>Price: ₹<%= item.getPrice() %></p>
                <p>Quantity: <%= item.getQuantity() %></p>
            </div>
            <div class="cart-item-actions">
                <form action="${pageContext.request.contextPath}/UpdateCartServlet" method="post">
                    <input type="hidden" name="variantId" value="<%= item.getVariantId() %>">
                    <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" />
                    <button type="submit">Update</button>
                </form>
                <form action="${pageContext.request.contextPath}/RemoveFromCartServlet" method="post">
                    <input type="hidden" name="variantId" value="<%= item.getVariantId() %>">
                    <button type="submit">Remove</button>
                </form>
            </div>
        </div>
    <%
        } // end for loop
    %>
        <div class="cart-summary">
            <p>Total: ₹<%= String.format("%.2f", totalPrice) %></p>
        </div>
        <div class="cart-buttons">
            <form action="${pageContext.request.contextPath}/ClearCartServlet" method="post">
                <button type="submit">Clear Cart</button>
            </form>
            <form action="${pageContext.request.contextPath}/pages/customer/checkout.jsp" method="post">
                <button type="submit">Proceed to Checkout</button>
            </form>
        </div>
    <%
    } else {
    %>
        <p>Your cart is empty.</p>
    <%
    }
    %>
</div>


<%@ include file="footer.jsp" %>
</body>
</html>
