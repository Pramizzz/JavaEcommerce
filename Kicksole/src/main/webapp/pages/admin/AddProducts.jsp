<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="DAO.AddBrandDAO"%>
<%@ page import="DAO.CategoryModelDAO"%>
<%@ page import="DAO.AddProductDAO"%>
<%@ page import="model.AddBrandModel"%>
<%@ page import="model.AddCategory"%>
<%@ page import="model.DisplayProductmodel"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admincss/adminproduct.css">
<meta charset="UTF-8">
<title>Products Management</title>
<style>
/* [existing styles remain unchanged] */
/* Add Product Button */
#toggleProductForm {
	background-color: #28a745;
	color: white;
	padding: 10px 20px;
	border-radius: 6px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	margin-bottom: 20px;
}

#toggleProductForm:hover {
	background-color: #218838;
}
</style>
</head>
<body>



	<%
	String error = request.getParameter("error");
	String success = request.getParameter("success");

	String message = "";
	String messageType = "";

	if (error != null) {
		messageType = "error";
		switch (error) {
			case "InvalidStock" :
		message = "Stock quantity must be a positive number and not exceed the integer limit.";
		break;
			case "InvalidPrice" :
		message = "Invalid price. Please enter a valid numeric value.";
		break;
			case "InvalidSize" :
		message = "Size must be a numeric value.";
		break;
			case "InvalidColor" :
		message = "Color should not contain only numbers.";
		break;
			case "InvalidImage" :
		message = "Uploaded file must be an image (jpg, jpeg, png, gif, bmp).";
		break;
			case "ServerError" :
		message = "Something went wrong while processing. Please try again.";
		break;
			default :
		message = "Unknown error occurred.";
		break;
		}
	} else if ("1".equals(success)) {
		messageType = "success";
		message = "Product added successfully!";
	}
	%>

	<%-- Message Display --%>
