package controller;

import DAO.CartDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ClearCartServlet")
public class ClearCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/customer/login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        try {
            CartDAO cartDAO = new CartDAO();
            cartDAO.clearCartByUserId(userId);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/pages/customer/cart.jsp");
    }
}
