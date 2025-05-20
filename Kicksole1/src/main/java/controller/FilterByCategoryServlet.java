package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AddProductDAO;
import DAO.CategoryModelDAO;
import DAO.FilterByCategoryDAO;
import model.AddCategory;
import model.DisplayProductmodel;

@WebServlet("/FilterByCategoryServlet")
public class FilterByCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FilterByCategoryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String categoryParam = request.getParameter("category");
        if (categoryParam == null || categoryParam.isEmpty()) {
            categoryParam = "all";
        }

        List<AddCategory> categories = null;
        List<DisplayProductmodel> products = null;

        try {
            // Load categories for dropdown
            CategoryModelDAO categoryDAO = new CategoryModelDAO();
            categories = categoryDAO.getAllCategories();

            // Load products based on category filter
            if ("all".equalsIgnoreCase(categoryParam)) {
                AddProductDAO productDAO = new AddProductDAO();
                products = productDAO.getAllProducts();
            } else {
                try {
                    int categoryId = Integer.parseInt(categoryParam);
                    FilterByCategoryDAO filterDAO = new FilterByCategoryDAO();
                    products = filterDAO.getProductsByCategory(categoryId);
                } catch (NumberFormatException e) {
                    AddProductDAO productDAO = new AddProductDAO();
                    products = productDAO.getAllProducts();
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            categories = new ArrayList<>();
            products = new ArrayList<>();
        }

        // Set attributes for JSP
        request.setAttribute("categories", categories);
        request.setAttribute("products", products);
        request.setAttribute("selectedCategory", categoryParam);

        // Forward to JSP
        request.getRequestDispatcher("pages/customer/product.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
