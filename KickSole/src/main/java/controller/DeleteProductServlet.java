package controller;

import DAO.DeleteProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	System.out.println(request.getParameter("productId"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            DeleteProductDAO dao = new DeleteProductDAO();
            dao.deleteProduct(productId);
            response.sendRedirect(request.getContextPath()+"/pages/admin/AddProducts.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/pages/admin/AddProducts.jsp?error=deleteFailed");
        }
    }
}
