<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,model.DisplayProductmodel,DAO.AddProductDAO"%>
	<%@ page import="DAO.CategoryModelDAO, model.AddCategory, model.AddBrandModel, DAO.AddBrandDAO , java.util.List" %>
	<%@ page import="java.sql.*, database.DatabaseConnection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Connection conn = null;
try {
    conn = DatabaseConnection.getConnection();
    if (conn == null || conn.isClosed()) {
        response.sendRedirect(request.getContextPath() + "/pages/customer/databaseError.jsp");
        return;
    }
} catch (Exception e) {
    response.sendRedirect(request.getContextPath() + "/pages/customer/databaseError.jsp");
    return;
} finally {
    if (conn != null) {
        try { conn.close(); } catch (SQLException ignore) {}
    }
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/pagescss/style.css">
<title>Insert title here</title>
<style>


.products-grid-container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 2rem 1rem;
    background-color: #000000;
}

.products-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 1.5rem;
    justify-items: center;
}

/* Responsive Grid */
@media (min-width: 1400px) {
    .products-grid {
        grid-template-columns: repeat(4, 1fr);
    }
}

@media (min-width: 1024px) and (max-width: 1399px) {
    .products-grid {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (min-width: 768px) and (max-width: 1023px) {
    .products-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 767px) {
    .products-grid {
        grid-template-columns: 1fr;
        gap: 1rem;
    }
    
    .products-grid-container {
        padding: 1rem 0.5rem;
    }
}

/* ======================
   PRODUCT CARDS
   ====================== */

.product-card {
    background-color: #333333;
    border-radius: 12px;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    width: 100%;
    max-width: 320px;
    transition: transform 0.2s ease;
}

.product-card:hover {
    transform: translateY(-5px);
}

/* ======================
   PRODUCT IMAGE
   ====================== */

.product-image {
    position: relative;
    background-color: #f5f5f5;
    height: 240px;
    overflow: hidden;
}

.product-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
}

/* ======================
   PRODUCT INFO
   ====================== */

.product-info {
    padding: 1.5rem;
    color: #ffffff;
    font-family: 'Segoe UI', Arial, sans-serif;
    text-align: center;
}

.product-info h3 {
    font-size: 1.2rem;
    font-weight: 600;
    color: #ffffff;
    margin: 0 0 1rem 0;
    line-height: 1.3;
}

/* Price Styling */
.product-info p:first-of-type {
    font-size: 1.1rem;
    font-weight: 700;
    color: #ff4444;
    margin: 0 0 1rem 0;
}

/* Stock and Size Info */
.product-info p:not(:first-of-type) {
    font-size: 0.95rem;
    color: #cccccc;
    margin: 0.5rem 0;
    font-weight: 400;
}

/* ======================
   PRODUCT ACTIONS
   ====================== */

.product-actions {
    padding: 0 1.5rem 1.5rem;
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
}

.product-actions form {
    width: 100%;
}

.product-actions button {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid #ff4444;
    border-radius: 6px;
    font-size: 0.95rem;
    font-weight: 600;
    color: #ffffff;
    background-color: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    text-transform: none;
    font-family: 'Segoe UI', Arial, sans-serif;
}

/* Add to Cart Button - Red Border */
.product-actions form:first-child button {
    border-color: #ff4444;
    color: #ffffff;
}

.product-actions form:first-child button:hover {
    background-color: #ff4444;
    color: #ffffff;
}

/* View Product Button - White Border */
.product-actions form:nth-child(2) button {
    border-color: #ffffff;
    color: #ffffff;
}

.product-actions form:nth-child(2) button:hover {
    background-color: #ffffff;
    color: #333333;
}

/* Buy Now Button - Blue Border */
.product-actions form:nth-child(3) button {
    border-color: #4CAF50;
    color: #ffffff;
}

.product-actions form:nth-child(3) button:hover {
    background-color: #4CAF50;
    color: #ffffff;
}

/* ======================
   HEADER SECTION
   ====================== */

.products-header {
    text-align: center;
    padding: 2rem 0;
    background-color: #000000;
    color: #ffffff;
}

.products-header h2 {
    font-size: 2.5rem;
    font-weight: 700;
    margin: 0 0 0.5rem 0;
    color: #ffffff;
}

.products-header p {
    font-size: 1.1rem;
    color: #cccccc;
    margin: 0;
}

/* ======================
   FILTER SECTION
   ====================== */

.filter-section {
    background-color: #000000;
    padding: 1rem 0 2rem;
}

.filter-container {
    max-width: 1400px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    gap: 2rem;
    flex-wrap: wrap;
    padding: 0 1rem;
}

.filter-group {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.filter-group label {
    color: #ffffff;
    font-weight: 600;
    font-size: 0.95rem;
}

.filter-group select {
    padding: 0.5rem 1rem;
    border: 1px solid #555555;
    border-radius: 6px;
    background-color: #333333;
    color: #ffffff;
    font-size: 0.95rem;
    cursor: pointer;
}

.filter-group select:focus {
    outline: none;
    border-color: #ff4444;
}

/* ======================
   MAIN LAYOUT
   ====================== */

main {
    background-color: #000000;
    min-height: 100vh;
}

body {
    background-color: #000000;
    margin: 0;
    padding: 0;
}

/* ======================
   ERROR STATES
   ====================== */

.error-box {
    background-color: #2d1b1b;
    border: 2px solid #ff4444;
    border-radius: 12px;
    padding: 2rem;
    margin: 2rem auto;
    max-width: 600px;
    text-align: center;
    font-family: 'Segoe UI', Arial, sans-serif;
}

.error-box p {
    color: #ff4444;
    font-size: 1.1rem;
    margin-bottom: 1rem;
    font-weight: 500;
}

.error-box button {
    padding: 0.75rem 2rem;
    background-color: #ff4444;
    border: none;
    color: white;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.3s ease;
}

.error-box button:hover {
    background-color: #ff6666;
}

/* ======================
   RESPONSIVE ADJUSTMENTS
   ====================== */

@media (max-width: 768px) {
    .products-header h2 {
        font-size: 2rem;
    }
    
    .filter-container {
        flex-direction: column;
        align-items: center;
        gap: 1rem;
    }
    
    .product-info {
        padding: 1rem;
    }
    
    .product-actions {
        padding: 0 1rem 1rem;
    }
}


.product-actions button:focus {
    outline: 2px solid #ffffff;
    outline-offset: 2px;
}

@media (prefers-reduced-motion: reduce) {
    .product-card,
    .product-actions button {
        transition: none;
    }
    
    .product-card:hover {
        transform: none;
    }
}input[type="number"] {
  width: 80px;
  padding: 8px 10px;
  font-size: 16px;
  border: 1px solid #ff4444;
  border-radius: 6px;
  outline: none;
  transition: border-color 0.3s, box-shadow 0.3s;
  color: #ffffff;
  background-color: #1a1a1a;
}

input[type="number"]:focus {
  border-color: #ff4444;
  box-shadow: 0 0 4px rgba(255, 68, 68, 0.5);
}


</style>
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
<%@ include file="navbar.jsp" %>
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
               <form action="${pageContext.request.contextPath}/AddToCartServlet" method="post">
    <input type="hidden" name="variantId" value="<%= p.getVariantId() %>" />
    <input type="hidden" name="quantity" value="1" min="1" />
    <button type="submit">Add to Cart</button>
</form>
<!-- View Product Button -->
<form action="<%= request.getContextPath() %>/ShowProductDetailsServlet" method="get" style="display:inline;">
    <input type="hidden" name="variantId" value="<%= p.getVariantId() %>" />
    <button type="submit" class="view-product-btn">View Product</button>
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