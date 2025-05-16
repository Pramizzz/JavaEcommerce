package controller;

import DAO.AddProductDAO;
import model.ProductVariantModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

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
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String size = request.getParameter("variantSize");
        String color = request.getParameter("variantColor");
        int stockQty = Integer.parseInt(request.getParameter("variantStock"));

        try {
            AddProductDAO dao = new AddProductDAO();
            int productId = dao.insertProduct(productName, brandId, categoryId);
            dao.insertVariant(productId, new ProductVariantModel(size, color, stockQty));

            // Get absolute path for saving images
            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + File.separator + UPLOAD_DIR;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) fileSaveDir.mkdirs();

            for (Part part : request.getParts()) {
                if (part.getName().equals("productImages") && part.getSize() > 0) {
                    String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
                    String fullPath = savePath + File.separator + fileName;

                    part.write(fullPath); // Save image to server

                    // Save relative path to DB (not full path)
                    String relativePath = UPLOAD_DIR + "/" + fileName;
                    dao.saveImage(productId, relativePath);
                }
            }

            response.sendRedirect(request.getContextPath() + "/pages/admin/AddProducts.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/admin/AddProducts.jsp?error=1");
        }
    }
}
