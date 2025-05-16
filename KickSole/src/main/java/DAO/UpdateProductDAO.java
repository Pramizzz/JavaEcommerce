package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import database.DatabaseConnection;
import model.ProductVariantModel;

public class UpdateProductDAO {

    public void updateProduct(int productId, String name, int brandId, int categoryId, double price) throws Exception {
        String sql = "UPDATE product SET product_name=?, brand_id=?, category_id=?, price=? WHERE product_id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setInt(2, brandId);
            ps.setInt(3, categoryId);
            ps.setDouble(4, price);
            ps.setInt(5, productId);
            ps.executeUpdate();
        }
    }

    public void updateVariant(int productId, ProductVariantModel variant) throws Exception {
        String sql = "UPDATE product_variant SET size=?, color=?, stock_quantity=? WHERE product_id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, variant.getSize());
            ps.setString(2, variant.getColor());
            ps.setInt(3, variant.getStockQuantity());
            ps.setInt(4, productId);
            ps.executeUpdate();
        }
    }

    public void saveImage(int productId, String imagePath) throws Exception {
        // Check if image already exists
        String checkSql = "SELECT image_path FROM product_images WHERE product_id=?";
        String updateSql = "UPDATE product_images SET image_path=? WHERE product_id=?";
        String insertSql = "INSERT INTO product_images (product_id, image_path) VALUES (?, ?)";

        try (Connection conn = DatabaseConnection.getConnection()) {
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setInt(1, productId);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    // Image exists, update
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                        updateStmt.setString(1, imagePath);
                        updateStmt.setInt(2, productId);
                        updateStmt.executeUpdate();
                    }
                } else {
                    // Insert new image
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                        insertStmt.setInt(1, productId);
                        insertStmt.setString(2, imagePath);
                        insertStmt.executeUpdate();
                    }
                }
            }
        }
    }

    public String getImagePath(int productId) throws Exception {
        String sql = "SELECT image_path FROM product_images WHERE product_id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("image_path");
            }
        }
        return null;
    }
}