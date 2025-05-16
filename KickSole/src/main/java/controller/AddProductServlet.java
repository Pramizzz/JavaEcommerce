package controller;

import DAO.AddProductDAO;
import database.DatabaseConnection;
import model.ProductVariantModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/AddProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "resources/images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Get parameters
        String productName = request.getParameter("productName");
        String brandIdParam = request.getParameter("brandId");
        String categoryIdParam = request.getParameter("categoryId");
        String priceParam = request.getParameter("productPrice");
        String size = request.getParameter("variantSize");
        String color = request.getParameter("variantColor");
        String stockParam = request.getParameter("variantStock");

        boolean hasError = false;

        // Preserve field values
        request.setAttribute("productName", productName);
        request.setAttribute("brandId", brandIdParam);
        request.setAttribute("categoryId", categoryIdParam);
        request.setAttribute("price", priceParam);
        request.setAttribute("size", size);
        request.setAttribute("color", color);
        request.setAttribute("stock", stockParam);

        // Validate required fields
        if (isEmpty(productName)) {
            request.setAttribute("productNameError", "Product Name is required.");
            hasError = true;
        }
        if (isEmpty(brandIdParam)) {
            request.setAttribute("brandIdError", "Brand is required.");
            hasError = true;
        }
        if (isEmpty(categoryIdParam)) {
            request.setAttribute("categoryIdError", "Category is required.");
            hasError = true;
        }
        if (isEmpty(priceParam)) {
            request.setAttribute("priceError", "Price is required.");
            hasError = true;
        }
        if (isEmpty(size)) {
            request.setAttribute("sizeError", "Size is required.");
            hasError = true;
        }
        if (isEmpty(color)) {
            request.setAttribute("colorError", "Color is required.");
            hasError = true;
        }
        if (isEmpty(stockParam)) {
            request.setAttribute("stockError", "Stock quantity is required.");
            hasError = true;
        }

        // Validate brand & category IDs
        int brandId = 0, categoryId = 0;
        try {
            brandId = Integer.parseInt(brandIdParam);
        } catch (NumberFormatException e) {
            request.setAttribute("brandIdError", "Invalid Brand.");
            hasError = true;
        }
        try {
            categoryId = Integer.parseInt(categoryIdParam);
        } catch (NumberFormatException e) {
            request.setAttribute("categoryIdError", "Invalid Category.");
            hasError = true;
        }

        // Validate if brand_id exists
        if (!isBrandIdValid(brandId)) {
            request.setAttribute("brandIdError", "Invalid Brand ID. Brand does not exist.");
            hasError = true;
        }

        // Validate if category_id exists
        if (!isCategoryIdValid(categoryId)) {
            request.setAttribute("categoryIdError", "Invalid Category ID. Category does not exist.");
            hasError = true;
        }

        // Validate price
        double price = 0;
        try {
            price = Double.parseDouble(priceParam.trim());
            if (price <= 0) {
                request.setAttribute("priceError", "Price must be greater than 0.");
                hasError = true;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("priceError", "Invalid price format.");
            hasError = true;
        }

        // Validate stock
        int stockQty = 0;
        try {
            stockQty = Integer.parseInt(stockParam);
            if (stockQty <= 0) {
                request.setAttribute("stockError", "Stock must be greater than 0.");
                hasError = true;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("stockError", "Invalid stock format.");
            hasError = true;
        }

        // Validate size
        if (!size.matches("\\d+")) {
            request.setAttribute("sizeError", "Size must be a number.");
            hasError = true;
        }

        // Validate color
        if (!color.matches("^[a-zA-Z]+$")) {
            request.setAttribute("colorError", "Color must contain only letters.");
            hasError = true;
        }

        // If errors found, return to form
        if (hasError) {
            request.getRequestDispatcher("pages/admin/AddProducts.jsp").forward(request, response);
            return;
        }

        try {
            // Insert into DB
            AddProductDAO dao = new AddProductDAO();
            int productId = dao.insertProduct(productName, brandId, categoryId, price);
            dao.insertVariant(productId, new ProductVariantModel(size, color, stockQty));

            // Image save directory
            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + File.separator + UPLOAD_DIR;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) fileSaveDir.mkdirs();

            // Process image files
            for (Part part : request.getParts()) {
                if (part.getName().equals("productImages") && part.getSize() > 0) {
                    String contentType = part.getContentType();
                    if (!contentType.startsWith("image/")) {
                        response.sendRedirect("pages/admin/AddProducts.jsp?error=InvalidImage");
                        return;
                    }

                    String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
                    String fullPath = savePath + File.separator + fileName;

                    part.write(fullPath); // Save image

                    String relativePath = UPLOAD_DIR + "/" + fileName;
                    dao.saveImage(productId, relativePath); // Save relative path to DB
                }
            }

            response.sendRedirect("pages/admin/AddProducts.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/admin/AddProducts.jsp?error=Exception");
        }
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    private boolean isBrandIdValid(int brandId) {
        String sql = "SELECT COUNT(*) FROM brand WHERE brand_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, brandId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean isCategoryIdValid(int categoryId) {
        String sql = "SELECT COUNT(*) FROM category WHERE category_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}