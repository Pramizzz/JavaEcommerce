<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String currentPage = request.getRequestURI();%>
    
 <header>
            <div class="logo">
                <img src="${pageContext.request.contextPath}/resources/images/Jordan_Logo.png" alt="Jordan Logo">
                <h1>Kicksole</h1>
            </div>
            <nav>
                <div class="menu-icon" id="menuToggle">
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                </div>
                 <ul class="nav-links">
				    <li class="<%= currentPage.endsWith("home.jsp") ? "active" : "" %>">
				        <a href="<%= request.getContextPath() %>/pages/customer/home.jsp">Home</a>
				    </li>
				    <li class="<%= currentPage.endsWith("product.jsp") ? "active" : "" %>">
				        <a href="<%= request.getContextPath() %>/pages/customer/product.jsp">Products</a>
				    </li>
				    <li class="<%= currentPage.endsWith("about.jsp") ? "active" : "" %>">
				        <a href="<%= request.getContextPath() %>/pages/customer/about.jsp">About Us</a>
				    </li>
				    <li class="<%= currentPage.endsWith("contact.jsp") ? "active" : "" %>">
				        <a href="<%= request.getContextPath() %>/pages/customer/contact.jsp">Contact</a>
				    </li>
				    <li class="<%= currentPage.endsWith("login.jsp") ? "active" : "" %>">
				        <a href="<%= request.getContextPath() %>/pages/customer/login.jsp">Login</a>
				    </li>
				</ul>

            </nav>
        </header>