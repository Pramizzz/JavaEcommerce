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
    <script src="<%= request.getContextPath() %>/javascript/script.js"></script>
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
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
                    <a href="<%= request.getContextPath() %>/pages/customer/product.jsp" class="cta-button">Shop Collection</a>
                </div>
            </section>

            <!-- Featured Products -->
            <section class="featured">
                <h2 class="section-title">Featured Releases</h2>
                <div class="products-grid">
                    <div class="product-card" data-id="1">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/images/Air_Jordan_1_Retro-removebg-preview.png" alt="Air Jordan 1 Mid" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 1 Mid</h3>
                            <p class="price">$125.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="2">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/images/Air_Jordan_1_Retro_High_OG-removebg-preview.png" alt="Air Jordan 1 Mid"
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
                            <img src="${pageContext.request.contextPath}/images/Air_Jordan_3_Retro-removebg-preview.png"
                                alt="" />
                        </div>
                        <div class="product-info">
                            <h3>Air Jordan 11 Retro</h3>
                            <p class="price">$225.00</p>
                            <button class="add-to-cart">Add to Cart</button>
                        </div>
                    </div>

                    <div class="product-card" data-id="4">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/images/Air_Jordan_4_Retro-removebg-preview.png"
                                alt="" />
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
                            <img src="${pageContext.request.contextPath}/images/slider_image1.jpg" alt="">
                            <div class="text-content">
                                <h3>Nike Jordan 3 Retro</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/images/slider_image2.jpg" alt="">
                            <div class="text-content">
                                <h3>Nike Jordan MVP Trainers</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/images/slider_image3.jpg" alt="">
                            <div class="text-content">
                                <h3>Nike Jordan 5 Oreo</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/images/slider_image4.jpg" alt="">
                            <div class="text-content">
                                <h3>Nike Jordan Luka 2</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/images/slider_image5.jpg" alt="">
                            <div class="text-content">
                                <h3>Nike Jorddan Air Ubempo</h3>
                                <p>Lorem ipsum dolor sit amet </p>
                                <button class="btn">Read More</button>
                            </div>
                        </div>
                        <div class="content swiper-slide">
                            <img src="${pageContext.request.contextPath}/images/slider_image6.jpg" alt="">
                            <div class="text-content">
                                <h3>Nike Jordan 5 oreo</h3>
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