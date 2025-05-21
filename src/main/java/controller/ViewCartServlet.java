package controller;

import DAO.CartDAO;
import model.CartItem;
import model.Cartdisplay;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ViewCartServlet")
public class ViewCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CartDAO cartDAO = new CartDAO();
        try {
            List<CartItem> cart = cartDAO.getCartItemsByUserId(userId);
            request.setAttribute("cart", cart);

            double total = 0;
            for (CartItem item : cart) {
                total += item.getPrice() * item.getQuantity();
            }
            request.setAttribute("total", total);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/customer/cart.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error loading cart", e);
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
