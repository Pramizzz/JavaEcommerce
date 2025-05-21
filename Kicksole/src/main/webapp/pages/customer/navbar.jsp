<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="DAO.UsercDAO" %>
<%@ page import="model.Userc" %>
    
<%!
    // Declaration section - variables declared here are class members
    String username;
    Userc user;
%>

<%
    String currentPage = request.getRequestURI();
    // Initialize the variables
    username = (String) session.getAttribute("username");
    user = (Userc) session.getAttribute("user");
%>
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/images/Jordan_Logo.png" alt="Jordan Logo" />
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
            <li class="<%= currentPage.endsWith("cart.jsp") ? "active" : "" %>">
    <a href="<%= request.getContextPath() %>/pages/customer/cart.jsp">
        <i class='bx bx-cart'></i> Cart
    </a>
</li>


            <li class="<%= currentPage.endsWith("contact.jsp") ? "active" : "" %>">
                <a href="<%= request.getContextPath() %>/pages/customer/contact.jsp">Contact</a>
            </li>
           <% if (user != null && user.getRole() != null && user.getRole().equalsIgnoreCase("admin")) { %>
			    <li>
			        <a href="<%= request.getContextPath() %>/pages/admin/adminDashboard.jsp" title="Admin Panel">👑 Admin Dashboard</a>
			    </li>
			<% } %>

<%
    if (username != null && user == null) {
        UsercDAO userDAO = new UsercDAO();
        user = userDAO.getUserByUsername(username);
        session.setAttribute("user", user);
    }
%>

<% if (username == null) { %>
    <!-- Show Login/Signup when not logged in -->
    <li class="<%= currentPage.endsWith("login.jsp") ? "active" : "" %>">
        <a href="<%= request.getContextPath() %>/pages/customer/login.jsp">Login</a>
    </li>
    <li>
        <a href="<%= request.getContextPath() %>/pages/customer/registration.jsp">Sign Up</a>
    </li>
<% } else { %>
    <!-- Show Dropdown when logged in -->
    <li class="user-dropdown">
        <button class="profile-btn" onclick="toggleDropdown()">
            <img src="https://ui-avatars.com/api/?name=<%= username %>&background=random"
                 alt="Profile"
                 class="profile-pic" />
        </button>
        <div class="dropdown-content" id="profile-dropdown">
            <span><%= username %></span>
            <a href="<%= request.getContextPath() %>/pages/customer/dashboard.jsp">Profile</a>
            <a href="<%= request.getContextPath() %>/pages/customer/logout.jsp">Logout</a>
        </div>
    </li>
<% } %>
        </ul>
    </nav>
    <style>
    nav ul li.active a {
    color: #fff;              /* White text */
    background-color: #333;   /* Dark background */
    border-radius: 140px;
    padding: 8px 12px;
    transition: background-color 0.3s ease;
    font-weight: bold;
}

nav ul li a {
    text-decoration: none;
    color: #aaa;              /* Light gray text by default */
    padding: 8px 12px;
    transition: color 0.3s ease;
}

nav ul li a:hover {
    color: #fff;
}
    
    .user-dropdown {
        position: relative;
        display: inline-block;
    }

    .profile-btn {
        background: none;
        border: none;
        cursor: pointer;
        padding: 0;
    }

    .profile-pic {
        width: 40px;
        height: 40px;
        border-radius: 50%; /* makes it circular */
        object-fit: cover;
        border: 2px solid #fff;
    }

    /* Dropdown hidden by default */
    .dropdown-content {
        display: none;
        position: absolute;
        top: 50px; /* below avatar */
        right: 0;
        background-color:#000000;
        min-width: 160px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        border-radius: 6px;
        z-index: 1000;
        text-align: left;
    }

    .dropdown-content span {
        display: block;
        padding: 10px;
        font-weight: bold;
        border-bottom: 1px solid #ddd;
        color: #fff;
    }

    .dropdown-content a {
        display: block;
        padding: 10px;
        color: #fff;
        text-decoration: none;
    }

    .dropdown-content a:hover {
        background-color: #000000;
    }

    /* Show dropdown when .show class is added */
    .user-dropdown.show .dropdown-content {
        display: block;
    }
    </style>
</header>
<script>
function toggleDropdown() {
    const dropdown = document.querySelector('.user-dropdown');
    dropdown.classList.toggle('show');
}

// Hide dropdown if clicked outside
window.addEventListener('click', function(event) {
    const dropdown = document.querySelector('.user-dropdown');
    if (!event.target.closest('.user-dropdown')) {
        dropdown.classList.remove('show');
    }
});
</script>