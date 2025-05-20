package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AddProductDAO;
import DAO.SortByDAO;
import model.DisplayProductmodel;

/**
 * Servlet implementation class SortByServlet
 */
@WebServlet("/SortByServlet")
public class SortByServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortByServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		    // Get the sort parameter from the request
		    String sort = request.getParameter("sort");
		    if (sort == null) sort = "default"; // fallback to default

		    // Use the new SortByDAO instead of AddProductDAO
		    SortByDAO dao = new SortByDAO();

		    // Call the DAO method to get sorted product list
		    List<DisplayProductmodel> products = dao.getProductsSorted(sort);

		    // Set the product list and selected sort option as request attributes
		    request.setAttribute("products", products);
		    request.setAttribute("selectedSort", sort);

		    // Forward to JSP to display the products
		    RequestDispatcher rd = request.getRequestDispatcher("pages/customer/product.jsp");
		    rd.forward(request, response);
		}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Get the sort parameter from the request
	

}
}
