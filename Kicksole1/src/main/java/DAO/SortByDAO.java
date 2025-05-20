package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import database.DatabaseConnection;
import model.DisplayProductmodel;

public class SortByDAO {

    public List<DisplayProductmodel> getProductsSorted(String sort) {
        String orderByClause;

        switch (sort) {
            case "low-high":
                orderByClause = "ORDER BY p.price ASC";
                break;
            case "high-low":
                orderByClause = "ORDER BY p.price DESC";
                break;
            case "newest":
                orderByClause = "ORDER BY p.product_id DESC";
                break;
            default:
                orderByClause = "";  // no sorting
        }

        String sql = "SELECT p.product_id, p.product_name, p.brand_id, p.category_id, p.price, " +
                     "v.size, v.color, v.stock_quantity " +
                     "FROM product p " +
                     "LEFT JOIN product_variant v ON p.product_id = v.product_id " +
                     orderByClause;

        List<DisplayProductmodel> products = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                DisplayProductmodel product = new DisplayProductmodel();
                int productId = rs.getInt("product_id");

                product.setProductId(productId);
                product.setProductName(rs.getString("product_name"));
                product.setBrandId(rs.getInt("brand_id"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setPrice(rs.getDouble("price"));
                product.setVariantSize(rs.getString("size"));
                product.setVariantColor(rs.getString("color"));
                product.setVariantStock(rs.getInt("stock_quantity"));

                // Use ProductImageHelperDAO to get image paths
                ProductImageHelperDAO imageDAO = new ProductImageHelperDAO();
                product.setImagePaths(imageDAO.getImagePathsByProductId(productId, conn));

                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
}
