package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.LoginModelDAO;
import model.User;
import utils.PasswordUtil;

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

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("status", "emptyFields");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/customer/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        String hashedPassword = PasswordUtil.hashPassword(password);
        LoginModelDAO loginDAO = new LoginModelDAO();

        try {
            String role = loginDAO.checkLogin(username, hashedPassword);

            if (role != null) {
                // Get full user info for session
                User loggedInUser = loginDAO.getUserByUsername(username);

                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", loggedInUser);
                session.setAttribute("role", role);

                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect(request.getContextPath() + "/pages/admin/adminDashboard.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/pages/customer/home.jsp");
                }
            } else {
                if (!loginDAO.doesUsernameExist(username)) {
                    request.setAttribute("status", "wrongUsername");
                } else {
                    request.setAttribute("status", "wrongPassword");
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/customer/login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        }
    }
}
