package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Userc;
import database.DatabaseConnection;

public class UsercDAO {

    private Connection conn;

    // SQL queries
    private static final String SELECT_USER_BY_ID = "SELECT * FROM users WHERE id = ?";
    private static final String SELECT_USER_BY_USERNAME = "SELECT * FROM users WHERE username = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String UPDATE_USER = "UPDATE users SET name = ?, username = ?, email = ?, birthday = ?, phone = ? WHERE id = ?";
    private static final String UPDATE_PASSWORD = "UPDATE users SET password = ? WHERE id = ?";

    // Constructor: initializes DB connection using your utility class
    public UsercDAO() throws ClassNotFoundException, SQLException {
        this.conn = DatabaseConnection.getConnection();
        if (this.conn == null) {
            throw new RuntimeException("Database connection failed.");
        }
    }

    // Fetch user by ID
    public Userc getUserById(int id) {
        try (PreparedStatement ps = conn.prepareStatement(SELECT_USER_BY_ID)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Fetch user by username
    public Userc getUserByUsername(String username) {
        try (PreparedStatement ps = conn.prepareStatement(SELECT_USER_BY_USERNAME)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Fetch all users
    public List<Userc> getAllUsers() {
        List<Userc> users = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(SELECT_ALL_USERS);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                users.add(extractUserFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    // Update user information (excluding password)
    public boolean updateUser(Userc user) {
        try (PreparedStatement ps = conn.prepareStatement(UPDATE_USER)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getBirthday());
            ps.setString(5, user.getPhone());
            ps.setInt(6, user.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Update password
    public boolean updatePassword(int userId, String newPassword) {
        try (PreparedStatement ps = conn.prepareStatement(UPDATE_PASSWORD)) {
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Extract a user from a result set
    private Userc extractUserFromResultSet(ResultSet rs) throws SQLException {
        return new Userc(
            rs.getInt("id"),
            rs.getString("name"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password"),
            rs.getString("birthday"),
            rs.getString("phone"),
            rs.getString("role")
        );
    }
}