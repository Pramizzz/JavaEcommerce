package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private final static String databaseName = "kicksole";
    private final static String username = "root";
    private final static String password = "";
    private final static String jdbcUrl = "jdbc:mysql://localhost:3306/" + databaseName + "?useSSL=false&serverTimezone=UTC";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver"); 

        Connection con = DriverManager.getConnection(jdbcUrl, username, password);
        if (con == null) {
            System.out.println("Failed to Connect to Database");
        } else {
            System.out.println(" Successfully Connected to Database");
        }
        return con;
    }

    public static void main(String[] args) {
        try {
            getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}