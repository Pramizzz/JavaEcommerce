package DAO;

import java.sql.*;
import database.DatabaseConnection;  // Assuming this is your centralized DB connection

public class DeleteProductDAO {

    public boolean deleteProduct(int productId) throws Exception {
        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false);

            try (
                PreparedStatement ps1 = conn.prepareStatement("DELETE FROM product_images WHERE product_id = ?");
                PreparedStatement ps2 = conn.prepareStatement("DELETE FROM product_variant WHERE product_id = ?");
                PreparedStatement ps3 = conn.prepareStatement("DELETE FROM product WHERE product_id = ?");
            ) {
                ps1.setInt(1, productId);
                ps1.executeUpdate();

                ps2.setInt(1, productId);
                ps2.executeUpdate();

                ps3.setInt(1, productId);
                boolean result = ps3.executeUpdate() > 0;

                conn.commit();
                return result;
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }
        }
    }
}