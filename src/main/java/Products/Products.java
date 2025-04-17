package Products;
//Product.java
public class Products {
 private int id;
 private String name;
 private String category;
 private String subCategory;
 private String details;
 private double price;
 private int stock;
 private String imageUrl;

 // Getters and Setters
 public int getId() { return id; }
 public void setId(int id) { this.id = id; }

 public String getName() { return name; }
 public void setName(String name) { this.name = name; }

 public String getCategory() { return category; }
 public void setCategory(String category) { this.category = category; }

 public String getSubCategory() { return subCategory; }
 public void setSubCategory(String subCategory) { this.subCategory = subCategory; }

 public String getDetails() { return details; }
 public void setDetails(String details) { this.details = details; }

 public double getPrice() { return price; }
 public void setPrice(double price) { this.price = price; }

 public int getStock() { return stock; }
 public void setStock(int stock) { this.stock = stock; }

 public String getImageUrl() { return imageUrl; }
 public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}
