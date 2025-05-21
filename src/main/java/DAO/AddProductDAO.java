package DAO;

import java.util.*;
import model.ProductVariantModel;
import model.DisplayProductmodel;
import java.sql.*;
import database.DatabaseConnection;

public class AddProductDAO {

    public int insertProduct(String name, int brandId, int categoryId, double price) throws Exception {
        String sql = "INSERT INTO product (product_name, brand_id, category_id, price) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, name);
            ps.setInt(2, brandId);
            ps.setInt(3, categoryId);
            ps.setDouble(4, price);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);
        }
        return -1;
    }

    public void insertVariant(int productId, ProductVariantModel variant) throws Exception {
        String sql = "INSERT INTO product_variant (product_id, size, color, stock_quantity) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ps.setString(2, variant.getSize());
            ps.setString(3, variant.getColor());
            ps.setInt(4, variant.getStockQuantity());
            ps.executeUpdate();
        }
    }

    public void saveImage(int productId, String imagePath) throws Exception {
        String sql = "INSERT INTO product_images (product_id, image_path) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ps.setString(2, imagePath);
            ps.executeUpdate();
        }
    }

    public List<DisplayProductmodel> getAllProducts() {
        List<DisplayProductmodel> products = new ArrayList<>();

        String sql = "SELECT p.product_id, p.product_name, p.brand_id, p.category_id, p.price, " +
                     "v.variant_id, v.size, v.color, v.stock_quantity " +  // Added variant_id here
                     "FROM product p " +
                     "LEFT JOIN product_variant v ON p.product_id = v.product_id";

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
                product.setVariantId(rs.getInt("variant_id"));  // Set variant ID here
                product.setVariantSize(rs.getString("size"));
                product.setVariantColor(rs.getString("color"));
                product.setVariantStock(rs.getInt("stock_quantity"));

                product.setImagePaths(getImagePathsByProductId(productId, conn));

                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }


    private List<String> getImagePathsByProductId(int productId, Connection conn) {
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
    
    public List<DisplayProductmodel> getProductsByCategory(int categoryId) {
        List<DisplayProductmodel> products = new ArrayList<>();

        String sql = "SELECT p.product_id, p.product_name, p.brand_id, p.category_id, p.price, " +
                     "v.size, v.color, v.stock_quantity " +
                     "FROM product p " +
                     "LEFT JOIN product_variant v ON p.product_id = v.product_id " +
                     "WHERE p.category_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
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

                    product.setImagePaths(getImagePathsByProductId(productId, conn));

                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

  /*  public List<DisplayProductmodel> getProductsSorted(String sort) {
        String orderByClause = "";

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
                orderByClause = ""; 
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

                product.setImagePaths(getImagePathsByProductId(productId, conn));

                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }*/

    public DisplayProductmodel getProductByVariantId(int variantId) {
        DisplayProductmodel product = null;

        String query = "SELECT p.product_name, v.size, v.color, v.stock_quantity, p.price, i.image_path " +
                       "FROM product p " +
                       "JOIN product_variant v ON p.product_id = v.product_id " +
                       "LEFT JOIN product_images i ON p.product_id = i.product_id " +
                       "WHERE v.variant_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, variantId);
            ResultSet rs = stmt.executeQuery();

            List<String> imagePaths = new ArrayList<>();
            boolean firstRow = true;

            while (rs.next()) {
                if (firstRow) {
                    product = new DisplayProductmodel();
                    product.setProductName(rs.getString("product_name"));
                    product.setVariantSize(rs.getString("size"));
                    product.setVariantColor(rs.getString("color"));
                    product.setVariantStock(rs.getInt("stock_quantity"));
                    product.setPrice(rs.getDouble("price"));
                    firstRow = false;
                }

                String imagePath = rs.getString("image_path");
                if (imagePath != null && !imagePath.isEmpty()) {
                    imagePaths.add(imagePath);
                }
            }

            if (product != null) {
                product.setImagePaths(imagePaths);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
    
}
