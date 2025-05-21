package controller;

import database.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("customerId"); // same as in LoginServlet

        System.out.println("[AddToCartServlet] UserID from session: " + userId);

        // If not logged in, save original URL and redirect to login
        if (userId == null) {
            String variantIdStr = request.getParameter("variantId");
            String quantityStr = request.getParameter("quantity");
            String originalURL = "AddToCartServlet?variantId=" + variantIdStr + "&quantity=" + quantityStr;
            session.setAttribute("redirectAfterLogin", originalURL);

            System.out.println("[AddToCartServlet] User not logged in, redirecting to login page.");
            response.sendRedirect(request.getContextPath() + "/pages/customer/login.jsp");
            return;
        }

        // User is logged in, get parameters from request
        String variantIdStr = request.getParameter("variantId");
        String quantityStr = request.getParameter("quantity");

        System.out.println("[AddToCartServlet] Received parameters - variantId: " + variantIdStr + ", quantity: " + quantityStr);

        if (variantIdStr == null || quantityStr == null) {
            System.out.println("[AddToCartServlet] Missing variantId or quantity, redirecting to cart page.");
            response.sendRedirect(request.getContextPath() + "/pages/customer/cart.jsp");
            return;
        }

        int variantId;
        int quantity;

        try {
            variantId = Integer.parseInt(variantIdStr);
            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            System.out.println("[AddToCartServlet] Invalid number format for variantId or quantity.");
            response.sendRedirect(request.getContextPath() + "/pages/customer/cart.jsp");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            int cartId = -1;

            // 1. Check if the cart already exists
            String checkCartSQL = "SELECT cart_id FROM cart WHERE user_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(checkCartSQL)) {
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    cartId = rs.getInt("cart_id");
                    System.out.println("[AddToCartServlet] Existing cart found with cart_id: " + cartId);
                }
            }

            // 2. Create cart if not exists
            if (cartId == -1) {
                String createCartSQL = "INSERT INTO cart (user_id) VALUES (?)";
                try (PreparedStatement ps = conn.prepareStatement(createCartSQL, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setInt(1, userId);
                    int rows = ps.executeUpdate();
                    if (rows > 0) {
                        ResultSet rs = ps.getGeneratedKeys();
                        if (rs.next()) {
                            cartId = rs.getInt(1);
                            System.out.println("[AddToCartServlet] New cart created with cart_id: " + cartId);
                        }
                    }
                }
            }

            // 3. Check if item exists in cart
            boolean itemExists = false;
            int existingQty = 0;

            String checkItemSQL = "SELECT quantity FROM cart_items WHERE cart_id = ? AND variant_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(checkItemSQL)) {
                ps.setInt(1, cartId);
                ps.setInt(2, variantId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    itemExists = true;
                    existingQty = rs.getInt("quantity");
                    System.out.println("[AddToCartServlet] Item already exists in cart with quantity: " + existingQty);
                }
            }

            // 4. Insert or update item quantity
            if (itemExists) {
                String updateItemSQL = "UPDATE cart_items SET quantity = ? WHERE cart_id = ? AND variant_id = ?";
                try (PreparedStatement ps = conn.prepareStatement(updateItemSQL)) {
                    ps.setInt(1, existingQty + quantity);
                    ps.setInt(2, cartId);
                    ps.setInt(3, variantId);
                    int updatedRows = ps.executeUpdate();
                    System.out.println("[AddToCartServlet] Updated item quantity, rows affected: " + updatedRows);
                }
            } else {
                String insertItemSQL = "INSERT INTO cart_items (cart_id, variant_id, quantity) VALUES (?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(insertItemSQL)) {
                    ps.setInt(1, cartId);
                    ps.setInt(2, variantId);
                    ps.setInt(3, quantity);
                    int insertedRows = ps.executeUpdate();
                    System.out.println("[AddToCartServlet] Inserted new item, rows affected: " + insertedRows);
                }
            }

            // Redirect to cart page after successful add
            response.sendRedirect(request.getContextPath() + "/pages/customer/cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/customer/cart.jsp");
        }
    }

    // Forward GET to POST for redirect after login flow
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
