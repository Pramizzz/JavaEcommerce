<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAO.OrderSummaryDAO, model.CustomerOrderSummary, model.ProductPriceInfo" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%
    List<CustomerOrderSummary> orderSummaries = new ArrayList<>();
    try {
        OrderSummaryDAO dao = new OrderSummaryDAO();
        orderSummaries = dao.getAllCustomerOrderSummaries();
        out.println("<p>Records fetched: " + orderSummaries.size() + "</p>");
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
      
    }
%>



<html>
<head>
    <title>Admin - Customer Orders</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admincss/admindashbord.css">
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
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
table {
    width: 100%;
    border-collapse: collapse;
    margin: 0;
    padding: 0;
    table-layout: fixed;
    box-sizing: border-box;
}

th, td {
    border: 1px solid #aaa;
    padding: 8px;
    text-align: left;
    vertical-align: top;
    font-size: 14px;
    word-wrap: break-word;
}

/* Header background */
th {
    background-color: #ddd;
}

/* Sub-table inside order cell */
td > table {
    width: 100%;
    margin-top: 10px;
    border-collapse: collapse;
    table-layout: fixed;
    background-color: #fafafa;
}

/* Sub-table header and cells */
td > table th,
td > table td {
    border: 1px solid #ccc;
    padding: 6px;
    font-size: 13px;
    word-wrap: break-word;
}

/* Widen the Orders column in the main table */
td:nth-child(5),
th:nth-child(5) {
    width: 40%;
}


        
    </style>
</head>
<body>

<% 
    String message = request.getParameter("message");
    String error = request.getParameter("error");
    if (message != null) {
%>
    <div style="padding:10px; margin:10px 0; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 5px;">
        <strong>Success:</strong> <%= message %>
    </div>
<% 
    } 
    if (error != null) {
%>
    <div style="padding:10px; margin:10px 0; background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; border-radius: 5px;">
        <strong>Error:</strong> <%= error %>
    </div>
<% 
    } 
%>


<%--
    out.println("<p>Total records fetched: " + (orderSummaries != null ? orderSummaries.size() : 0) + "</p>");
if (orderSummaries != null) {
    for (CustomerOrderSummary summary : orderSummaries) {
        out.println("User ID: " + summary.getUserId() + ", Total Amount: " + summary.getTotalAmount() + "<br>");
    }
}
--%>
<div class="sidebar">
    <h2>Admin Panel</h2>
   <a href="../customer/home.jsp">HomePage</a>
    <a href="<%= request.getContextPath() %>/pages/admin/adminDashboard.jsp">Dashboard</a>
    <a href="<%= request.getContextPath() %>/pages/admin/category.jsp">Add Category</a>
    <a href="../admin/AddBrand.jsp"> Add Brand</a>
    <a href="<%= request.getContextPath() %>/pages/admin/AddProducts.jsp">Products</a>
    <a href="<%= request.getContextPath() %>/pages/admin/user.jsp">Manage Users</a>
    <a href="<%= request.getContextPath() %>/pages/admin/order.jsp">Orders</a>
    <a href="<%= request.getContextPath() %>/pages/admin/report.jsp">Reports</a>
    <a href="<%= request.getContextPath() %>/pages/admin/setting.jsp">Settings</a>
    <a href="#" onclick="showLogoutModal()">Logout</a>
</div>

<div class="header">
    <h1>Orders</h1>
</div>

<div class="content">

<table border="1" cellpadding="10" cellspacing="0" style="width:100%; border-collapse:collapse;">
    <thead>
        <tr style="background-color:#f2f2f2;">
            <th>Customer Name</th>
            <th>Phone</th>
            <th>Shipping Address</th>
            <th>Total Amount</th>
            <th>Orders</th>
        </tr>
    </thead>
    <tbody>
<%
    for (CustomerOrderSummary summary : orderSummaries) {
%>
        <tr>
            <td><%= summary.getCustomerName() %></td>
            <td><%= summary.getCustomerPhone() %></td>
            <td><%= summary.getShipping_address() %></td>
            <td>$<%= String.format("%.2f", summary.getTotalAmount()) %></td>
            <td>
                <table border="1" cellpadding="5" cellspacing="0" style="width:100%; border-collapse:collapse; table-layout: fixed;">                    <thead>
 <tr style="background-color:#ddd;">
        <th style="width: 8%;">Order ID</th>
        <th style="width: 20%;">Product Name</th>
        <th style="width: 10%;">Price</th>
        <th style="width: 8%;">Quantity</th>
        <th style="width: 15%;">Status</th>
        <th style="width: 15%;">Created Date</th>
        <th style="width: 15%;">Updated Date</th>
        <th style="width: 9%;">Action</th>
    </tr>
                    </thead>
                    <tbody>
<%
        List<ProductPriceInfo> items = summary.getProductPrices();
        for (ProductPriceInfo item : items) {
%>
                        <tr>
                            <td><%= item.getOrderId() %></td>
                            <td><%= item.getProductName() %></td>
                            <td>$<%= String.format("%.2f", item.getPrice()) %></td>
                            <td><%= item.getQuantity() %></td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/UpdateOrderStatusServlet" style="margin:0;">
                                    <input type="hidden" name="orderId" value="<%= item.getOrderId() %>" />
                                    <select name="status" onchange="this.form.submit()">
                                        <option value="Pending"   <%= "Pending".equals(item.getStatus())   ? "selected" : "" %>>Pending</option>
                                        <option value="Shipped"   <%= "Shipped".equals(item.getStatus())   ? "selected" : "" %>>Shipped</option>
                                        <option value="Delivered" <%= "Delivered".equals(item.getStatus()) ? "selected" : "" %>>Delivered</option>
                                        <option value="Cancelled" <%= "Cancelled".equals(item.getStatus()) ? "selected" : "" %>>Cancelled</option>
                                    </select>
                                </form>
                            </td>
                            <td><%= summary.getCreatedDate() != null ? summary.getCreatedDate() : "N/A" %></td>   
                            <td><%= summary.getUpdatedDate() != null ? summary.getUpdatedDate() : "N/A" %></td>   
                            <td>
                                <form action="${pageContext.request.contextPath}/DeleteOrderServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="orderId" value="<%= item.getOrderId() %>" />
                                    <button type="submit" onclick="return confirm('Are you sure?');">Delete</button>
                                </form>
                            </td>
                        </tr>
<%
        }
%>
                    </tbody>
                </table>
            </td>
        </tr>
<%
    }
%>
    </tbody>
</table>


</div>




</body>
</html>
</html>