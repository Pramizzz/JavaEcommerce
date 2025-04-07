<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us - Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Contact Shadow Sneaks for any inquiries" />
    <link rel="stylesheet" href="../css/styles.css" />
    <script src="script.js" defer></script>
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
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="products.jsp">Products</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li class="active"><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <section class="contact-hero">
                <div class="contact-hero-content">
                    <h2>Get In Touch</h2>
                    <p>We'd love to hear from you</p>
                </div>
            </section>

            <section class="contact-section">
                <div class="contact-container">
                    <div class="contact-form-container">
                        <h3>Send Us a Message</h3>
                        <form id="contactForm" class="contact-form">
                            <div class="form-group">
                                <label for="name">Your Name</label>
                                <input type="text" id="name" name="name" required />
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" id="email" name="email" required />
                            </div>
                            <div class="form-group">
                                <label for="subject">Subject</label>
                                <input type="text" id="subject" name="subject" required />
                            </div>
                            <div class="form-group">
                                <label for="message">Your Message</label>
                                <textarea id="message" name="message" rows="5" required></textarea>
                            </div>
                            <button type="submit" class="submit-btn">Send Message</button>
                        </form>
                        <p id="form-message" class="message"></p>
                    </div>
                    <div class="contact-info">
                        <h3>Contact Information</h3>
                        <div class="info-item">
                            <h4>Address</h4>
                            <p>123 Sneaker Street</p>
                            <p>Portland, OR 97201</p>
                        </div>
                        <div class="info-item">
                            <h4>Phone</h4>
                            <p>(555) 123-4567</p>
                        </div>
                        <div class="info-item">
                            <h4>Email</h4>
                            <p>info@shadowsneaks.com</p>
                        </div>
                        <div class="info-item">
                            <h4>Hours</h4>
                            <p>Monday - Friday: 9am - 6pm</p>
                            <p>Saturday: 10am - 5pm</p>
                            <p>Sunday: Closed</p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="map-section">
                <h3>Find Us</h3>
                <div class="map-container">
                    <!-- Replace with actual map embed code if available -->
                    <div class="map-placeholder">
                        <img src="https://via.placeholder.com/1200x400/1a1a1a/c9082a?text=Store+Location+Map"
                            alt="Store Location Map" />
                    </div>
                </div>
            </section>

            <section class="faq-section">
                <h3>Frequently Asked Questions</h3>
                <div class="faq-container">
                    <div class="faq-item">
                        <div class="faq-question">
                            <h4>Do you ship internationally?</h4>
                            <span class="toggle-icon">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>Yes, we ship to most countries worldwide. Shipping costs and delivery times vary by
                                location.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <h4>How can I track my order?</h4>
                            <span class="toggle-icon">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>Once your order ships, you'll receive a tracking number via email that allows you to
                                monitor your package's journey.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <h4>What is your return policy?</h4>
                            <span class="toggle-icon">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>We offer a 30-day return policy for unworn items in their original packaging. Return
                                shipping is free within the US.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <h4>Are all your products authentic?</h4>
                            <span class="toggle-icon">+</span>
                        </div>
                        <div class="faq-answer">
                            <p>Absolutely! We guarantee 100% authenticity on all Jordan products and provide
                                certificates of authenticity with select items.</p>
                        </div>
                    </div>
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