package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
    	
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("status", "emptyFields");
            RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/pages/customer/login.jsp");
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
                Cookie sessionCookie = new Cookie("JSESSIONID", session.getId());
                sessionCookie.setHttpOnly(true);
                sessionCookie.setMaxAge(-1); 
                response.addCookie(sessionCookie);

                if (role.equals("admin")) {
                    response.sendRedirect(request.getContextPath()+"/pages/admin/adminDashboard.jsp");
                } else {
                    response.sendRedirect(request.getContextPath()+"/pages/customer/home.jsp");
                }
            } else {
                if (!loginDAO.doesUsernameExist(username)) {
                    request.setAttribute("status", "wrongUsername");
                } else {
                    request.setAttribute("status", "wrongPassword");
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/pages/customer/login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('Database error occurred!'); window.location='/pages/customer/login.jsp';</script>");
        }
    }
}