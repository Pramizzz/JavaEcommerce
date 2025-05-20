package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DatabaseConnection;
import model.AddCategory;

public class CategoryModelDAO {

    private Connection con;  
    public CategoryModelDAO() throws ClassNotFoundException, SQLException {
        this.con = DatabaseConnection.getConnection();
    }

    public boolean saveCategory(AddCategory category) {
        boolean success = false;
        String query = "INSERT INTO Category (category_name) VALUES (?)";
        try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
            pstmt.setString(1, category.getCategoryName());
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public List<AddCategory> getAllCategories() {
        List<AddCategory> categories = new ArrayList<>();
        String query = "SELECT category_id, category_name FROM category";  

        try (PreparedStatement stmt = con.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {   

            while (rs.next()) {
                AddCategory category = new AddCategory();
                category.setCategoryId(rs.getInt("category_id"));  
                category.setCategoryName(rs.getString("category_name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Database error occurred..");
            e.printStackTrace();
        }

        return categories;
    }
    public boolean updateCategory(AddCategory category) {
        boolean success = false;
        String query = "UPDATE category SET category_name = ? WHERE category_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, category.getCategoryName());
            pstmt.setInt(2, category.getCategoryId());
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("Error while updating category.");
            e.printStackTrace();
        }
        return success;
    }

    public boolean deleteCategory(int categoryId) {
        boolean success = false;
        String query = "DELETE FROM category WHERE category_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, categoryId);
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("Error while deleting category.");
            e.printStackTrace();
        }
        return success;
    }
} 
   

