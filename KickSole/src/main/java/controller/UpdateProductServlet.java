package controller;

import DAO.UpdateProductDAO;
import model.ProductVariantModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/UpdateProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class UpdateProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "resources/images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("productId");
        String name = request.getParameter("productName");
        String brandStr = request.getParameter("brandId");
        String catStr = request.getParameter("categoryId");
        String priceStr = request.getParameter("productPrice");
        String sizeStr = request.getParameter("variantSize");
        String color = request.getParameter("variantColor");
        String stockStr = request.getParameter("variantStock");

        int productId = 0, brandId, categoryId, stock, size;
        double price;

        try {
            productId = Integer.parseInt(idStr);
            brandId = Integer.parseInt(brandStr);
            categoryId = Integer.parseInt(catStr);
            stock = Integer.parseInt(stockStr);
            price = Double.parseDouble(priceStr);

            // --- Validate size ---
            try {
                size = Integer.parseInt(sizeStr);
                if (size <= 0 || size > 50) {
                    request.setAttribute("error", "invalidSize");
                    request.setAttribute("errorProductId", productId);
                    request.getRequestDispatcher("/pages/admin/AddProducts.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "invalidSizeFormat"); // e.g., float or text
                request.setAttribute("errorProductId", productId);
                request.getRequestDispatcher("/pages/admin/AddProducts.jsp").forward(request, response);
                return;
            }

            // --- Validate price and stock ---
            if (price <= 0 || stock <= 0) {
                request.setAttribute("error", "nonPositiveValue");
                request.setAttribute("errorProductId", productId);
                request.getRequestDispatcher("/pages/admin/AddProducts.jsp").forward(request, response);
                return;
            }

            // --- Validate color as alphabetic only ---
            if (!Pattern.matches("^[A-Za-z ]+$", color.trim())) {
                request.setAttribute("error", "invalidColor");
                request.setAttribute("errorProductId", productId);
                request.getRequestDispatcher("/pages/admin/AddProducts.jsp").forward(request, response);
                return;
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "invalidInput");
            try {
                productId = Integer.parseInt(idStr);
                request.setAttribute("errorProductId", productId);
            } catch (Exception ignored) {}
            request.getRequestDispatcher("/pages/admin/AddProducts.jsp").forward(request, response);
            return;
        }

        try {
            ProductVariantModel variant = new ProductVariantModel(sizeStr.trim(), color.trim(), stock);
            UpdateProductDAO dao = new UpdateProductDAO();
            dao.updateProduct(productId, name.trim(), brandId, categoryId, price);
            dao.updateVariant(productId, variant);

            // --- Handle Image Upload ---
            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + File.separator + UPLOAD_DIR;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) fileSaveDir.mkdirs();

            for (Part part : request.getParts()) {
                if (part.getName().equals("productImages") && part.getSize() > 0) {
                    String fileName = part.getSubmittedFileName();

                    // --- Validate file type ---
                    if (!isImageFile(fileName)) {
                        request.setAttribute("error", "invalidImageType");
                        request.setAttribute("errorProductId", productId);
                        request.getRequestDispatcher("/pages/admin/AddProducts.jsp").forward(request, response);
                        return;
                    }

                    // Delete old image
                    String oldImagePath = dao.getImagePath(productId);
                    if (oldImagePath != null) {
                        File oldFile = new File(appPath + File.separator + oldImagePath);
                        if (oldFile.exists()) oldFile.delete();
                    }

                    // Save new image
                    String newFileName = System.currentTimeMillis() + "_" + fileName;
                    part.write(savePath + File.separator + newFileName);
                    dao.saveImage(productId, UPLOAD_DIR + "/" + newFileName);
                }
            }

            response.sendRedirect(request.getContextPath() + "/pages/admin/AddProducts.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/admin/AddProducts.jsp?error=updateFailed");
        }
    }

    // --- Helper Method: Validate file extensions for images ---
    private boolean isImageFile(String fileName) {
        String[] allowedExtensions = {".jpg", ".jpeg", ".png", ".gif", ".bmp"};
        fileName = fileName.toLowerCase();
        for (String ext : allowedExtensions) {
            if (fileName.endsWith(ext)) {
                return true;
            }
        }
        return false;
    }
}