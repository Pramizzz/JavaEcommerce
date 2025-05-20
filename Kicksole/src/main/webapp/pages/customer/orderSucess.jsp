<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <style>
        body {
            font-family: Arial;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .success-box {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border: 2px solid #28a745;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
        }
        .success-box h2 {
            color: #28a745;
        }
        .success-box a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .success-box a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="success-box">
    <h2>🎉 Order Placed Successfully!</h2>
    <p>Thank you for your purchase.</p>
    <p>Your order is being processed and will be shipped soon.</p>
   
    <a href="<%= request.getContextPath() %>/index.jsp">Continue Shopping</a>
</div>

</body>
</html>
