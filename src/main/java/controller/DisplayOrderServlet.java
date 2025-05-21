package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.OrderDAO;
import DAO.OrderSummaryDAO;
import model.CustomerOrderSummary;

/**
 * Servlet implementation class DisplayOrderServlet
 */
@WebServlet("/DisplayOrderServlet")
public class DisplayOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			 try {
		            OrderSummaryDAO summaryDAO = new OrderSummaryDAO();
		            List<CustomerOrderSummary> summaries = summaryDAO.getAllCustomerOrderSummaries();

		            request.setAttribute("orderSummaries", summaries);
		            request.getRequestDispatcher("admin/orders.jsp").forward(request, response);
		        } catch (Exception e) {
		            e.printStackTrace();
		            request.setAttribute("errorMessage", "Unable to load orders.");
		            request.getRequestDispatcher("admin/pages/order.jsp").forward(request, response);
		        }
		 }
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}