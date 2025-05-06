package controller;

import DAO.UpdateProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            int brandId = Integer.parseInt(request.getParameter("brandId"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String size = request.getParameter("variantSize");
            String color = request.getParameter("variantColor");
            int stockQty = Integer.parseInt(request.getParameter("variantStock"));

            UpdateProductDAO dao = new UpdateProductDAO();

            boolean productUpdated = dao.updateProduct(productId, productName, brandId, categoryId);
            boolean variantUpdated = dao.updateVariant(productId, size, color, stockQty); 

            if (productUpdated && variantUpdated) {
                response.sendRedirect(request.getContextPath() + "/pages/admin/AddProducts.jsp?updated=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/admin/AddProducts.jsp?updated=0");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/admin/AddProducts.jsp?updated=0");
        }
    }
}
