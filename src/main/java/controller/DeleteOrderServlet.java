package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DeleteOrderDAO;
import DAO.OrderSummaryDAO;

/**
 * Servlet implementation class DeleteOrderServlet
 */
@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String orderIdStr = request.getParameter("orderId");

	        if (orderIdStr == null || orderIdStr.isEmpty()) {
	            response.sendRedirect("order.jsp?error=Missing+orderId");
	            return;
	        }

	        try {
	            int orderId = Integer.parseInt(orderIdStr);
	            DeleteOrderDAO deleteOrderDAO = new DeleteOrderDAO();
	            OrderSummaryDAO orderSummaryDAO = new OrderSummaryDAO();

	            // 1. Delete order items
	            deleteOrderDAO.deleteOrderItemsByOrderId(orderId);

	            double newTotal = orderSummaryDAO.calculateTotalPrice(orderId);

	   
	            orderSummaryDAO.updateTotalPrice(orderId, newTotal);

	            // Redirect back to orders page with success message
	            response.sendRedirect("pages/admin/order.jsp");

	        } catch (NumberFormatException e) {
	            response.sendRedirect("order.jsp?error=Invalid+orderId");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("order.jsp?error=Failed+to+delete+order");
	        }
	    }

}