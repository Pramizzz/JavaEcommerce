package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.UserModel;
import database.DatabaseConnection;

public class UserDAO {

    private static final String INSERT_USER_SQL = "INSERT INTO users (name, username, email, birthday, password, phone) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT id, name, username, email, birthday, password, phone FROM users WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String DELETE_USER_SQL = "DELETE FROM users WHERE id = ?";
    private static final String UPDATE_USER_SQL = "UPDATE users SET name = ?, username = ?, email = ?, birthday = ?, password = ?, phone = ? WHERE id = ?";

    private Connection conn;

    public UserDAO() {
        try {
			this.conn = DatabaseConnection.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  // Your centralized connection
    }

    public void insertUser(UserModel user) throws SQLException {
        try (PreparedStatement preparedStatement = conn.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getBirthday());
            preparedStatement.setString(6, user.getPhone());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public UserModel selectUser(int id) {
        UserModel user = null;
        try (PreparedStatement preparedStatement = conn.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String birthday = rs.getString("birthday");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                user = new UserModel(id, name, username, email, birthday,  phone);  // include id
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List<UserModel> selectAllUsers() {
        List<UserModel> users = new ArrayList<>();
        try (PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String birthday = rs.getString("birthday");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                users.add(new UserModel(id, name, username, email, birthday, phone));  // include id
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (PreparedStatement statement = conn.prepareStatement(DELETE_USER_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUser(UserModel user) throws SQLException {
        boolean rowUpdated;
        try (PreparedStatement statement = conn.prepareStatement(UPDATE_USER_SQL)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getBirthday());
            statement.setString(6, user.getPhone());
            statement.setInt(7, user.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    public void close() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
}
