package DAO;

import java.sql.*;
import java.util.*;
import database.DatabaseConnection;
import model.AddBrandModel;

public class AddBrandDAO {
    private Connection con;

    public AddBrandDAO() throws ClassNotFoundException, SQLException {
        this.con = DatabaseConnection.getConnection();
    }

    public boolean saveBrand(AddBrandModel brand) {
        String query = "INSERT INTO brand (brand_name) VALUES (?)";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, brand.getBrandName());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<AddBrandModel> getAllBrands() {
        List<AddBrandModel> brands = new ArrayList<>();
        String query = "SELECT * FROM brand";
        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                brands.add(new AddBrandModel(rs.getInt("brand_id"), rs.getString("brand_name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brands;
    }

    public boolean updateBrand(AddBrandModel brand) {
        String query = "UPDATE brand SET brand_name = ? WHERE brand_id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, brand.getBrandName());
            ps.setInt(2, brand.getBrandId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteBrand(int brandId) {
        String query = "DELETE FROM brand WHERE brand_id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, brandId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}