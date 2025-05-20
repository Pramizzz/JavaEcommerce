package DAO;

import model.CartItem;
import java.sql.*;
import database.DatabaseConnection;

public class CartDAO {
    public static CartItem getCartItemByVariantId(int variantId) throws ClassNotFoundException {
        String query = "SELECT v.variant_id AS variantId, p.product_name AS productName, v.size, p.price, i.image_path " +
                       "FROM product_variant v " +
                       "JOIN product p ON p.product_id = v.product_id " +
                       "LEFT JOIN product_images i ON i.product_id = p.product_id " +
                       "WHERE v.variant_id = ? LIMIT 1";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, variantId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new CartItem(
                    rs.getInt("variantId"),
                    rs.getString("productName"),
                    rs.getString("image_path"),
                    rs.getDouble("price"),
                    1,
                    rs.getString("size")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}