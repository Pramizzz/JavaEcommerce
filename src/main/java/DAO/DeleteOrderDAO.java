package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import database.DatabaseConnection;

public class DeleteOrderDAO {
	 public void deleteOrderItemsByOrderId(int orderId) throws Exception {
	        String sql = "DELETE FROM order_items WHERE order_id = ?";
	        
	        try (Connection conn = DatabaseConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            
	            stmt.setInt(1, orderId);
	            stmt.executeUpdate();
	        }
	    }
}