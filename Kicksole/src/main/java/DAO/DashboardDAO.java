package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DatabaseConnection;

public class DashboardDAO {
	private Connection conn;

    public DashboardDAO() {
        try {
            this.conn = DatabaseConnection.getConnection(); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	    public int getTotalOrders() throws SQLException {
	        String sql = "SELECT COUNT(*) FROM orders";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getInt(1) : 0;
	        }
	    }

	    public int getPendingOrders() throws SQLException {
	        String sql = "SELECT COUNT(*) FROM orders WHERE status = 'Pending'";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getInt(1) : 0;
	        }
	    }

	    public int getShippedOrders() throws SQLException {
	        String sql = "SELECT COUNT(*) FROM orders WHERE status = 'Shipped'";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getInt(1) : 0;
	        }
	    }

	    public int getDeliveredOrders() throws SQLException {
	        String sql = "SELECT COUNT(*) FROM orders WHERE status = 'Delivered'";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getInt(1) : 0;
	        }
	    }

	    public int getCancelledOrders() throws SQLException {
	        String sql = "SELECT COUNT(*) FROM orders WHERE status = 'Cancelled'";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getInt(1) : 0;
	        }
	    }

	    public double getTotalSales() throws SQLException {
	        String sql = "SELECT SUM(total_amount) FROM orders";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getDouble(1) : 0.0;
	        }
	    }

	    public double getMonthlySales() throws SQLException {
	        String sql = "SELECT SUM(total_amount) FROM orders WHERE MONTH(order_date) = MONTH(CURRENT_DATE()) AND YEAR(order_date) = YEAR(CURRENT_DATE())";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getDouble(1) : 0.0;
	        }
	    }


	    public int getTotalUsers() throws SQLException {
	        String sql = "SELECT COUNT(DISTINCT id) FROM users";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getInt(1) : 0;
	        }
	    }

	    public String getMostBoughtProduct() throws SQLException {
	        String sql = "SELECT p.product_name " +
	                     "FROM order_items oi " +
	                     "JOIN product_variant pv ON oi.variant_id = pv.variant_id " +
	                     "JOIN product p ON pv.product_id = p.product_id " +
	                     "GROUP BY p.product_name " +
	                     "ORDER BY SUM(oi.quantity) DESC " +
	                     "LIMIT 1";

	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getString(1) : "N/A";
	        }
	    }

	    public int getTotalBrands() throws SQLException {
	        String sql = "SELECT COUNT(*) FROM brand";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getInt(1) : 0;
	        }
	    }

	    public int getTotalCategories() throws SQLException {
	        String sql = "SELECT COUNT(*) FROM category";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getInt(1) : 0;
	        }
	    }
	    public int getTotalProducts() throws SQLException {
	        String sql = "SELECT COUNT(*) FROM product";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getInt(1) : 0;
	        }
	    }
	    public String getTopSellingCategoryByQuantity() throws SQLException {
	        String sql = "SELECT c.category_name " +
	                     "FROM order_items oi " +
	                     "JOIN product_variant pv ON oi.variant_id = pv.variant_id " +
	                     "JOIN product p ON pv.product_id = p.product_id " +
	                     "JOIN category c ON p.category_id = c.category_id " +
	                     "GROUP BY c.category_name " +
	                     "ORDER BY SUM(oi.quantity) DESC " +
	                     "LIMIT 1";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getString(1) : "N/A";
	        }
	    }
	    
	    public String getTopSellingCategoryByRevenue() throws SQLException {
	        String sql = "SELECT c.category_name " +
	                     "FROM order_items oi " +
	                     "JOIN product_variant pv ON oi.variant_id = pv.variant_id " +
	                     "JOIN product p ON pv.product_id = p.product_id " +
	                     "JOIN category c ON p.category_id = c.category_id " +
	                     "GROUP BY c.category_name " +
	                     "ORDER BY SUM(oi.quantity * oi.price) DESC " +
	                     "LIMIT 1";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getString(1) : "N/A";
	        }
	    }

	    public String getTopSellingBrandByQuantity() throws SQLException {
	        String sql = "SELECT b.brand_name " +
	                     "FROM order_items oi " +
	                     "JOIN product_variant pv ON oi.variant_id = pv.variant_id " +
	                     "JOIN product p ON pv.product_id = p.product_id " +
	                     "JOIN brand b ON p.brand_id = b.brand_id " +
	                     "GROUP BY b.brand_name " +
	                     "ORDER BY SUM(oi.quantity) DESC " +
	                     "LIMIT 1";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getString(1) : "N/A";
	        }
	    }
	    public String getTopSellingBrandByRevenue() throws SQLException {
	        String sql = "SELECT b.brand_name " +
	                     "FROM order_items oi " +
	                     "JOIN product_variant pv ON oi.variant_id = pv.variant_id " +
	                     "JOIN product p ON pv.product_id = p.product_id " +
	                     "JOIN brand b ON p.brand_id = b.brand_id " +
	                     "GROUP BY b.brand_name " +
	                     "ORDER BY SUM(oi.quantity * oi.price) DESC " +
	                     "LIMIT 1";
	        try (PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	            return rs.next() ? rs.getString(1) : "N/A";
	        }
	    }

	    
	}