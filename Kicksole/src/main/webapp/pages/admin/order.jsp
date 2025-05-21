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
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
      
    }
%>



<html>
<head>
    <title>Admin - Customer Orders</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admincss/admindashbord.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admincss/order.css">
    
      
</head>
<body>

<% 
    String message = request.getParameter("message");
    String error = request.getParameter("error");
    if (message != null) {
%>
   <div style="padding:10px; margin:10px 0; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 5px; text-align: center;">
        <strong>Success:</strong> <%= message %>
    </div>
<% 
    } 
    if (error != null) {
%>
<div style="padding:10px; margin:10px 0; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 5px; text-align: center;">
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
<%@ include file="sidebar.jsp" %>
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
                <table border="1" cellpadding="5" cellspacing="0" style="width:100%; border-collapse:collapse; table-layout: fixed;">
                    <thead>
                        <tr style="background-color:#ddd;">
                            <th style="width: 8%;">Order ID</th>
                            <th style="width: 20%;">Product Name</th>
                            <th style="width: 10%;">Price</th>
                            <th style="width: 8%;">Quantity</th>
                            <th style="width: 15%;">Payment Method</th>
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
                            <td><%= item.getPaymentMethod() != null ? item.getPaymentMethod() : "N/A" %></td>
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
                                 <button type="submit" class="delete-btn" onclick="return confirm('Are you sure?');">Delete</button>
                                 
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