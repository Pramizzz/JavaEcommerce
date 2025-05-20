package controller;

import DAO.AddProductDAO;
import model.DisplayProductmodel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewProductServlet")
public class ViewProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AddProductDAO dao = new AddProductDAO();
        List<DisplayProductmodel> productList = dao.getAllProducts();

        request.setAttribute("productList", productList);

        // Forward to existing addProduct.jsp
        request.getRequestDispatcher("/pages/admin/addProduct.jsp").forward(request, response);
    }
}
