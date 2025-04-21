package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.LoginModelDAO;
import model.LoginModel;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();

		if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
			request.setAttribute("status", "emptyFields");
			RequestDispatcher dispatcher = request.getRequestDispatcher("register/login.jsp");
			dispatcher.forward(request, response);
			return;
		}

		String hashedPassword = hashPassword(password);
		LoginModel login = new LoginModel(username, hashedPassword);

		try {
			LoginModelDAO loginDAO = new LoginModelDAO();
			String role = loginDAO.checkLogin(login);

			if (role != null) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("role", role);

				Cookie sessionCookie = new Cookie("JSESSIONID", session.getId());
				sessionCookie.setHttpOnly(true);
				sessionCookie.setMaxAge(-1);
				response.addCookie(sessionCookie);

				if (role.equals("admin")) {
					response.sendRedirect("register/admin/adminDashboard.jsp");
				} else {
					response.sendRedirect("register/home.jsp");
				}
			} else {
				if (!loginDAO.doesUsernameExist(username)) {
					request.setAttribute("status", "wrongUsername");
				} else {
					request.setAttribute("status", "wrongPassword");
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher("register/login.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			out.println("<script>alert('Database error occurred!'); window.location='register/login.jsp';</script>");
		}
	}

	private String hashPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hashBytes = md.digest(password.getBytes());
			StringBuilder hexString = new StringBuilder();

			for (byte b : hashBytes) {
				hexString.append(String.format("%02x", b));
			}
			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
}
