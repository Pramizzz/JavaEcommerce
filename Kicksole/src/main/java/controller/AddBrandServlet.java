package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DAO.AddBrandDAO;
import model.AddBrandModel;

@WebServlet("/AddBrandServlet")
public class AddBrandServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddBrandServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            AddBrandDAO dao = new AddBrandDAO();
            List<AddBrandModel> brands = dao.getAllBrands();
            request.setAttribute("brands", brands);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error fetching brands");
            request.setAttribute("status", "error");
        }
        request.getRequestDispatcher("/pages/admin/AddBrand.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("operation");

        try {
            AddBrandDAO dao = new AddBrandDAO();

            if (op.equals("addbrand")) {
                String name = request.getParameter("brandName");
                AddBrandModel brand = new AddBrandModel(0, name);
                boolean result = dao.saveBrand(brand);

                request.setAttribute("message", result ? "Brand added successfully!" : "Failed to add brand.");
                request.setAttribute("status", result ? "success" : "error");

            } else if (op.equals("updatebrand")) {
                int id = Integer.parseInt(request.getParameter("brandId"));
                String name = request.getParameter("brandName");
                AddBrandModel brand = new AddBrandModel(id, name);
                boolean result = dao.updateBrand(brand);

                request.setAttribute("message", result ? "Brand updated successfully!" : "Failed to update brand.");
                request.setAttribute("status", result ? "success" : "error");

            } else if (op.equals("deletebrand")) {
                int id = Integer.parseInt(request.getParameter("brandId"));
                boolean result = dao.deleteBrand(id);

                request.setAttribute("message", result ? "Brand deleted successfully!" : "Failed to delete brand.");
                request.setAttribute("status", result ? "success" : "error");
            }

            

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error occurred.");
            request.setAttribute("status", "error");
        }

        request.getRequestDispatcher("/pages/admin/prodduct.jsp").forward(request, response);
    }
}
