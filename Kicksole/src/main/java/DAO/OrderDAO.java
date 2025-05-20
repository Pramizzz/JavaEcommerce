package DAO;

import java.sql.*;
import model.OrderModel;
import database.DatabaseConnection;

public class OrderDAO {

    public int insertOrder(OrderModel order) throws SQLException, ClassNotFoundException {
        int generatedOrderId = 0;
        String sql = "INSERT INTO orders (user_id, order_date, shipping_address, status, payment_method, total_amount) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, order.getUserId());

            if (order.getOrderDate() != null) {
                pstmt.setTimestamp(2, order.getOrderDate());   // use setTimestamp for Timestamp
            } else {
                pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));  // current timestamp
            }

            pstmt.setString(3, order.getShippingAddress());

            if (order.getStatus() != null) {
                pstmt.setString(4, order.getStatus());
            } else {
                pstmt.setString(4, "Pending");
            }

            pstmt.setString(5, order.getPaymentMethod());
            pstmt.setDouble(6, order.getTotalAmount());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting order failed, no rows affected.");
            }

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generatedOrderId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Inserting order failed, no ID obtained.");
                }
            }
        }
        return generatedOrderId;
    }
}
