package controller;

import DAO.AddProductDAO;
import DAO.AddBrandDAO;
import DAO.CategoryModelDAO;
import model.ProductVariantModel;
import model.AddBrandModel;
import model.AddCategory;
import model.DisplayProductmodel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.List;



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

        String productName = request.getParameter("productName");
        String brandIdParam = request.getParameter("brandId");
        String categoryIdParam = request.getParameter("categoryId");
        String priceParam = request.getParameter("productPrice");
        String size = request.getParameter("variantSize");
        String color = request.getParameter("variantColor");
        String stockParam = request.getParameter("variantStock");
        
        

        boolean hasError = false;

        // Preserve inputs
        request.setAttribute("productName", productName);
        request.setAttribute("brandId", brandIdParam);
        request.setAttribute("categoryId", categoryIdParam);
        request.setAttribute("price", priceParam);
        request.setAttribute("size", size);
        request.setAttribute("color", color);
        request.setAttribute("stock", stockParam);
        
        try {
            AddProductDAO productDAO = new AddProductDAO();
            List<DisplayProductmodel> products = productDAO.getAllProducts();

            CategoryModelDAO catDAO = new CategoryModelDAO();
            AddBrandDAO brandDAO = new AddBrandDAO();

            List<AddCategory> categories = catDAO.getAllCategories();
            List<AddBrandModel> brands = brandDAO.getAllBrands();

            request.setAttribute("products", products);
          request.setAttribute("categories", categories);
            request.setAttribute("brands", brands); 
            request.getRequestDispatcher("/pages/admin/AddProducts.jsp").forward(request, response);


        } catch (Exception e) {
            e.printStackTrace();
        }


        // Field validations
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

        // Parse values
        int brandId = 0, categoryId = 0, stockQty = 0;
        double price = 0.0;

        try {
            brandId = Integer.parseInt(brandIdParam);
        } catch (NumberFormatException e) {
            request.setAttribute("brandIdError", "Invalid brand.");
            hasError = true;
        }

        try {
            categoryId = Integer.parseInt(categoryIdParam);
        } catch (NumberFormatException e) {
            request.setAttribute("categoryIdError", "Invalid category.");
            hasError = true;
        }

        try {
            price = Double.parseDouble(priceParam);
            if (price <= 0) {
                request.setAttribute("priceError", "Price must be greater than 0.");
                hasError = true;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("priceError", "Invalid price format.");
            hasError = true;
        }

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

        if (!size.matches("\\d+")) {
            request.setAttribute("sizeError", "Size must be a number.");
            hasError = true;
        }

        if (!color.matches("^[a-zA-Z]+$")) {
            request.setAttribute("colorError", "Color must contain only letters.");
            hasError = true;
        }

        if (hasError) {
            request.getRequestDispatcher("pages/admin/AddProducts.jsp").forward(request, response);
            return;
        }

        try {
            AddProductDAO dao = new AddProductDAO();
            int productId = dao.insertProduct(productName, brandId, categoryId, price);
            dao.insertVariant(productId, new ProductVariantModel(size, color, stockQty));

            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + File.separator + UPLOAD_DIR;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) fileSaveDir.mkdirs();

            for (Part part : request.getParts()) {
                if (part.getName().equals("productImages") && part.getSize() > 0) {
                    String contentType = part.getContentType();
                    if (!contentType.startsWith("image/")) {
                        response.sendRedirect("pages/admin/AddProducts.jsp?error=InvalidImage");
                        return;
                    }

                    String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
                    part.write(savePath + File.separator + fileName);
                    String relativePath = UPLOAD_DIR + "/" + fileName;
                    dao.saveImage(productId, relativePath);
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
}
