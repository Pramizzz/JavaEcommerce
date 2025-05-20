package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UsercDAO;
import model.Userc;
import database.DatabaseConnection;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Userc user = (Userc) session.getAttribute("user");

        if (user == null) {
            String username = (String) session.getAttribute("username");

            if (username != null) {
                Connection conn = null;
                try {
                    conn = DatabaseConnection.getConnection(); // ✅ Use your DatabaseConnection class
                    UsercDAO usercDAO = new UsercDAO();
                    user = usercDAO.getUserByUsername(username);

                    if (user != null) {
                        session.setAttribute("user", user);
                    } else {
                        response.sendRedirect("login.jsp");
                        return;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("login.jsp");
                    return;
                } finally {
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } else {
                response.sendRedirect("login.jsp");
                return;
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
