<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Premium Jordan sneakers collection" />
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
                    <a href="<%= request.getContextPath() %>/pages/customer/product.jsp" class="cta-button">Shop Collection</a>
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
                            <img src="${pageContext.request.contextPath}/resources/images/slider_image1.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/resources/images/slider_image2.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/resources/images/slider_image3.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/resources/images/slider_image1.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/resources/images/slider_image2.jpg" alt="">
                            <div class="text-content">
                                <h3>Photography</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/resources/images/slider_image3.jpg" alt="">
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