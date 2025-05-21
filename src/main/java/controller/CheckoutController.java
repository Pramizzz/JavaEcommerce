package controller;

import DAO.OrderDAO;
import DAO.OrderItemDAO;
import DAO.ProductVariantDAO;
import DAO.CartDAO;
import model.OrderModel;
import model.OrderItemModel;
import model.ProductVariantModel;
import model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CheckoutController")
public class CheckoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CheckoutController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerId") == null) {
            response.sendRedirect("pages/customer/login.jsp");
            return;
        }

        int customerId = (Integer) session.getAttribute("customerId");
        String address = request.getParameter("shippingAddress");
        String paymentMethod = request.getParameter("paymentMethod");

        boolean hasError = false;

        if (address == null || address.trim().isEmpty() || !address.matches("^[a-zA-Z0-9\\s,.-]+$")) {
            request.setAttribute("addressError", "Shipping address is required and must be valid.");
            hasError = true;
        }
        if (paymentMethod == null || paymentMethod.trim().isEmpty()) {
            request.setAttribute("paymentError", "Payment method is required.");
            hasError = true;
        }

        ProductVariantDAO variantDAO = new ProductVariantDAO();
        List<OrderItemModel> orderItems = new ArrayList<>();
        double totalAmount = 0;

        try {
            // Check if it's a single product order
            String[] variantIds = request.getParameterValues("variantId");
            String[] quantities = request.getParameterValues("quantity");

            if (variantIds != null && quantities != null && variantIds.length == quantities.length) {
                for (int i = 0; i < variantIds.length; i++) {
                    int variantId = Integer.parseInt(variantIds[i]);
                    int quantity = Integer.parseInt(quantities[i]);

                    ProductVariantModel variant = variantDAO.getVariantById(variantId);

                    if (variant == null || quantity <= 0 || quantity > variant.getStockQuantity()) {
                        request.setAttribute("stockError", "Invalid quantity or out of stock for variant ID: " + variantId);
                        hasError = true;
                        continue;
                    }

                    totalAmount += variant.getPrice() * quantity;

                    OrderItemModel item = new OrderItemModel();
                    item.setVariantId(variantId);
                    item.setQuantity(quantity);
                    item.setPrice(variant.getPrice());
                    orderItems.add(item);
                }
            }
            // Otherwise, assume it's a cart order
            else {
                CartDAO cartDAO = new CartDAO();
                List<CartItem> cartItems = cartDAO.getCartItemsByUserId(customerId);

                if (cartItems == null || cartItems.isEmpty()) {
                    request.setAttribute("stockError", "Your cart is empty.");
                    request.getRequestDispatcher("pages/customer/checkout.jsp").forward(request, response);
                    return;
                }

                for (CartItem item : cartItems) {
                    ProductVariantModel variant = variantDAO.getVariantById(item.getVariantId());

                    if (variant == null || item.getQuantity() <= 0 || item.getQuantity() > variant.getStockQuantity()) {
                        request.setAttribute("stockError", "Invalid or unavailable stock for: " + item.getProductName());
                        hasError = true;
                        continue;
                    }

                    totalAmount += item.getPrice() * item.getQuantity();

                    OrderItemModel orderItem = new OrderItemModel();
                    orderItem.setVariantId(item.getVariantId());
                    orderItem.setQuantity(item.getQuantity());
                    orderItem.setPrice(item.getPrice());
                    orderItems.add(orderItem);
                }
            }

            if (hasError) {
                request.getRequestDispatcher("pages/customer/checkout.jsp").forward(request, response);
                return;
            }

            // Create Order
            OrderModel order = new OrderModel();
            order.setUserId(customerId);
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));
            order.setShippingAddress(address);
            order.setStatus("Pending");
            order.setPaymentMethod(paymentMethod);
            order.setTotalAmount(totalAmount);

            OrderDAO orderDAO = new OrderDAO();
            int orderId = orderDAO.insertOrder(order);

            if (orderId <= 0) {
                request.setAttribute("stockError", "Failed to create order.");
                request.getRequestDispatcher("pages/customer/checkout.jsp").forward(request, response);
                return;
            }

            // Insert Order Items
            OrderItemDAO itemDAO = new OrderItemDAO();
            for (OrderItemModel item : orderItems) {
                item.setOrderId(orderId);
                itemDAO.insertOrderItem(item);
                variantDAO.reduceStock(item.getVariantId(), item.getQuantity());
            }

            // Clear cart if it was a cart-based checkout
            CartDAO cartDAO = new CartDAO();
            cartDAO.clearCartByUserId(customerId);

            session.setAttribute("orderSuccessMessage", "Your order has been placed successfully!");
            response.sendRedirect("pages/customer/orderSucess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("stockError", "Checkout failed: " + e.getMessage());
            request.getRequestDispatcher("pages/customer/checkout.jsp").forward(request, response);
        }
    }
}
