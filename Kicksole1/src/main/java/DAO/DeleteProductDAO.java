package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import database.DatabaseConnection;

public class DeleteProductDAO {

    public void deleteProduct(int productId) throws Exception {
        try (Connection conn = DatabaseConnection.getConnection()) {
            // Delete product images
            try (PreparedStatement ps = conn.prepareStatement("DELETE FROM product_images WHERE product_id = ?")) {
                ps.setInt(1, productId);
                ps.executeUpdate();
            }

            // Delete product variant
            try (PreparedStatement ps = conn.prepareStatement("DELETE FROM product_variant WHERE product_id = ?")) {
                ps.setInt(1, productId);
                ps.executeUpdate();
            }

            // Delete product
            try (PreparedStatement ps = conn.prepareStatement("DELETE FROM product WHERE product_id = ?")) {
                ps.setInt(1, productId);
                ps.executeUpdate();
            }
        }
    }
}
