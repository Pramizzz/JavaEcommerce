package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.AddCategory;



public class CategoryModelDAO {
	
	private Connection con;
	// constructor
	public CategoryModelDAO(Connection con) {
		this.con = con;
	}
	
	public boolean saveCategory (AddCategory category) {
		boolean success = false;
		try {
			String query = "INSERT INTO Category (category_name, category_description) VALUES (?, ?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, category.getCategoryName());
            pstmt.setString(2, category.getCategoryDescription());

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                success = true;
            }
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
		
	}
}
