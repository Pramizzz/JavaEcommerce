package DAO;

import java.sql.*;
import model.User;

public class UserDAO {

    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    public User getUserByUsername(String username) throws SQLException {
        String sql = "SELECT * FROM users WHERE username = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setBirthday(rs.getString("birthday"));
            user.setPhone(rs.getString("phone"));
            user.setRole(rs.getString("role"));
            user.setPassword(rs.getString("password"));
            return user;
        }

        return null;
    }

	public User getAdmin() {
		// TODO Auto-generated method stub
		return null;
	}
}
