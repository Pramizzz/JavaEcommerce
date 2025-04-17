package AddProductServler;
//AddProductServlet.java
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

public class AddProductServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

     try {
         Product product = new Product();
         product.setName(request.getParameter("name"));
         product.setCategory(request.getParameter("category"));
         product.setSubCategory(request.getParameter("subCategory"));
         product.setDetails(request.getParameter("details"));
         product.setPrice(Double.parseDouble(request.getParameter("price")));
         product.setStock(Integer.parseInt(request.getParameter("stock")));
         product.setImageUrl(request.getParameter("imageUrl"));

         Connection conn = DBConnection.getConnection();
         ProductDAO dao = new ProductDAO(conn);
         dao.addProduct(product);

         response.sendRedirect("addproduct.jsp?success=true");
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("addproduct.jsp?error=true");
     }
 }
}
