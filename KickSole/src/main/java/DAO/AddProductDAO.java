package DAO;
import java.util.*;
import model.ProductVariantModel;
import java.sql.*;
import database.DatabaseConnection;
import model.DisplayProductmodel;
public class AddProductDAO {

    public int insertProduct(String name, int brandId, int categoryId) throws Exception {
        String sql = "INSERT INTO product (product_name, brand_id, category_id) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, name);
            ps.setInt(2, brandId);
            ps.setInt(3, categoryId);
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
    // Get all products from the database
    public List<DisplayProductmodel> getAllProducts() {
        List<DisplayProductmodel> productList = new ArrayList<>();

        try {
            Connection connection = DatabaseConnection.getConnection();
            String sql = "SELECT * FROM product";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
            	DisplayProductmodel p = new DisplayProductmodel();
                p.setId(resultSet.getInt("product_id"));
                p.setName(resultSet.getString("product_name"));

                // Optional: check if 'price' exists
                try {
                    p.setPrice(resultSet.getDouble("price"));
                } catch (SQLException e) {
                    p.setPrice(0.0);
                }

                productList.add(p);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }
}
