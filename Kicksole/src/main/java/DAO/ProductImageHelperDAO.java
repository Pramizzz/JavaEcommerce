package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import database.DatabaseConnection;

public class ProductImageHelperDAO {

 List<String> getImagePathsByProductId(int productId, Connection conn) {
        List<String> imagePaths = new ArrayList<>();
        String sql = "SELECT image_path FROM product_images WHERE product_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    imagePaths.add(rs.getString("image_path"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return imagePaths;
    }
}
