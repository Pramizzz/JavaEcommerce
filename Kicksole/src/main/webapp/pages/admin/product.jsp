<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Product Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background: #f4f4f4;
    }
    .container {
      display: flex;
      max-width: 1000px;
      margin: 50px auto;
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .product-img {
      flex: 1;
      background: #eee;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .product-img img {
      width: 100%;
      max-width: 400px;
    }
    .product-details {
      flex: 1;
      padding: 30px;
    }
    .product-details h1 {
      margin: 0 0 10px;
    }
    .price {
      color: #e63946;
      font-size: 24px;
      margin: 10px 0;
    }
    .rating {
      color: gold;
      margin-bottom: 20px;
    }
    .description {
      margin: 20px 0;
      color: #555;
    }
    .sizes {
      margin-bottom: 20px;
    }
    select {
      padding: 8px;
      font-size: 16px;
    }
    button {
      background: #1d3557;
      color: white;
      padding: 15px 25px;
      border: none;
      font-size: 16px;
      cursor: pointer;
      border-radius: 5px;
    }
    button:hover {
      background: #457b9d;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="product-img">
      <img src="https://via.placeholder.com/400" alt="Product Image" />
    </div>
    <div class="product-details">
      <h1>Stylish Sneakers</h1>
      <div class="price">$89.99</div>
      <div class="rating">★★★★☆ (120 reviews)</div>
      <div class="description">
        These sneakers are the perfect blend of comfort and style. Lightweight, durable, and designed for all-day wear.
      </div>
      <div class="sizes">
        <label for="size">Size:</label>
        <select id="size">
          <option>7</option>
          <option>8</option>
          <option>9</option>
          <option>10</option>
          <option>11</option>
        </select>
      </div>
      <button>Add to Cart</button>
    </div>
  </div>
</body>
</html>