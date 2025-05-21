package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.OrderSummaryDAO;

/**
 * Servlet implementation class UpdateOrderStatusServlet
 */
@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderStatusServlet() {
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
		// TODO Auto-generated method stub
		String orderIdStr = request.getParameter("orderId");
        String status = request.getParameter("status");

        if (orderIdStr == null || status == null || orderIdStr.isEmpty() || status.isEmpty()) {
            response.sendRedirect("pages/admin/order.jsp?error=Missing+parameters");
            return;
        }

        try {
            int orderId = Integer.parseInt(orderIdStr);

            OrderSummaryDAO dao = new OrderSummaryDAO();
            dao.updateOrderStatus(orderId, status);

            response.sendRedirect("pages/admin/order.jsp?message=Status+updated+successfully");

        } catch (NumberFormatException e) {
            response.sendRedirect("pages/admin/order.jsp?error=Invalid+orderId");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/admin/order.jsp?error=Failed+to+update+status");
        }
    }

}