<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,model.DisplayProductmodel,DAO.AddProductDAO"%>
	<%@ page import="DAO.CategoryModelDAO, model.AddCategory, model.AddBrandModel, DAO.AddBrandDAO , java.util.List" %>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/pagescss/style.css">
<title>Insert title here</title>
</head>
<body>

<%
CategoryModelDAO categoryDAO = new CategoryModelDAO();
List<AddCategory> categories = categoryDAO.getAllCategories();

List<DisplayProductmodel> products = (List<DisplayProductmodel>) request.getAttribute("products");

if (products == null) {
    AddProductDAO productDAO = new AddProductDAO();
    products = productDAO.getAllProducts();
}
%>

<main>
    <section class="products-header">
        <h2>Jordan Collection</h2>
        <p>Explore iconic styles and the latest drops</p>
    </section>

    <section class="filter-section">
        <div class="filter-container">
           <form action="${pageContext.request.contextPath}/FilterByCategoryServlet" method="get">
    <div class="filter-group">
        <label for="category">Category:</label>
        <select id="category" name="category" onchange="this.form.submit()">
            <option value="all">All Products</option>
            <%
                String selectedCategoryId = request.getParameter("category");
                if (selectedCategoryId == null) selectedCategoryId = "all";
                for (AddCategory cat : categories) {
                    String selected = "";
                    if (String.valueOf(cat.getCategoryId()).equals(selectedCategoryId)) {
                        selected = "selected";
                    }
            %>
                <option value="<%= cat.getCategoryId() %>" <%= selected %>><%= cat.getCategoryName() %></option>
            <%
                }
            %>
        </select>
    </div>
</form>

<%
AddBrandDAO brandDAO = new AddBrandDAO();
List<AddBrandModel> brands = brandDAO.getAllBrands();

String selectedBrandId = request.getParameter("brand");
if (selectedBrandId == null) {
    selectedBrandId = "all";
}
%>

<form action="${pageContext.request.contextPath}/FilterByBrandServlet" method="get">
    <div class="filter-group">
        <label for="brand">Brand:</label>
        <select id="brand" name="brand" onchange="this.form.submit()">
            <option value="all" <%= "all".equals(selectedBrandId) ? "selected" : "" %>>All Brands</option>
            <%
                for (AddBrandModel brand : brands) {
                    String selected = "";
                    if (String.valueOf(brand.getBrandId()).equals(selectedBrandId)) {
                        selected = "selected";
                    }
            %>
                    <option value="<%= brand.getBrandId() %>" <%= selected %>>
                        <%= brand.getBrandName() %>
                    </option>

              
            <%
                }
            %>
        </select>
    </div>
</form>




		
				
    <form method="get" action="${pageContext.request.contextPath}/SortByServlet">
    <div class="filter-group">
        <label for="sort">Sort by:</label>
     <select id="sort" name="sort" onchange="this.form.submit()">
            <option value="default" <%= "default".equals(request.getAttribute("selectedSort")) ? "selected" : "" %>>Featured</option>
            <option value="low-high" <%= "low-high".equals(request.getAttribute("selectedSort")) ? "selected" : "" %>>Price: Low to High</option>
            <option value="high-low" <%= "high-low".equals(request.getAttribute("selectedSort")) ? "selected" : "" %>>Price: High to Low</option>
            <option value="newest" <%= "newest".equals(request.getAttribute("selectedSort")) ? "selected" : "" %>>Newest</option>
        </select>
    </div>
</form>
		</section>

		
		
<section class="products-grid-container">
    <div class="products-grid" id="productsContainer">
        <%
        for (DisplayProductmodel p : products) {
        %>
        <div class="product-card">
            <div class="product-image">
                <img src="<%=request.getContextPath()%>/<%=p.getImagePaths().get(0) %>" alt="<%=p.getProductName()%>">
            </div>
            <div class="product-info">
                <h3><%=p.getProductName()%></h3>
                <p>Price: ₹<%=p.getPrice()%></p>
                <p>Quantity: <%=p.getVariantStock()%></p>
                <p>Size: <%=p.getVariantSize()%></p>
            </div>
            <div class="product-actions">
                <!-- Add to Cart Button -->
                <form action="<%= request.getContextPath() %>/AddToCartServlet" method="post" style="display:inline;">
                    <input type="hidden" name="variantId" value="<%= p.getVariantId() %>" />
                    <input type="hidden" name="quantity" value="1" />
                    <button type="submit">Add to Cart</button>
                </form>

                <!-- Buy Now Button -->
                <form action="<%= request.getContextPath() %>/pages/customer/checkout.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="variantId" value="<%= p.getVariantId() %>" />
                    <button type="submit">Buy Now</button>
                </form>
            </div>
        </div>
        <%
        }
        %>
    </div>
</section>

	</main>>
		
		<%@ include file="footer.jsp"%>

		<!-- Cart Sidebar -->
		<div class="cart-sidebar" id="cartSidebar">
			<div class="cart-header">
				<h2>Your Cart</h2>
				<button class="close-cart" id="closeCart">&times;</button>
			</div>
			<div class="cart-items" id="cartItems">
				<!-- Cart items will be added dynamically -->
			</div>
			<div class="cart-footer">
				<div class="cart-total">
					<span>Total:</span> <span id="cartTotal">$0.00</span>
				</div>
				<button class="checkout-btn">Checkout</button>
			</div>
		</div>
		<div class="overlay" id="overlay"></div>
		</div>
</body>
</html>