package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.AddProductDAO;
import model.DisplayProductmodel;

@WebServlet("/ShowProductDetailsServlet")
public class ShowProductDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ShowProductDetailsServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String variantIdParam = request.getParameter("variantId");
            if (variantIdParam == null || variantIdParam.isEmpty()) {
                response.sendRedirect("pages/customer/product.jsp");
                return;
            }

            int variantId = Integer.parseInt(variantIdParam);

            AddProductDAO dao = new AddProductDAO();
            DisplayProductmodel product = dao.getProductByVariantId(variantId); // Ensure this method exists

            if (product != null) {
            	DisplayProductmodel model = new DisplayProductmodel();
            	model = dao.getProductByVariantId(52);
            	System.out.println(model.getProductName());
            	System.out.println(model.getVariantSize());
            	System.out.println(model.getVariantColor());
            	System.out.println(model.getVariantStock());
            	System.out.println(model.getPrice());
                request.setAttribute("product", product);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/customer/ProductDescription.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("error", "Product not found.");
                request.getRequestDispatcher("/pages/customer/ProductDescription.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/customer/product.jsp");
        }
    }
}