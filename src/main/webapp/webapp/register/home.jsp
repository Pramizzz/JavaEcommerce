<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Premium Jordan sneakers collection" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/register/css-all/style.css">


    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <script src="<%= request.getContextPath() %>/register/javascript/script.js"></script>

</head>

<body>
    <div id="root">
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
    <li class="active"><a href="<%= request.getContextPath() %>/register/home.jsp">Home</a></li>
    <li><a href="<%= request.getContextPath() %>/register/products.jsp">Products</a></li>
    <li><a href="<%= request.getContextPath() %>/register/about.jsp">About Us</a></li>
    <li><a href="<%= request.getContextPath() %>/register/contact.jsp">Contact</a></li>
    <li><a href="<%= request.getContextPath() %>/register/login.jsp">Login</a></li>
</ul>

                </ul>
            </nav>
        </header>

        <main>
            <!-- Hero Section -->
            <section class="hero">
                <div class="hero-content">
                    <h2>Step Into Greatness</h2>
                    <p>Discover the latest Jordan releases and iconic classics</p>
                    <a href="<%= request.getContextPath() %>/register/products.jsp" class="cta-button">Shop Collection</a>
                </div>
            </section>

            <!-- Featured Products -->
            <section class="featured">
                <h2 class="section-title">Featured Releases</h2>
                <div class="products-grid">
                    <div class="product-card" data-id="1">
                        <div class="product-image">
                            <img src="./images/Air jordan 1.png" alt="Air Jordan 1 Mid" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 1 Mid</h3>
                            <p class="price">$125.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="2">
                        <div class="product-image">
                            <img src="./images/Air Jordan 4 Retro Red Cement PreSchool.png" alt="Air Jordan 4 Retro" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 4 Retro</h3>
                            <p class="price">$210.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="3">
                        <div class="product-image">
                            <img src="./images/Air Jordan 4 Millitary Black.png" alt="Air Jordan 11 Retro" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 11 Retro</h3>
                            <p class="price">$225.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="4">
                        <div class="product-image">
                            <img src="./images/Air Jordan Court Purple.png" alt="Zion 2" />
                        </div>
                        <div class="product-info">
                            <h3>Zion 2</h3>
                            <p class="price">$140.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Slider -->

            <section class="collection">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="content swiper-slide">
                            <img src="./images/slider_image1.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="./images/slider_image2.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="./images/slider_image3.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="./images/slider_image1.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="./images/slider_image2.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="./images/slider_image3.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


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

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!--Slider Js code -->
    <script>
        //Swiper code index
        var swiper = new Swiper(".mySwiper", {
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

</body>

</html>