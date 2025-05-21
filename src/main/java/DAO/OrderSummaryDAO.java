package DAO;

import model.CustomerOrderSummary;
import model.ProductPriceInfo;
import database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderSummaryDAO {

    public List<CustomerOrderSummary> getAllCustomerOrderSummaries() throws SQLException, ClassNotFoundException {
        List<CustomerOrderSummary> summaries = new ArrayList<>();

        String sql = "SELECT u.id, u.name, u.phone, " +
                     "       SUM(o.total_amount) AS total_amount, " +
                     "       MAX(o.shipping_address) AS shipping_address, " +
                     "       MIN(o.order_date) AS createdDate, " +
                     "       MAX(o.last_updated_date) AS updatedDate " +
                     "FROM users u " +
                     "JOIN orders o ON u.id = o.user_id " +
                     "GROUP BY u.id, u.name, u.phone";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                CustomerOrderSummary summary = new CustomerOrderSummary();
                int userId = rs.getInt("id");
                summary.setUserId(userId);
                summary.setCustomerName(rs.getString("name"));
                summary.setCustomerPhone(rs.getString("phone"));
                summary.setTotalAmount(rs.getDouble("total_amount"));
                summary.setShipping_address(rs.getString("shipping_address"));
                summary.setCreatedDate(rs.getTimestamp("createdDate"));
                summary.setUpdatedDate(rs.getTimestamp("updatedDate"));

                List<ProductPriceInfo> productPrices = getProductPriceInfoByUserId(userId, conn);
                summary.setProductPrices(productPrices != null ? productPrices : new ArrayList<>());

                summaries.add(summary);
            }
        }

        return summaries;
    }

    private List<ProductPriceInfo> getProductPriceInfoByUserId(int userId, Connection conn) throws SQLException {
        List<ProductPriceInfo> productPrices = new ArrayList<>();

        String sql = "SELECT oi.order_id, oi.price, oi.quantity, p.product_name, o.status, o.payment_method " +
                     "FROM order_items oi " +
                     "JOIN orders o ON oi.order_id = o.order_id " +
                     "JOIN product_variant v ON oi.variant_id = v.variant_id " +
                     "JOIN product p ON v.product_id = p.product_id " +
                     "WHERE o.user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ProductPriceInfo info = new ProductPriceInfo();
                    info.setOrderId(rs.getInt("order_id"));
                    info.setPrice(rs.getDouble("price"));
                    info.setQuantity(rs.getInt("quantity"));
                    info.setProductName(rs.getString("product_name"));
                    info.setStatus(rs.getString("status"));
                    info.setPaymentMethod(rs.getString("payment_method")); // Added

                    productPrices.add(info);
                }
            }
        }

        return productPrices;
    }

    public void updateTotalPrice(int orderId, double newTotal) throws Exception {
        String sql = "UPDATE orders SET total_amount = ? WHERE order_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDouble(1, newTotal);
            stmt.setInt(2, orderId);
            stmt.executeUpdate();
        }
    }

    public double calculateTotalPrice(int orderId) throws Exception {
        String sql = "SELECT SUM(price * quantity) AS total FROM order_items WHERE order_id = ?";
        double total = 0.0;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    total = rs.getDouble("total");
                }
            }
        }
        return total;
    }

    public void updateOrderStatus(int orderId, String status) throws Exception {
        String sql = "UPDATE orders SET status = ?, last_updated_date = CURRENT_TIMESTAMP WHERE order_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, orderId);
            stmt.executeUpdate();
        }
    }
}