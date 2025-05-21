package controller;

import DAO.FilterByBrandDAO;
import model.DisplayProductmodel;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/FilterByBrandServlet")
public class FilterByBrandServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String brandParam = request.getParameter("brand");
        List<DisplayProductmodel> products;

        if (brandParam != null && !brandParam.equals("all")) {
            try {
                int brandId = Integer.parseInt(brandParam);
                FilterByBrandDAO dao = new FilterByBrandDAO();
                products = dao.getProductsByBrand(brandId);
            } catch (NumberFormatException e) {
                products = null;
                e.printStackTrace();
            }
        } else {
            // fallback: load all products
            DAO.AddProductDAO dao = new DAO.AddProductDAO();
            products = dao.getAllProducts();
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("pages/customer/product.jsp").forward(request, response);
    }
}
