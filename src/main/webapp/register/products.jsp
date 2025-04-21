<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Products - Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Browse our premium Jordan sneakers collection" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/register/css-all/style.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/register/javascript/script.js"></script>
</head>

<body>
    <header>
        <div class="logo">
            <img src="./images/Jordan Logo.png" alt="Jordan Logo" />
            <h1>Kicksole</h1>
        </div>
        <nav>
            <div class="menu-icon" id="menuToggle">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
             <ul class="nav-links">
    <li ><a href="<%= request.getContextPath() %>/register/home.jsp">Home</a></li>
    <li class="active"><a href="<%= request.getContextPath() %>/register/products.jsp">Products</a></li>
    <li><a href="<%= request.getContextPath() %>/register/about.jsp">About Us</a></li>
    <li><a href="<%= request.getContextPath() %>/register/contact.jsp">Contact</a></li>
    <li><a href="<%= request.getContextPath() %>/register/login.jsp">Login</a></li>
</ul>

                </ul>
        </nav>
    </header>

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

        <section class="products-grid-container">
            <div class="products-grid" id="productsContainer">
                <!-- Products will be loaded dynamically via JavaScript -->
            </div>
        </section>

        <div class="product-detail-modal" id="productModal">
            <div class="product-detail-content">
                <button class="close-modal">&times;</button>
                <div class="product-detail-container" id="productDetailContainer">
                    <!-- Product details will be loaded dynamically -->
                </div>
            </div>
        </div>
    </main>

<footer>
            <div class="footer-content">
                <div class="footer-logo">
                    <img src="./images/Jordan Logo.png" alt="Jordan Logo" />
                    <h2>Kicksole</h2>
                </div>
                <div class="footer-links">
                    <div class="link-group">
                        <h3>Shop</h3>
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/register/products.jsp">New Releases</a></li>
                        </ul>
                    </div>
                    <div class="link-group">
                        <h3>Support</h3>
                        <ul>
                            <li><a href="#">Order Status</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="<%= request.getContextPath() %>/register/contact.jsp">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="link-group">
                        <h3>Company</h3>
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/register/about.jsp">About Us</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Partners</a></li>
                        </ul>
                    </div>
                </div>
            </div>
      
            <div class="footer-bottom">
                <p>&copy; 2025 Shadow Sneaks. All rights reserved.</p>
                <div class="social-links">
                    <i class='bx bxl-facebook-circle' , id="social-icon"></i>
                    <i class='bx bxl-instagram' , id="social-icon"></i>
                    <i class='bx bxl-twitter' , id="social-icon"></i>
                    <i class='bx bxl-linkedin' , id="social-icon"></i>
                </div>
            </div>
        </footer>

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