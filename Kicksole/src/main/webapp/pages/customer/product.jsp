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
/* Grid layout: 6 per row */
.products-grid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 1.5rem;
    padding: 1rem;
}

/* Product Card */
.product-card {
    background-color: #1e1e1e;
    border-radius: 12px;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.product-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 6px 25px rgba(0, 0, 0, 0.75);
}

/* Image */
.product-image img {
    width: 100%;
    height: 200px;
    object-fit: fill;
   
}

/* Product Info */
.product-info {
    padding: 1rem;
    color: #eaeaea;
    font-family: 'Segoe UI', sans-serif;
}

.product-info h3 {
    font-size: 1.1rem;
    font-weight: 600;
    color: #ffffff;
    margin-bottom: 0.5rem;
}

.product-info p {
    font-size: 0.95rem;
    margin: 0.25rem 0;
    color: #bbbbbb;
}

/* Quantity input */
.product-actions input[type="number"] {
    width: 100%;
    padding: 0.5rem;
    border-radius: 6px;
    background-color: #2d2d2d;
    color: white;
    border: 1px solid #444;
    margin-bottom: 0.8rem;
}

/* Button Container */
.product-actions {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 0.5rem;
    padding: 1rem;
}

/* Buttons */
.product-actions form {
    flex: 1 1 100%;
}

.product-actions button {
    width: 100%;
    padding: 0.6rem 1rem;
    border: none;
    border-radius: 6px;
    font-size: 0.9rem;
    font-weight: 600;
    color: white;
    background-color: #3f51b5; /* Same color for all buttons */
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.product-actions button:hover {
    background-color: #5c6bc0;
}


    .error-box {
        background-color: #ffe6e6;
        border: 2px solid #cc0000;
        padding: 20px;
        border-radius: 8px;
        width: 60%;
        margin: 20px auto;
        text-align: center;
        font-family: Arial, sans-serif;
    }
    .error-box p {
        color: #cc0000;
        font-size: 18px;
    }
    .error-box button {
        margin-top: 15px;
        padding: 10px 20px;
        background-color: #cc0000;
        border: none;
        color: white;
        border-radius: 5px;
        cursor: pointer;
    }
    .error-box button:hover {
        background-color: #990000;
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
    <input type="number" name="quantity" value="1" min="1" />
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