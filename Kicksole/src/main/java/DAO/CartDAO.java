package DAO;

import model.CartItem;
import database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

	public List<CartItem> getCartItemsByUserId(int userId) throws SQLException, ClassNotFoundException {
	    List<CartItem> cartItems = new ArrayList<>();
	    System.out.println("Fetching cart items for user ID: " + userId);
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
	            // No image to set here
	            cartItems.add(item);
	        }
	    }
	    return cartItems;
	}

}
