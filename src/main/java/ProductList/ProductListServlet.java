package ProductList;
//ProductListServlet.java
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import com.google.gson.Gson;

public class ProductListServlet extends HttpServlet {
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

     try {
         Connection conn = DBConnection.getConnection();
         ProductDAO dao = new ProductDAO(conn);
         List<Product> productList = dao.getAllProducts();

         String json = new Gson().toJson(productList);
         response.setContentType("application/json");
         response.getWriter().write(json);
     } catch (Exception e) {
         e.printStackTrace();
         response.sendError(500);
     }
 }
}
