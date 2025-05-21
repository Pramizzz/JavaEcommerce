<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, java.sql.*, java.util.*, model.*, DAO.*" %>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/customer/login.jsp");
        return;
    }

    Integer userId = (Integer) session.getAttribute("userId");
    String variantIdStr = request.getParameter("variantId");

    ProductVariantModel singleVariant = null;
    List<CartItem> cartItems = null;
    double totalPrice = 0;

    if (variantIdStr != null && !variantIdStr.isEmpty()) {
        try {
            int variantId = Integer.parseInt(variantIdStr);
            ProductVariantDAO variantDAO = new ProductVariantDAO();
            singleVariant = variantDAO.getVariantById(variantId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        try {
            CartDAO cartDAO = new CartDAO();
            cartItems = cartDAO.getCartItemsByUserId(userId);
            for (CartItem item : cartItems) {
                totalPrice += item.getPrice() * item.getQuantity();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial;
            padding: 20px;
        }
        .checkout-form {
            max-width: 600px;
            margin: auto;
            padding: 25px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fafafa;
        }
        .product-item {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        input[type=number], input[type=submit], textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #aaa;
            border-radius: 5px;
        }
        input[type=submit] {
            background-color: #28a745;
            color: white;
            border: none;
            font-weight: bold;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="checkout-form">
    <h2>Checkout</h2>

    <form action="<%= request.getContextPath() %>/CheckoutController" method="post">

    <% if (singleVariant != null) { %>
        <!-- Single Product Checkout -->
        <div class="product-item">
            <p><strong>Product:</strong> <%= singleVariant.getProductName() %></p>
            <p><strong>Variant:</strong> <%= singleVariant.getSize() %> / <%= singleVariant.getColor() %></p>
            <p><strong>Price:</strong> ₹<%= singleVariant.getPrice() %></p>
            <input type="hidden" name="variantId" value="<%= singleVariant.getVariantId() %>" />
        </div>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" min="1" required />
    <% } else if (cartItems != null && !cartItems.isEmpty()) { %>
        <!-- Full Cart Checkout -->
        <% for (CartItem item : cartItems) { %>
            <div class="product-item">
                <p><strong><%= item.getProductName() %></strong></p>
                <p>Size: <%= item.getVariantSize() %></p>
                <p>Price: ₹<%= item.getPrice() %> × <%= item.getQuantity() %> = ₹<%= item.getPrice() * item.getQuantity() %></p>
                <input type="hidden" name="cartVariantIds[]" value="<%= item.getVariantId() %>" />
<input type="hidden" name="quantities[]" value="<%= item.getQuantity() %>" />

            </div>
        <% } %>
        <p style="text-align:right;"><strong>Total: ₹<%= String.format("%.2f", totalPrice) %></strong></p>
    <% } else { %>
        <p style="color:red;">Your cart is empty or no product selected!</p>
    <% } %>

    <!-- Common fields -->
    <label for="shippingAddress">Shipping Address:</label>
    <textarea id="shippingAddress" name="shippingAddress" rows="3" required></textarea>

    <label for="paymentMethod">Payment Method:</label>
    <select id="paymentMethod" name="paymentMethod" required>
        <option value="">Select payment method</option>
        <option value="Credit Card">Credit Card</option>
        <option value="Debit Card">Debit Card</option>
        <option value="PayPal">PayPal</option>
        <option value="Cash on Delivery">Cash on Delivery</option>
    </select>

    <input type="submit" value="Place Order" />
    </form>
</div>

</body>
</html>
