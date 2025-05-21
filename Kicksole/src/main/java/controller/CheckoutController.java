package controller;

import DAO.OrderDAO;
import DAO.OrderItemDAO;
import DAO.ProductVariantDAO;
import model.OrderModel;
import model.OrderItemModel;
import model.ProductVariantModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

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
        String variantIdStr = request.getParameter("variantId");
        String quantityStr = request.getParameter("quantity");

        boolean hasError = false;

        // Refill values
        request.setAttribute("shippingAddress", address);
        request.setAttribute("paymentMethod", paymentMethod);
        request.setAttribute("quantity", quantityStr);
        request.setAttribute("variantId", variantIdStr);

        // Validate address
        if (address == null || address.trim().isEmpty() || !address.matches("^[a-zA-Z\\s,]+$")) {
            request.setAttribute("addressError", "Address must contain only letters, spaces, and commas.");
            hasError = true;
        }
        
        if (paymentMethod == null || paymentMethod.trim().isEmpty()) {
            request.setAttribute("paymentError", "Payment method is required.");
            hasError = true;
        }

        int quantity = 0;
        int variantId = 0;

        try {
            quantity = Integer.parseInt(quantityStr);
            variantId = Integer.parseInt(variantIdStr);
            if (quantity <= 0) {
                request.setAttribute("quantityError", "Quantity must be greater than 0.");
                hasError = true;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("quantityError", "Quantity must be a valid number.");
            hasError = true;
        }

        ProductVariantDAO variantDAO = new ProductVariantDAO();
        ProductVariantModel variant;
		try {
			variant = variantDAO.getVariantById(variantId);
		
        request.setAttribute("variant", variant); // so JSP can redisplay it

        if (variant == null) {
            request.setAttribute("stockError", "Product not found.");
            hasError = true;
        } else if (variant.getStockQuantity() < quantity) {
            request.setAttribute("stockError", "Insufficient stock available.");
            hasError = true;
        }

        if (hasError) {
            request.getRequestDispatcher("pages/customer/checkout.jsp").forward(request, response);
            return;
        }

        try {
            double price = variant.getPrice();
            double totalAmount = price * quantity;

            Timestamp orderDate = new Timestamp(System.currentTimeMillis());

            OrderModel order = new OrderModel();
            order.setUserId(customerId);
            order.setOrderDate(orderDate);
            order.setShippingAddress(address);
            order.setStatus("Pending");
            order.setPaymentMethod(paymentMethod);
            order.setTotalAmount(totalAmount);

            OrderDAO orderDAO = new OrderDAO();
            int orderId = orderDAO.insertOrder(order);

            if (orderId == 0) {
                request.setAttribute("stockError", "Failed to place order.");
                request.getRequestDispatcher("pages/customer/checkout.jsp").forward(request, response);
                return;
            }

            OrderItemModel item = new OrderItemModel();
            item.setOrderId(orderId);
            item.setVariantId(variantId);
            item.setQuantity(quantity);
            item.setPrice(price);

            OrderItemDAO itemDAO = new OrderItemDAO();
            boolean itemInserted = itemDAO.insertOrderItem(item);

            if (!itemInserted) {
                request.setAttribute("stockError", "Failed to add order items.");
                request.getRequestDispatcher("pages/customer/checkout.jsp").forward(request, response);
                return;
            }

            boolean stockUpdated = variantDAO.reduceStock(variantId, quantity);

            if (stockUpdated) {
            	 session.setAttribute("orderSuccessMessage", "Your order has been placed successfully!");
                response.sendRedirect("pages/customer/orderSucess.jsp");
            } else {
                request.setAttribute("stockError", "Failed to update stock.");
                request.getRequestDispatcher("pages/customer/checkout.jsp").forward(request, response);
            }
            System.out.println("Received variantId: " + variantId);
            System.out.println("Received quantity: " + quantityStr);
            System.out.println("Received shippingAddress: " + address);
            System.out.println("Received paymentMethod: " + paymentMethod);


        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("stockError", "Checkout failed: " + e.getMessage());
            request.getRequestDispatcher("pages/customer/checkout.jsp").forward(request, response);
        }
    }
		 catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    }
}