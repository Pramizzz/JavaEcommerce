package DAO;

import model.DisplayProductmodel;
import database.DatabaseConnection;

import java.sql.*;
import java.util.*;

public class ViewProductsDAO {
    public List<DisplayProductmodel> getAllProducts() {
        List<DisplayProductmodel> products = new ArrayList<>();
        String sql = "SELECT p.product_id, p.product_name, p.price, " +
                     "(SELECT stock_quantity FROM product_variant WHERE product_id = p.product_id LIMIT 1) as quantity, " +
                     "(SELECT image_path FROM product_images WHERE product_id = p.product_id LIMIT 1) AS image_path, " +
                     "b.brand_name, c.category_name " +
                     "FROM product p " +
                     "LEFT JOIN brand b ON p.brand_id = b.brand_id " +
                     "LEFT JOIN category c ON p.category_id = c.category_id";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                DisplayProductmodel p = new DisplayProductmodel();
               p.setBrandId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));        
                p.setVariantStock(rs.getInt("quantity"));
                p.setVariantSize(rs.getString("price"));   
                List<String> images = new ArrayList<>();
                images.add(rs.getString("image_path"));
                p.setImagePaths(images);
                products.add(p);
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
}

