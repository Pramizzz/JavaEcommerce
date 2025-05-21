package controller;

import java.io.IOException;
import model.User;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.LoginModelDAO;
import model.LoginModel;
import utils.PasswordUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("username") != null) {
            String role = (String) session.getAttribute("role");

            if ("admin".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/pages/admin/adminDashboard.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/customer/home.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/pages/customer/login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember-me");

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("status", "emptyFields");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/customer/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        String hashedPassword = PasswordUtil.hashPassword(password);
        LoginModel login = new LoginModel(username, hashedPassword);

        try {
            LoginModelDAO loginDAO = new LoginModelDAO();
            String role = loginDAO.checkLogin(login);

            if (role != null) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                int userId = loginDAO.getUserIdByUsername(username);
                session.setAttribute("customerId", userId);
                session.setAttribute("userId", userId);   

                if ("admin".equalsIgnoreCase(role)) {
                    session.setMaxInactiveInterval(15 * 60); 
                    User admin = loginDAO.getUserByUsername(username);
                    session.setAttribute("admin", admin);
                } else {
                    session.setMaxInactiveInterval(60 * 60); 
                }

                Cookie sessionCookie = new Cookie("JSESSIONID", session.getId());
                sessionCookie.setHttpOnly(true);
                sessionCookie.setMaxAge(-1);
                sessionCookie.setPath(request.getContextPath());
                response.addCookie(sessionCookie);

                if ("on".equals(remember)) {
                    Cookie userCookie = new Cookie("rememberUser", username);
                    userCookie.setMaxAge(7 * 24 * 60 * 60);
                    userCookie.setPath(request.getContextPath());
                    response.addCookie(userCookie);
                }

                // ==== This is the added/fixed redirect after login logic ====
                String redirectURL = (String) session.getAttribute("redirectAfterLogin");
                if (redirectURL != null) {
                    session.removeAttribute("redirectAfterLogin");
                    response.sendRedirect(redirectURL);
                    return;
                }
               
                if ("admin".equals(role)) {
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

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("status", "dbError");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/customer/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
