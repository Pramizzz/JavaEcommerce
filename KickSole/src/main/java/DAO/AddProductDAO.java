package DAO;
import java.util.*;
import model.ProductVariantModel;
import java.sql.*;
import database.DatabaseConnection;
import model.DisplayProductmodel;
public class AddProductDAO {

    public int insertProduct(String name, int brandId, int categoryId, double price) throws Exception {
        String sql = "INSERT INTO product (product_name, brand_id, category_id, price) VALUES (?, ?, ?,?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, name);
            ps.setInt(2, brandId);
            ps.setInt(3, categoryId);
            ps.setDouble(4, price);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);
        }
        return -1;
    }

    public void insertVariant(int productId, ProductVariantModel variant) throws Exception {
        String sql = "INSERT INTO product_variant (product_id, size, color, stock_quantity) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ps.setString(2, variant.getSize());
            ps.setString(3, variant.getColor());
            ps.setInt(4, variant.getStockQuantity());
            ps.executeUpdate();
        }
    }

    public void saveImage(int productId, String imagePath) throws Exception {
        String sql = "INSERT INTO product_images (product_id, image_path) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ps.setString(2, imagePath);
            ps.executeUpdate();
        }
       //get product
        
    }
    public List<DisplayProductmodel> getAllProducts() {
        List<DisplayProductmodel> productList = new ArrayList<>();

        String sql = "SELECT p.product_id, p.product_name, p.price, p.brand_id, p.category_id, " +
                     "b.brand_name, c.category_name, " +
                     "(SELECT image_path FROM product_images WHERE product_id = p.product_id LIMIT 1) AS image_path " +
                     "FROM product p " +
                     "LEFT JOIN brand b ON p.brand_id = b.brand_id " +
                     "LEFT JOIN category c ON p.category_id = c.category_id";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet resultSet = ps.executeQuery()) {

            while (resultSet.next()) {
                DisplayProductmodel product = new DisplayProductmodel();

                product.setId(resultSet.getInt("product_id"));
                product.setName(resultSet.getString("product_name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setBrand(resultSet.getString("brand_name"));       // Requires setter
                product.setCategory(resultSet.getString("category_name")); // Requires setter
                product.setImage(resultSet.getString("image_path"));       // Requires setter

                productList.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }

}
