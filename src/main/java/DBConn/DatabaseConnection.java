package DBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private final static String databaseName = "kickssole";
	private final static String username = "root";
	private final static String password = "";
	private final static String jdbURL = "jdbc:mysql://localhost:3306/" + databaseName;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection con = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(jdbURL,username, password);
		if (con == null) {
			System.out.print("Database not connected");
		}
		else {
			System.out.print("Database Connected");
		}
		return con; 
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		getConnection();
	}
}
