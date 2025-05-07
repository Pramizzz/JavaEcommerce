package controller;

import DAO.DeleteProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	 public DeleteProductServlet() {
	        super();
	    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));

        try {
            DeleteProductDAO dao = new DeleteProductDAO();
            dao.deleteProduct(productId);
            response.sendRedirect("pages/admin/products.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/admin/products.jsp?error=1");
        }
    }
}
