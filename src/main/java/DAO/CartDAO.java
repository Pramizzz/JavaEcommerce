package DAO;

import model.CartItem;
import database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public List<CartItem> getCartItemsByUserId(int userId) throws SQLException, ClassNotFoundException {
        List<CartItem> cartItems = new ArrayList<>();
        String sql = "SELECT ci.variant_id, p.product_name, v.size, p.price, ci.quantity " +
                     "FROM cart_items ci " +
                     "JOIN cart c ON ci.cart_id = c.cart_id " +
                     "JOIN product_variant v ON ci.variant_id = v.variant_id " +
                     "JOIN product p ON v.product_id = p.product_id " +
                     "WHERE c.user_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem();
                item.setVariantId(rs.getInt("variant_id"));
                item.setProductName(rs.getString("product_name"));
                item.setVariantSize(rs.getString("size"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));
                cartItems.add(item);
            }
        }
        return cartItems;
    }

    public void updateCartItemQuantity(int userId, int variantId, int quantity) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE cart_items SET quantity = ? " +
                     "WHERE variant_id = ? AND cart_id = (SELECT cart_id FROM cart WHERE user_id = ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, quantity);
            stmt.setInt(2, variantId);
            stmt.setInt(3, userId);
            stmt.executeUpdate();
        }
    }

    public void removeItemFromCart(int userId, int variantId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM cart_items WHERE variant_id = ? AND cart_id = (SELECT cart_id FROM cart WHERE user_id = ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, variantId);
            stmt.setInt(2, userId);
            stmt.executeUpdate();
        }
    }

    // ✅ Renamed for clarity and fixed error handling
    public void clearCartByUserId(int userId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM cart_items WHERE cart_id = (SELECT cart_id FROM cart WHERE user_id = ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.executeUpdate();
        }
    }

    // ✅ Optional: For testing or seeding data
    public void insertCartItem(int userId, int variantId, int quantity) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO cart_items (cart_id, variant_id, quantity) " +
                     "VALUES ((SELECT cart_id FROM cart WHERE user_id = ?), ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, variantId);
            stmt.setInt(3, quantity);
            stmt.executeUpdate();
        }
    }
}
