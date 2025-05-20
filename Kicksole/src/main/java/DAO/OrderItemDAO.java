package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.OrderItemModel;
import database.DatabaseConnection;

public class OrderItemDAO {

    public boolean insertOrderItem(OrderItemModel item) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO order_items (order_id, variant_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, item.getOrderId());        
            pstmt.setInt(2, item.getVariantId());
            pstmt.setInt(3, item.getQuantity());
            pstmt.setDouble(4, item.getPrice());

            int affectedRows = pstmt.executeUpdate();

            return affectedRows > 0;
        }
    }
}
