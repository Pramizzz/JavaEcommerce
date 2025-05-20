<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, java.sql.*, model.ProductVariantModel, DAO.ProductVariantDAO" %>
<%
	if (session == null || session.getAttribute("username") == null) {
	    String variantId = request.getParameter("variantId");
	    session = request.getSession(); // recreate session if needed
	    session.setAttribute("redirectAfterLogin", "pages/customer/checkout.jsp?variantId=" + variantId);
	    response.sendRedirect(request.getContextPath() + "/pages/customer/login.jsp");
	    return;
	}
String variantIdStr = request.getParameter("variantId");
int variantId = 0;
if (variantIdStr != null && !variantIdStr.equals("") && !variantIdStr.equalsIgnoreCase("null")) {
    try {
        variantId = Integer.parseInt(variantIdStr);
    } catch (NumberFormatException e) {
        e.printStackTrace();
    }
}


    // Optional: Get product variant details from DAO (you must have a VariantDAO)
    ProductVariantModel variant = null;
    try {
        ProductVariantDAO variantDAO = new ProductVariantDAO();
        variant = variantDAO.getVariantById(variantId);
    } catch (Exception e) {
        e.printStackTrace();
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
            max-width: 500px;
            margin: auto;
            padding: 25px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        input[type=number], input[type=submit] {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            border: 1px solid #aaa;
            border-radius: 5px;
        }
        input[type=submit] {
            background-color: #28a745;
            color: white;
            border: none;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="checkout-form">
    <h2>Checkout</h2>

<% if (variant != null) { %>
    <style>
  form {
    max-width: 400px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fafafa;
    font-family: Arial, sans-serif;
  }

  form p {
    font-size: 16px;
    margin: 10px 0;
  }

  label {
    display: block;
    margin-top: 15px;
    font-weight: bold;
  }

  input[type="number"],
  textarea,
  select {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    border-radius: 4px;
    border: 1px solid #ccc;
    box-sizing: border-box;
    font-size: 14px;
  }

  input[type="submit"] {
    margin-top: 20px;
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    border: none;
    color: white;
    font-weight: bold;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #0056b3;
  }
</style>

<form action="<%= request.getContextPath() %>/CheckoutController" method="post">
  <p><strong>Product Name:</strong> <%= variant != null ? variant.getProductName() : "" %></p>
  <p><strong>Variant:</strong> <%= variant != null ? variant.getSize() : "" %> / <%= variant != null ? variant.getColor() : "" %></p>
  <p><strong>Price:</strong> $<%= variant != null ? variant.getPrice() : "" %></p>

  <input type="hidden" name="variantId" value="<%= request.getAttribute("variantId") != null ? request.getAttribute("variantId") : (variant != null ? variant.getVariantId() : "") %>" />

  <label for="quantity">Quantity:</label>
  <input  id="quantity" name="quantity" min="1" value="<%= request.getAttribute("quantity") != null ? request.getAttribute("quantity") : "" %>" />
  <p style="color:red;"><%= request.getAttribute("quantityError") != null ? request.getAttribute("quantityError") : "" %></p>

  <label for="shippingAddress">Shipping Address:</label>
  <textarea id="shippingAddress" name="shippingAddress" rows="3" ><%= request.getAttribute("shippingAddress") != null ? request.getAttribute("shippingAddress") : "" %></textarea>
  <p style="color:red;"><%= request.getAttribute("addressError") != null ? request.getAttribute("addressError") : "" %></p>

  <label for="paymentMethod">Payment Method:</label>
<select id="paymentMethod" name="paymentMethod">
    <option value="" disabled <%= request.getAttribute("paymentMethod") == null ? "selected" : "" %>>Select payment method</option>
    <option value="Credit Card" <%= "Credit Card".equals(request.getAttribute("paymentMethod")) ? "selected" : "" %>>Credit Card</option>
    <option value="Debit Card" <%= "Debit Card".equals(request.getAttribute("paymentMethod")) ? "selected" : "" %>>Debit Card</option>
    <option value="PayPal" <%= "PayPal".equals(request.getAttribute("paymentMethod")) ? "selected" : "" %>>PayPal</option>
    <option value="Cash on Delivery" <%= "Cash on Delivery".equals(request.getAttribute("paymentMethod")) ? "selected" : "" %>>Cash on Delivery</option>
</select>


<% if (request.getAttribute("paymentError") != null) { %>
    <p style="color:red;"><%= request.getAttribute("paymentError") %></p>
<% } %>


  <input type="submit" value="Place Order" />
</form>



<% } else { %>
    <p style="color:red;">Invalid or missing product variant!</p>
<% } %>


</div>

</body>
</html>