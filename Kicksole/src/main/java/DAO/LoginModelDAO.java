package DAO;

import java.sql.*;
import model.User;
import database.DatabaseConnection;

public class LoginModelDAO {

    // No-arg constructor, connection is managed internally
    public LoginModelDAO() {
        // nothing to do here
    }

    // Method to check login credentials and return role or null if invalid
    public String checkLogin(String username, String hashedPassword) throws SQLException, ClassNotFoundException {
        String role = null;
        String sql = "SELECT role FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, hashedPassword);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                role = rs.getString("role");
            }
        }
        return role;
    }

    // Method to get User object by username
    public User getUserByUsername(String username) throws SQLException, ClassNotFoundException {
        User user = null;
        String sql = "SELECT * FROM users WHERE username = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setBirthday(rs.getString("birthday"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
            }
        }
        return user;
    }

    // Method to check if username exists (optional)
    public boolean doesUsernameExist(String username) throws SQLException, ClassNotFoundException {
        boolean exists = false;
        String sql = "SELECT 1 FROM users WHERE username = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            exists = rs.next();
        }
        return exists;
    }
}
