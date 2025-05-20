<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us - Jordan Shadow Sneaks Hub</title>
    <meta name="description" content="Contact Shadow Sneaks for any inquiries" />

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagescss/style.css">
    <script src="<%= request.getContextPath() %>/resources/javascript/script.js"></script>
</head>

<body>
    <div id="root">
     <%@ include file="navbar.jsp" %>
        
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
                            <p>Lions Marga</p>
                            <p>Pokhara, 33800</p>
                        </div>
                        <div class="info-item">
                            <h4>Phone</h4>
                            <p>98000000</p>
                        </div>
                        <div class="info-item">
                            <h4>Email</h4>
                            <p>info@icp.edu.np</p>
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
                    <div class="map-placeholder">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2486.017974972599!2d84.00150598362767!3d28.214593204896236!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39959434ad2a5bf9%3A0xf4e7f9c749f63113!2sInformatics%20College%20Pokhara!5e0!3m2!1sen!2snp!4v1745160106590!5m2!1sen!2snp"
                            width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"></iframe>
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