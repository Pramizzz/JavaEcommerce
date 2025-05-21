package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDAO;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateCartServlet() {
        super();
    }

    // Handle POST requests (i.e., when user clicks "Update" on cart page)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId != null && quantity > 0) {
                CartDAO cartDAO = new CartDAO();
                cartDAO.updateCartItemQuantity(userId, variantId, quantity);
            }

            // Redirect back to cart page after update
            response.sendRedirect(request.getContextPath() + "/pages/customer/cart.jsp");

        } catch (NumberFormatException | SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/customer/cart.jsp?error=updateFailed");
        }
    }
}
