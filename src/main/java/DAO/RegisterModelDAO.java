package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DatabaseConnection;
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
			RegisterModel user = new RegisterModel(rs.getString("name"), rs.getString("username"),
					rs.getString("email"), rs.getString("birthday"), rs.getString("password"), rs.getString("phone"));
			registerList.add(user);
		}

		return registerList;
	}
}
