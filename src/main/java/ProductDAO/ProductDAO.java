package ProductDAO;
//ProductDAO.java
import java.sql.*;
import java.util.*;

public class ProductDAO {
 private Connection conn;

 public ProductDAO(Connection conn) {
     this.conn = conn;
 }

 public void addProduct(Product product) throws SQLException {
     String sql = "INSERT INTO products (name, category, sub_category, details, price, stock, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = conn.prepareStatement(sql);
     ps.setString(1, product.getName());
     ps.setString(2, product.getCategory());
     ps.setString(3, product.getSubCategory());
     ps.setString(4, product.getDetails());
     ps.setDouble(5, product.getPrice());
     ps.setInt(6, product.getStock());
     ps.setString(7, product.getImageUrl());
     ps.executeUpdate();
 }

 public List<Product> getAllProducts() throws SQLException {
     List<Product> products = new ArrayList<>();
     String sql = "SELECT * FROM products";
     Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery(sql);
     while (rs.next()) {
         Product p = new Product();
         p.setId(rs.getInt("id"));
         p.setName(rs.getString("name"));
         p.setCategory(rs.getString("category"));
         p.setSubCategory(rs.getString("sub_category"));
         p.setDetails(rs.getString("details"));
         p.setPrice(rs.getDouble("price"));
         p.setStock(rs.getInt("stock"));
         p.setImageUrl(rs.getString("image_url"));
         products.add(p);
     }
     return products;
 }
}
