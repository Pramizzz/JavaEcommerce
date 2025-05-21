<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.DashboardStats" %>
<%@ page import="database.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
  <%@ page import="DAO.DashboardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sales Report - Kicksole Admin</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admincss/admindashboard.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admincss/report.css">

</head>
<body>

<%@ include file="sidebar.jsp" %>
<div class="header">
    <h1>Sales Report</h1>
</div>

	<%
    String topSellingProduct = "";
    double totalSales = 0;
    double monthlySales = 0;
    String TopSellingCategoryByQuantity="";
    String TopSellingCategoryByRevenue="";
    String TopSellingBrandByQuantity="";
    String TopSellingBrandByRevenue="";

    try {
        DashboardDAO dao = new DashboardDAO();
        topSellingProduct = dao.getMostBoughtProduct();
        totalSales = dao.getTotalSales();
        monthlySales = dao.getMonthlySales();
        TopSellingCategoryByQuantity = dao.getTopSellingCategoryByQuantity();
        TopSellingCategoryByRevenue = dao.getTopSellingCategoryByRevenue();
        TopSellingBrandByQuantity = dao.getTopSellingBrandByQuantity();
        TopSellingBrandByRevenue = dao.getTopSellingBrandByRevenue();

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error fetching dashboard data: " + e.getMessage() + "</p>");
    }
%>

<div class="content">
    <div class="stat-card-container">
        <div class="stat-card">
            <h4>Top Selling Product:</h4>
           <p><strong><%= topSellingProduct %></strong></p>
        </div>
        
         <div class="stat-card">
            <h4>Total Sales</h4>
       <p><strong><%= totalSales %></strong></p>
        </div>

        <div class="stat-card">
            <h4>Total Sales This Month</h4>
       <p> <strong><%= monthlySales %></strong></p>
        </div>

        <div class="stat-card">
            <h4>TopSelling Category By Revenue</h4>
       <p><strong><%= TopSellingCategoryByRevenue%></strong></p>
        </div>
        
        <div class="stat-card">
            <h4>Top Selling Brand By Quantity</h4>
       <p><strong><%= TopSellingBrandByQuantity%></strong></p>
        </div>
        
        <div class="stat-card">
            <h4>Top Selling Category By Quantity</h4>
       <p><strong><%= TopSellingCategoryByQuantity %></strong></p>
        </div>
        
        <div class="stat-card">
            <h4>TopSelling BrandBy Revenue</h4>
       <p><strong><%= TopSellingBrandByRevenue %></strong></p>
        </div>
        
    </div>

   
       
        </table>
    </div>

</div>


</body>
</html>