<%
if (!message.isEmpty()) {
%>
<div
    style="padding: 10px; color: <%= "success".equals(messageType) ? "green" : "red" %>; 
           border: 1px solid <%= "success".equals(messageType) ? "green" : "red" %>; 
           margin-bottom: 15px;
           width: fit-content;
           margin-left: auto;
           margin-right: auto;
           text-align: center;">
    <%= message %>
</div>
<%
}
%>



	<div class="sidebar">
		<h2>Admin Panel</h2>
		<a href="../admin/adminDashbord.jsp">Dashboard</a> <a
			href="../admin/category.jsp">Add Category</a> <a
			href="../admin/products.jsp">Products</a> <a href="../admin/user.jsp">Manage
			Users</a> <a href="../admin/order.jsp">Orders</a> <a
			href="../admin/report.jsp">Reports</a> <a href="../admin/setting.jsp">Settings</a>
		<a href="../home.jsp">Logout</a>
	</div>

	<div class="header">
		<h1>Product Management</h1>
	</div>

	<%
	List<AddBrandModel> brands = null;
	List<AddCategory> categories = null;
	try {
		AddBrandDAO brandDAO = new AddBrandDAO();
		brands = brandDAO.getAllBrands();
		request.setAttribute("brands", brands);
		
		CategoryModelDAO categoryDAO = new CategoryModelDAO();
		categories = categoryDAO.getAllCategories();
		request.setAttribute("categories", categories);
	} catch (Exception e) {
		e.printStackTrace();
	}
	String selectedBrandId = (String) request.getAttribute("brandId");
	String selectedCategoryId = (String) request.getAttribute("categoryId");
	%>

	<div class="content">
		<button id="toggleProductForm">Add Product
		
		</button>
		<!-- Product Form Container (Initially Hidden) -->
		<div id="productFormWrapper" style="display: none;">
			<div id="productFormContainer">
				<h2 style="margin-bottom: 20px;">Add New Product</h2>
				<form action="${pageContext.request.contextPath}/AddProductServlet"
					method="post" enctype="multipart/form-data">
					<label for="productName">Product Name:</label> <input type="text"
						id="productName" name="productName" class="form-input"
						value="<%=request.getAttribute("productName") != null ? request.getAttribute("productName") : ""%>">
					<span style="color: red;"><%=request.getAttribute("productNameError") != null ? request.getAttribute("productNameError") : ""%></span>

					<label for="price">Price:</label> <input type="number" id="price"
						name="productPrice" class="form-input" step="0.01"
						value="<%=request.getAttribute("price") != null ? request.getAttribute("price") : ""%>">
					<span style="color: red;"><%=request.getAttribute("priceError") != null ? request.getAttribute("priceError") : ""%></span>

					<label for="brandId">Brand:</label> <select id="brandId"
						name="brandId" class="form-input">
						<option value="">-- Select Brand --</option>
						<%
						if (brands != null) {
							for (AddBrandModel brand : brands) {
								String brandIdStr = String.valueOf(brand.getBrandId());
								String selected = brandIdStr.equals(selectedBrandId) ? "selected" : "";
						%>
						<option value="<%=brandIdStr%>" <%=selected%>><%=brand.getBrandName()%></option>
						<%
						}
						}
						%>
					</select> <span style="color: red;"><%=request.getAttribute("brandIdError") != null ? request.getAttribute("brandIdError") : ""%></span>

					<label for="categoryId">Category:</label> <select id="categoryId"
						name="categoryId" class="form-input">
						<option value="">-- Select Category --</option>
						<%
						if (categories != null) {
							for (AddCategory category : categories) {
								String categoryIdStr = String.valueOf(category.getCategoryId());
								String selected = categoryIdStr.equals(selectedCategoryId) ? "selected" : "";
						%>
						<option value="<%=categoryIdStr%>" <%=selected%>><%=category.getCategoryName()%></option>
						<%
						}
						}
						%>
					</select> <span style="color: red;"><%=request.getAttribute("categoryIdError") != null ? request.getAttribute("categoryIdError") : ""%></span>

					<div class="variant-section">
						<h4>Variant</h4>
						<label for="size">Size:</label> <input type="text" id="size"
							name="variantSize" class="form-input"
							value="<%=request.getAttribute("size") != null ? request.getAttribute("size") : ""%>">
						<span style="color: red;"><%=request.getAttribute("sizeError") != null ? request.getAttribute("sizeError") : ""%></span>

						<label for="color">Color:</label> <input type="text" id="color"
							name="variantColor" class="form-input"
							value="<%=request.getAttribute("color") != null ? request.getAttribute("color") : ""%>">
						<span style="color: red;"><%=request.getAttribute("colorError") != null ? request.getAttribute("colorError") : ""%></span>

						<label for="stockQuantity">Stock Quantity:</label> <input
							type="number" id="stockQuantity" name="variantStock"
							class="form-input" min="0"
							value="<%=request.getAttribute("stock") != null ? request.getAttribute("stock") : ""%>">
						<span style="color: red;"><%=request.getAttribute("stockError") != null ? request.getAttribute("stockError") : ""%></span>
					</div>

					<label for="image">Select Images:</label> <input type="file"
						id="image" name="productImages" class="form-input"
						accept="image/*" multiple>

					<div id="imagePreview" class="image-preview"></div>

					<button type="submit" class="form-button">Add Product</button>
				</form>

			</div>
		</div>


		<h2>Existing Products</h2>


		<c:if test="${not empty error}">
			<div style="color: red; margin-bottom: 10px;">
				<c:choose>
					<c:when test="${error == 'invalidNumber'}">Price and stock must be non-negative numbers.</c:when>
					<c:when test="${error == 'invalidInput'}">Invalid number format.</c:when>
					<c:when test="${error == 'nonPositiveValue'}">Price and stock must be greater than 0.</c:when>
					<c:when test="${error == 'invalidColor'}">Color must contain only letters and spaces.</c:when>
					<c:when test="${error == 'updateFailed'}">Failed to update product. Try again.</c:when>
					<c:when test="${error == 'invalidSize'}">Size must be an integer between 1 and 50.</c:when>
					<c:when test="${error == 'invalidSizeFormat'}">Size must be a whole number, not a decimal or text.</c:when>
				</c:choose>
			</div>
		</c:if>
		<%
		AddProductDAO productDAO = new AddProductDAO();
		List<DisplayProductmodel> products = productDAO.getAllProducts();
		request.setAttribute("products", products);
		%>



		<table border="1" class="product-table" cellpadding="5"
			cellspacing="0" style="width: 100%; border-collapse: collapse;">
			<thead>
				<tr>
					<th>Product ID</th>
					<th>Name</th>
					<th>Brand</th>
					<th>Category</th>
					<th>Price</th>
					<th>Size</th>
					<th>Color</th>
					<th>Stock</th>
					<th>Images</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products}">
					<tr>
						<!-- Update form -->
						<form
							action="${pageContext.request.contextPath}/UpdateProductServlet"
							method="post" enctype="multipart/form-data">
							<td><input type="hidden" name="productId"
								value="${product.productId}" /> ${product.productId}</td>
							<td><input type="text" name="productName"
								value="${product.productName}" required /></td>

							<td><select name="brandId" required>
									<c:forEach var="brand" items="${brands}">
										<option value="${brand.brandId}"
											<c:if test="${brand.brandId == product.brandId}">selected</c:if>>
											${brand.brandName}</option>
									</c:forEach>
							</select></td>

							<td><select name="categoryId" required>
									<c:forEach var="category" items="${categories}">
										<option value="${category.categoryId}"
											<c:if test="${category.categoryId == product.categoryId}">selected</c:if>>
											${category.categoryName}</option>
									</c:forEach>
							</select></td>

							<td><input type="number" step="0.01" name="productPrice"
								value="${product.price}" required /></td>
							<td><input type="text" name="variantSize"
								value="${product.variantSize}" /></td>
							<td><input type="text" name="variantColor"
								value="${product.variantColor}" /></td>
							<td><input type="number" name="variantStock"
								value="${product.variantStock}" /></td>

							<td><c:forEach var="img" items="${product.imagePaths}">
									<img src="<%=request.getContextPath() %>/${img}" width="50"
										height="50" alt="Product Image" style="margin: 2px;" />
								</c:forEach> <br /> <input type="file" name="productImages"
								accept="image/*" multiple /></td>

							<td>
								<button type="submit">Update</button>
						</form>

						<!-- Delete form -->
						<form
							action="${pageContext.request.contextPath}/DeleteProductServlet" method="get" style="margin-top: 5px;">
							<input type="hidden" name="productId"
								value="${product.productId}" />
							<button type="submit"
								onclick="return confirm('Are you sure you want to delete this product?');">Delete</button>
						</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


