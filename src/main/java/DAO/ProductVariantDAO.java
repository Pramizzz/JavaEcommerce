package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DatabaseConnection;
import model.ProductVariantModel;

public class ProductVariantDAO {

	public ProductVariantModel getVariantById(int variantId) throws ClassNotFoundException, SQLException {
	    String sql = "SELECT pv.*, p.product_name, p.price FROM product_variant pv " +
	                 "JOIN product p ON pv.product_id = p.product_id WHERE pv.variant_id = ?";

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, variantId);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            ProductVariantModel variant = new ProductVariantModel();
	            variant.setVariantId(rs.getInt("variant_id"));
	            variant.setProductId(rs.getInt("product_id"));
	            variant.setSize(rs.getString("size"));
	            variant.setColor(rs.getString("color"));
	            variant.setStockQuantity(rs.getInt("stock_quantity"));
	            variant.setProductName(rs.getString("product_name"));
	            variant.setPrice(rs.getDouble("price"));
	            return variant;
	        }
	    }
	    return null;
	}
	
	public boolean reduceStock(int variantId, int quantity) throws ClassNotFoundException, SQLException {
	    String sql = "UPDATE product_variant SET stock_quantity = stock_quantity - ? WHERE variant_id = ?";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        System.out.println("Reducing stock for variant_id: " + variantId + " by quantity: " + quantity);

	        ps.setInt(1, quantity);
	        ps.setInt(2, variantId);

	        int rowsAffected = ps.executeUpdate();
	        System.out.println("Rows affected: " + rowsAffected);

	        return rowsAffected > 0;
	    }
	}



}
