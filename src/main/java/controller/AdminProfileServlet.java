package controller;

import DAO.UserDAO;
import model.User;
import database.DatabaseConnection; // Add this if you have DB helper class

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/AdminProfileServlet")
public class AdminProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                UserDAO userDAO = new UserDAO(conn);
                User admin = userDAO.getAdmin();

                if (admin != null) {
                    request.setAttribute("admin", admin);
                } else {
                    System.out.println("DEBUG: Admin not found in DB.");
                }
            } else {
                System.out.println("ERROR: Failed to get DB connection.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/admin/setting.jsp");
        dispatcher.forward(request, response);
    }
}
