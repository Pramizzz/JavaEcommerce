<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Premium Jordan sneakers collection" />
<<<<<<< HEAD
    <link rel="stylesheet" href="../../css/pagescss/style.css" />
    <script src="./script.js" defer></script>
    <!-- IMPORTANT: DO NOT REMOVE THIS SCRIPT TAG OR THIS VERY COMMENT! -->
    <script src="https://cdn.gpteng.co/gptengineer.js" type="module"></script>
</head>

<body>
    <div id="root">
        <header>
            <div class="logo">
                <img src="https://www.jumpman23.com/favicon.ico" alt="Jordan Logo" />
                <h1>Shadow Sneaks</h1>
            </div>
            <nav>
                <div class="menu-icon" id="menuToggle">
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                </div>
                <ul class="nav-links">
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="products.jsp">Products</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <!-- Hero Section -->
            <section class="hero">
                <div class="hero-content">
                    <h2>Step Into Greatness</h2>
                    <p>Discover the latest Jordan releases and iconic classics</p>
                    <a href="products.html" class="cta-button">Shop Collection</a>
                </div>
            </section>

            <!-- Featured Products -->
            <section class="featured">
                <h2 class="section-title">Featured Releases</h2>
                <div class="products-grid">
                    <div class="product-card" data-id="1">
                        <div class="product-image">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/fd43a343-1651-4965-99df-68ca5c3a29f1/air-jordan-1-mid-shoes-SQf7DM.png"
                                alt="Air Jordan 1 Mid" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 1 Mid</h3>
                            <p class="price">$125.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="2">
                        <div class="product-image">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/33533fe2-1157-4001-896e-1803c60f0ea8/air-jordan-4-retro-shoes-DbgkPK.png"
                                alt="Air Jordan 4 Retro" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 4 Retro</h3>
                            <p class="price">$210.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="3">
                        <div class="product-image">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6d1f8d21-6f3f-418f-ae0e-d25da8364dc8/air-jordan-11-retro-shoes-TnZ9vy.png"
                                alt="Air Jordan 11 Retro" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 11 Retro</h3>
                            <p class="price">$225.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="4">
                        <div class="product-image">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e0479d12-3b22-4744-9489-5f4722196080/zion-2-basketball-shoes-bZ2Snk.png"
                                alt="Zion 2" />
                        </div>
                        <div class="product-info">
                            <h3>Zion 2</h3>
                            <p class="price">$140.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </section>

            <!-- New Arrivals -->
            <section class="new-arrivals">
                <h2 class="section-title">New Arrivals</h2>
                <div class="slider-container">
                    <div class="slider">
                        <div class="slide">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8b04ed02-c3ee-4ca6-a1a5-b1c78132c9cb/air-jordan-3-retro-shoes-TJf2lm.png"
                                alt="Jordan 3 Retro" />
                            <div class="slide-info">
                                <h3>Air Jordan 3 Retro</h3>
                                <p>New Release</p>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/ed6efa3d-bb62-4d5d-af1b-17b19801be1f/air-jordan-13-retro-shoes-xcXV4N.png"
                                alt="Jordan 13 Retro" />
                            <div class="slide-info">
                                <h3>Air Jordan 13 Retro</h3>
                                <p>Coming Soon</p>
                            </div>
                        </div>
                        <div class="slide">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e04d1dc0-11a5-43c4-9c16-0ec6860e0fad/jordan-why-not-6-pf-shoes-v4xPBm.png"
                                alt="Jordan Why Not 6" />
                            <div class="slide-info">
                                <h3>Jordan Why Not 6</h3>
                                <p>Just Released</p>
                            </div>
                        </div>
                    </div>
                    <button class="slider-btn prev">&#10094;</button>
                    <button class="slider-btn next">&#10095;</button>
                </div>
            </section>

            <!-- Newsletter Section -->
            <section class="newsletter">
                <div class="newsletter-content">
                    <h2>Join the Shadow Sneaks Family</h2>
                    <p>Subscribe for exclusive offers, early access to new releases, and updates on the latest drops.
                    </p>
                    <form id="newsletter-form" class="newsletter-form">
                        <input type="email" placeholder="Your email address" required />
                        <button type="submit">Subscribe</button>
                    </form>
                    <p id="newsletter-message" class="message"></p>
                </div>
            </section>
        </main>

        <footer>
            <div class="footer-content">
                <div class="footer-logo">
                    <img src="https://www.jumpman23.com/favicon.ico" alt="Jordan Logo" />
                    <h2>Shadow Sneaks</h2>
                </div>
                <div class="footer-links">
                    <div class="link-group">
                        <h3>Shop</h3>
                        <ul>
                            <li><a href="products.html">New Releases</a></li>
                            <li><a href="products.html">Men</a></li>
                            <li><a href="products.html">Women</a></li>
                            <li><a href="products.html">Kids</a></li>
                        </ul>
                    </div>
                    <div class="link-group">
                        <h3>Support</h3>
                        <ul>
                            <li><a href="#">Order Status</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="contact.html">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="link-group">
                        <h3>Company</h3>
                        <ul>
                            <li><a href="about.html">About Us</a></li>
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
                    <a href="#" class="social-icon">FB</a>
                    <a href="#" class="social-icon">IG</a>
                    <a href="#" class="social-icon">TW</a>
                    <a href="#" class="social-icon">YT</a>
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
=======
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
      <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/resources/javascript/script.js"></script>
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
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
                    <a href="/pages/customer/products.jsp" class="cta-button">Shop Collection</a>
                </div>
            </section>

            <!-- Featured Products -->
            <section class="featured">
                <h2 class="section-title">Featured Releases</h2>
                <div class="products-grid">
                    <div class="product-card" data-id="1">
                        <div class="product-image">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/fd43a343-1651-4965-99df-68ca5c3a29f1/air-jordan-1-mid-shoes-SQf7DM.png"
                                alt="Air Jordan 1 Mid" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 1 Mid</h3>
                            <p class="price">$125.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="2">
                        <div class="product-image">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/33533fe2-1157-4001-896e-1803c60f0ea8/air-jordan-4-retro-shoes-DbgkPK.png"
                                alt="Air Jordan 4 Retro" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 4 Retro</h3>
                            <p class="price">$210.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="3">
                        <div class="product-image">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6d1f8d21-6f3f-418f-ae0e-d25da8364dc8/air-jordan-11-retro-shoes-TnZ9vy.png"
                                alt="Air Jordan 11 Retro" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 11 Retro</h3>
                            <p class="price">$225.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="4">
                        <div class="product-image">
                            <img src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e0479d12-3b22-4744-9489-5f4722196080/zion-2-basketball-shoes-bZ2Snk.png"
                                alt="Zion 2" />
                        </div>
                        <div class="product-info">
                            <h3>Zion 2</h3>
                            <p class="price">$140.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </section>

            <!-- New Arrivals -->
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
    </div>
</body>

</html>

>>>>>>> branch 'MainProject' of https://github.com/Pramizzz/JavaEcommerce.git
