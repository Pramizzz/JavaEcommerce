<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us - Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Learn about Shadow Sneaks Jordan Collection" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
    <script src="<%= request.getContextPath() %>/resources/javascript/script.js"></script>
</head>

<body>
    <div id="root">
         <%@ include file="navbar.jsp" %>

        <main>
            <section class="about-hero">
                <div class="about-hero-content">
                    <h2>Our Story</h2>
                    <p>A legacy of excellence in Jordan sneakers</p>
                </div>
            </section>

            <section class="about-section">
                <div class="about-container">
                    <div class="about-image">
                        <img src="${pageContext.request.contextPath}/resources/images/Group-Photo.png" alt="Group Photo">
                    </div>
                    <div class="about-text">
                        <h3>The Shadow Sneaks Journey</h3>
                        <p>Founded in 2015, Shadow Sneaks started as a small passion project by sneaker enthusiasts
                            dedicated to providing authentic Jordan products to collectors and fans worldwide.</p>
                        <p>What began as a modest online store has grown into one of the most trusted destinations for
                            premium Jordan sneakers, apparel, and accessories. Our commitment to quality, authenticity,
                            and customer satisfaction remains at the core of everything we do.</p>
                        <p>Every pair of sneakers in our collection is carefully selected to ensure it meets the high
                            standards that Michael Jordan's legacy represents. We're not just selling shoes; we're
                            preserving a cultural phenomenon that has transcended basketball and influenced fashion,
                            music, and art across generations.</p>
                    </div>
                </div>
            </section>

            <section class="values-section">
                <h2>Our Values</h2>
                <div class="values-container">
                    <div class="value-card">
                        <div class="value-icon">🔍</div>
                        <h3>Authenticity</h3>
                        <p>We guarantee 100% authentic products, directly sourced from authorized channels.</p>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">👑</div>
                        <h3>Quality</h3>
                        <p>We never compromise on quality, offering only the finest Jordan products.</p>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">🤝</div>
                        <h3>Community</h3>
                        <p>We foster a global community of Jordan enthusiasts, collectors and fans.</p>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">💫</div>
                        <h3>Innovation</h3>
                        <p>We continuously evolve our collection to showcase the latest in Jordan innovation.</p>
                    </div>
                </div>
            </section>

            <section class="team-section">
                <h2>Meet Our Team</h2>
                <div class="team-container">
                    <div class="team-member">
                        <div class="member-image">
                            <img src="${pageContext.request.contextPath}/resources/images/Pramit.png" alt="Team Member" />
                        </div>
                        <h3>Pramit Gurung</h3>
                        <p>Database Design </p>
                        <p>Database Management</p>
                    </div>
                    <div class="team-member">
                        <div class="member-image">
                            <img src="${pageContext.request.contextPath}/resources/images/Reshal.png" alt="Team Member" />
                        </div>
                        <h3>Reshal Shrestha</h3>
                        <p>Designer</p>
                        <p>UI UX design and Product management</p>
                    </div>
                    <div class="team-member">
                        <div class="member-image">
                            <img src="${pageContext.request.contextPath}/resources/images/Aditya.png" alt="Team Member" />
                        </div>
                        <h3>Aditya Karki</h3>
                        <p>Frontend Developer </p>
                        <p>Frontend development and Dynamic content integrator</p>
                    </div>
                    <div class="team-member">
                        <div class="member-image">
                            <img src="${pageContext.request.contextPath}/resources/images/Abin.png" alt="Team Member" />
                        </div>
                        <h3>Abin Udash</h3>
                        <p>Admin Content</p>
                        <p>Admin Panel Development</p>
                    </div>
                    <div class="team-member">
                        <div class="member-image">
                            <img src="${pageContext.request.contextPath}/resources/images/Susmarika.png" alt="Team Member" />
                        </div>
                        <h3>Susmarika Koirala</h3>
                        <p>Login Panel</p>
                        <p>Authorization and Authentication</p>
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
    </div>
</body>

</html>