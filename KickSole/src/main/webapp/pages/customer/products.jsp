<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.*,model.DisplayProductmodel,DAO.AddProductDAO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Products - Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Browse our premium Jordan sneakers collection" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
       <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
       <script src="<%= request.getContextPath() %>/resources/javascript/script.js"></script>
</head>

<body>
     <%-- <%@ include file="navbar.jsp" %>--%>

    <main>
        <section class="products-header">
            <h2>Jordan Collection</h2>
            <p>Explore iconic styles and the latest drops</p>
        </section>

        <section class="filter-section">
            <div class="filter-container">
                <div class="filter-group">
                    <label for="category">Category:</label>
                    <select id="category">
                        <option value="all">All Products</option>
                        <option value="jordan-1">Air Jordan 1</option>
                        <option value="jordan-3">Air Jordan 3</option>
                        <option value="jordan-4">Air Jordan 4</option>
                        <option value="jordan-11">Air Jordan 11</option>
                        <option value="lifestyle">Lifestyle</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="price">Sort by:</label>
                    <select id="price">
                        <option value="default">Featured</option>
                        <option value="low-high">Price: Low to High</option>
                        <option value="high-low">Price: High to Low</option>
                        <option value="newest">Newest</option>
                    </select>
                </div>
            </div>
        </section>

       <%
AddProductDAO dao = new AddProductDAO(); 
List<DisplayProductmodel> products = dao.getAllProducts(); 
%>

<section class="products-grid-container">
    <div class="products-grid" id="productsContainer">
        <%
        for(DisplayProductmodel p : products) {
        %>
        <div class="product-card">
            <div class="product-image">
                <img src="uploads/<%= p.getImagePaths() %>" alt="<%= p.getProductName()%>">
            </div>
            <div class="product-info">
                <h3><%= p.getProductName() %></h3>
                <p>Price: ₹<%= p.getPrice() %></p>
                <p>Quantity: <%= p.getVariantStock()%></p>
                <p>Brand: <%= p.getBrandId() %></p>
               
            </div>
            <div class="product-actions">
                
                
            </div>
        </div>
        <%
        }
        %>
    </div>
</section>

     <%@ include file="footer.jsp" %>

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
                <span>Total:</span>
                <span id="cartTotal">$0.00</span>
            </div>
            <button class="checkout-btn">Checkout</button>
        </div>
    </div>
    <div class="overlay" id="overlay"></div>
    </div>
</body>

</html>