package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CategoryModelDAO;
import model.AddCategory;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CategoryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CategoryModelDAO dao = new CategoryModelDAO();
            List<AddCategory> categories = dao.getAllCategories();
            request.setAttribute("categories", categories);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error fetching categories");
            request.setAttribute("status", "error");
        }

        request.getRequestDispatcher("/pages/admin/category.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("operation");

        if (op == null) {
            request.setAttribute("message", "No operation specified.");
            request.setAttribute("status", "error");
            request.getRequestDispatcher("/pages/admin/category.jsp").forward(request, response);
            return;
        }

        try {
            CategoryModelDAO dao = new CategoryModelDAO();

            if (op.equals("addcategory")) {
                String title = request.getParameter("categoryName");
                AddCategory category = new AddCategory(0, title);
                boolean result = dao.saveCategory(category);

                if (result) {
                    request.setAttribute("message", "Category added successfully!");
                    request.setAttribute("status", "success");
                } else {
                    request.setAttribute("message", "Error adding category.");
                    request.setAttribute("status", "error");
                }

            } else if (op.equals("updatecategory")) {
                int id = Integer.parseInt(request.getParameter("categoryId"));
                String title = request.getParameter("categoryName");
                AddCategory category = new AddCategory(id, title);
                boolean result = dao.updateCategory(category);

                if (result) {
                    request.setAttribute("message", "Category updated successfully!");
                    request.setAttribute("status", "success");
                } else {
                    request.setAttribute("message", "Error updating category.");
                    request.setAttribute("status", "error");
                }

            } else if (op.equals("deletecategory")) {
                int id = Integer.parseInt(request.getParameter("categoryId"));
                boolean result = dao.deleteCategory(id);

                if (result) {
                    request.setAttribute("message", "Category deleted successfully!");
                    request.setAttribute("status", "success");
                } else {
                    request.setAttribute("message", "Error deleting category.");
                    request.setAttribute("status", "error");
                }
            }

            // After any operation, refresh the category list
            List<AddCategory> categories = dao.getAllCategories();
            request.setAttribute("categories", categories);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error occurred.");
            request.setAttribute("status", "error");
        }

        request.getRequestDispatcher("/pages/admin/category.jsp").forward(request, response);
    }
}
