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

            // Check if variantId is missing or invalid
            if (variantIdParam == null || variantIdParam.isEmpty()) {
                response.sendRedirect("pages/customer/product.jsp");
                return;
            }

            int variantId = Integer.parseInt(variantIdParam);

            AddProductDAO dao = new AddProductDAO();
            DisplayProductmodel product = dao.getProductByVariantId(variantId); // fetch product

            if (product != null) {
                // Debug logs - helpful for dev, remove in production
                System.out.println("Product Name: " + product.getProductName());
                System.out.println("Size: " + product.getVariantSize());
                System.out.println("Color: " + product.getVariantColor());
                System.out.println("Stock: " + product.getVariantStock());
                System.out.println("Price: " + product.getPrice());

                request.setAttribute("product", product);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/customer/ProductDescription.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("error", "Product not found.");
                request.getRequestDispatcher("/pages/customer/ProductDescription.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            // If variantId is not a valid integer
            e.printStackTrace();
            response.sendRedirect("pages/customer/product.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/customer/product.jsp");
        }
    }
}
