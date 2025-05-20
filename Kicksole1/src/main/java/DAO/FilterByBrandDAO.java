package DAO;

	import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;
	import model.DisplayProductmodel;
	import database.DatabaseConnection;

	public class FilterByBrandDAO {

		public List<DisplayProductmodel> getProductsByBrand(int brandId) {
		    List<DisplayProductmodel> products = new ArrayList<>();

		    String sql = "SELECT p.product_id, p.product_name, p.brand_id, p.category_id, p.price, " +
		                 "v.size, v.color, v.stock_quantity " +
		                 "FROM product p " +
		                 "LEFT JOIN product_variant v ON p.product_id = v.product_id " +
		                 "WHERE p.brand_id = ?";

		    try (Connection conn = database.DatabaseConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {

		        ps.setInt(1, brandId);
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

		                ProductImageHelperDAO imageHelperDAO = new ProductImageHelperDAO();
		                List<String> imagePaths = imageHelperDAO.getImagePathsByProductId(productId, conn);

		                product.setImagePaths(imagePaths);
		                products.add(product);
		            }
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		        e.printStackTrace();
		    }

		    return products;
		}
}

