package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DatabaseConnection;
import model.LoginModel;

public class LoginModelDAO {
    private Connection con;

    public LoginModelDAO() throws ClassNotFoundException, SQLException {
        this.con = DatabaseConnection.getConnection();
    }

    public String checkLogin(LoginModel login) throws SQLException {
        String role = null;
        String sql = "SELECT role FROM users WHERE username = ? AND password = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, login.getUsername());
        ps.setString(2, login.getPassword()); 
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            role = rs.getString("role"); 
        }

        return role; 
    }

    public boolean doesUsernameExist(String username) throws SQLException {
        String sql = "SELECT 1 FROM users WHERE username = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        return rs.next(); 
    }
    
    public int getUserIdByUsername(String username) throws SQLException, ClassNotFoundException {
        int userId = 0;
        String sql = "SELECT id FROM users WHERE username = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                userId = rs.getInt("id");
            }
        }

        return userId;
    }
  

}
