<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, DAO.AddProductDAO, model.DisplayProductmodel" %>
<%
    AddProductDAO dao = new AddProductDAO();
    List<DisplayProductmodel> products = dao.getAllProducts();
    request.setAttribute("products", products);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Premium Jordan sneakers collection" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="${pageContext.request.contextPath}/javascript/script.js"></script>
    <style>
        .hero {
            background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
                url("<%= request.getContextPath() %>/images/Home_Banner.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 0 1rem;
        }
        .add-to-cart-button {
    background-color: #111; /* Dark theme to match sneaker vibe */
    color: #fff;
    border: none;
    padding: 0.6rem 1.2rem;
    font-size: 1rem;
    font-weight: bold;
    text-transform: uppercase;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    border-radius: 8px;
    margin-top: 0.5rem;
    width: 100%;
}

.add-to-cart-button:hover {
    background-color: #d62828; /* Highlight on hover */
    transform: scale(1.05);
}
        
    </style>
</head>

<body>
    <div id="root">
        <%@ include file="navbar.jsp" %>

        <main>
            <!-- Hero Section -->
            <section class="hero">
                <div class="hero-content">
                    <h2>Step Into Greatness</h2>
                    <p>Discover the latest Jordan releases and iconic classics</p>
                    <a href="${pageContext.request.contextPath}/pages/customer/product.jsp" class="cta-button">Shop Collection</a>
                </div>
            </section>

            <!-- Featured Products Section -->
            <section class="featured">
                <h2 class="section-title">Featured Releases</h2>
                <div class="products-grid">
                    <%
                        if (products != null && !products.isEmpty()) {
                            int count = 0;
                            for (DisplayProductmodel p : products) {
                                if (count >= 4) break;
                                if (p.getImagePaths() == null || p.getImagePaths().isEmpty()) continue;
                    %>
                        <div class="product-card" data-id="<%=p.getProductId()%>">
                            <div class="product-image">
                                <img src="<%=request.getContextPath()%>/<%=p.getImagePaths().get(0)%>" alt="<%=p.getProductName()%>" />
                            </div>
                            <div class="product-info">
                                <h3><%=p.getProductName()%></h3>
                                <p class="price">₹<%=p.getPrice()%></p>
                                <% if (p.getVariantStock() > 0) { %>
                                    <p class="stock">In Stock (<%=p.getVariantStock()%>)</p>
                                    <p class="size">Size: <%=p.getVariantSize()%></p>
                                    <form action="${pageContext.request.contextPath}/AddToCartServlet" method="post">
                                        <input type="hidden" name="productId" value="<%=p.getProductId()%>">
                                        <input type="hidden" name="variantSize" value="<%=p.getVariantSize()%>">
                <form action="${pageContext.request.contextPath}/AddToCartServlet" method="post">
    <input type="hidden" name="variantId" value="<%= p.getVariantId() %>" />
    <input type="hidden" name="quantity" value="1" min="1" />
    <button type="submit" class="add-to-cart-button">Add to Cart</button>
</form>

                                    </form>
                                <% } else { %>
                                    <p class="stock out-of-stock">Out of Stock</p>
                                    <button class="add-to-cart" disabled>Out of Stock</button>
                                <% } %>
                            </div>
                        </div>
                    <%
                                count++;
                            }
                        } else {
                    %>
                        <div class="no-products">
                            <p>No featured products available at the moment.</p>
                        </div>
                    <%
                        }
                    %>
                </div>
            </section>

            <!-- Slider Section -->
            <section class="collection">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <% for (int i = 1; i <= 6; i++) { %>
                            <div class="content swiper-slide">
                                <img src="${pageContext.request.contextPath}/images/slider_image<%=i%>.jpg" alt="Jordan Shoe <%=i%>">
                                <div class="text-content">
                                    <h3>Nike Jordan Shoe <%=i%></h3>
                                    <p>Lorem ipsum dolor sit amet</p>
                                    <a href="${pageContext.request.contextPath}/pages/customer/product.jsp" class="btn">Read More</a>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
            </section>
        </main>

        <%@ include file="footer.jsp" %>

        <!-- Cart Sidebar -->
        <div class="cart-sidebar" id="cartSidebar">
            <div class="cart-header">
                <h2>Your Cart</h2>
                <button class="close-cart" id="closeCart">&times;</button>
            </div>
            <div class="cart-items" id="cartItems">
                <!-- Dynamic Cart Items -->
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

        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script>
            const swiper = new Swiper(".mySwiper", {
                effect: "coverflow",
                grabCursor: true,
                centeredSlides: true,
                slidesPerView: "auto",
                coverflowEffect: {
                    rotate: 50,
                    stretch: 0,
                    depth: 100,
                    modifier: 1,
                    slideShadows: true,
                },
                pagination: {
                    el: ".swiper-pagination",
                },
            });
        </script>
    </div>
</body>

</html>
