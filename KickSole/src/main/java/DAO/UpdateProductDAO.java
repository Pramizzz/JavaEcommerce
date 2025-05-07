package DAO;

import java.sql.*;
import database.DatabaseConnection;

public class UpdateProductDAO {

    public boolean updateProduct(int productId, String name, int brandId, int categoryId) throws Exception {
        String sql = "UPDATE product SET product_name = ?, brand_id = ?, category_id = ? WHERE product_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setInt(2, brandId);
            ps.setInt(3, categoryId);
            ps.setInt(4, productId);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateVariant(int variantId, String size, String color, int stockQuantity) throws Exception {
        String sql = "UPDATE product_variant SET size = ?, color = ?, stock_quantity = ? WHERE variant_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, size);
            ps.setString(2, color);
            ps.setInt(3, stockQuantity);
            ps.setInt(4, variantId);
            return ps.executeUpdate() > 0;
        }
    }
}
