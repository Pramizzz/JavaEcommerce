package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.RegisterModelDAO;
import model.ListModel;

@WebServlet("/UserListServlet")
public class UserListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RegisterModelDAO dao = new RegisterModelDAO();
            List<ListModel> users = dao.getAllUsers();

            request.setAttribute("users", users);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/admin/user.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Log and show user-friendly message
        }
    }
}
