package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import database.DatabaseConnection;

public class PasswordDAO {

    public boolean updateUserPassword(int userId, String hashedPassword) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "UPDATE users SET password = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, hashedPassword);
            stmt.setInt(2, userId);

            int rowsAffected = stmt.executeUpdate();
            success = rowsAffected > 0;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }

        return success;
    }
}