<script>
    document.getElementById('toggleProductForm').addEventListener('click', function () {
        const formWrapper = document.getElementById('productFormWrapper');
        const toggleBtn = document.getElementById('toggleProductForm');

        if (formWrapper.style.display === 'none' || formWrapper.style.display === '') {
            formWrapper.style.display = 'block';
            toggleBtn.textContent = 'Hide Product Form';
        } else {
            formWrapper.style.display = 'none';
            toggleBtn.textContent = 'Add Product';
        }
    });

    function openEditModal(id, name, price) {
        document.getElementById('editProductId').value = id;
        document.getElementById('editProductName').value = name;
        document.getElementById('editProductPrice').value = price;
        document.getElementById('editModal').style.display = "block";
    }

    function closeEditModal() {
        document.getElementById('editModal').style.display = "none";
    }

    window.onclick = function(event) {
        var modal = document.getElementById('editModal');
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    window.onload = function () {
        const urlParams = new URLSearchParams(window.location.search);
        const formWrapper = document.getElementById('productFormWrapper');
        const toggleBtn = document.getElementById('toggleProductForm');

        if (urlParams.has('error') || urlParams.has('success')) {
            formWrapper.style.display = 'block';
            toggleBtn.textContent = 'Hide Product Form';
        }

        // Server-side controlled showForm
        <% if (request.getAttribute("showForm") != null && (Boolean)request.getAttribute("showForm") == true) { %>
            if (formWrapper) {
                formWrapper.style.display = 'block';
            }
            if (toggleBtn) {
                toggleBtn.textContent = 'Hide Product Form';
            }
        <% } %>
    }
</script>


</body>
</html>