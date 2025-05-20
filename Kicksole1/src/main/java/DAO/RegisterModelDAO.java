package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DatabaseConnection;
import model.ListModel;
import model.RegisterModel;

public class RegisterModelDAO {
    private Connection con;

    public RegisterModelDAO() throws ClassNotFoundException, SQLException {
        this.con = DatabaseConnection.getConnection();
    }

    public boolean addRegisterModel(RegisterModel user) throws SQLException {
        if (con == null) {
            System.out.println("Database Not Connected...");
            return false;
        }

        boolean rowInserted = false;

        String query = "INSERT INTO users(name, username, email, birthday, password, phone, role) VALUES (?, ?, ?, ?, ?, ?, 'customer')";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, user.getName());
        ps.setString(2, user.getUsername());
        ps.setString(3, user.getEmail());
        ps.setString(4, user.getBirthday());
        ps.setString(5, user.getPassword()); 
        ps.setString(6, user.getPhone());

        int rows = ps.executeUpdate();
        if (rows > 0) {
            rowInserted = true;
        }

        return rowInserted;
    }

    public ArrayList<RegisterModel> getAllRegisterModels() throws SQLException {
        ArrayList<RegisterModel> registerList = new ArrayList<>();

        if (con == null) {
            System.out.println("Database Not Connected...");
            return null;
        }

        String query = "SELECT * FROM users";
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            RegisterModel user = new RegisterModel(
                rs.getString("name"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("birthday"),
                rs.getString("password"),
                rs.getString("phone")
            );
            registerList.add(user);
        }

        return registerList;
    }

    public List<ListModel> getAllUsers() throws SQLException, ClassNotFoundException {
        List<ListModel> userList = new ArrayList<>();

        Connection conn = DatabaseConnection.getConnection();
        String sql = "SELECT * FROM users"; 
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            ListModel user = new ListModel();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setBirthday(rs.getString("birthday"));
            user.setPassword(rs.getString("password"));
            user.setContact(rs.getString("phone"));
            user.setRole(rs.getString("role"));

            userList.add(user);
        }

        rs.close();
        ps.close();
        conn.close();

        return userList;
    
}
    public boolean deleteUserById(int id) throws SQLException {
        if (con == null || con.isClosed()) {
            throw new SQLException("Database connection is not available.");
        }

        String sql = "DELETE FROM users WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public boolean updateUserRole(int id, String newRole) throws SQLException {
        String sql = "UPDATE users SET role = ? WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, newRole);
        ps.setInt(2, id);
        int rows = ps.executeUpdate();
        return rows > 0;
    }

}