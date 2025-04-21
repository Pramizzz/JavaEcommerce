package DAO;

public class ProductDAO {
	private Connection conn;

	public ProductDAO(Connection conn) {
		this.conn = conn;
	}

	public List<Product> getAllProducts() {
		List<Product> list = new ArrayList<>();
		try {
			String sql = "SELECT p.*, c.name as category FROM products p JOIN categories c ON p.category_id = c.id";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescription(rs.getString("description"));
				p.setPrice(rs.getDouble("price"));
				p.setQuantity(rs.getInt("quantity"));
				p.setImagePath(rs.getString("image_path"));
				p.setCategory(rs.getString("category"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}