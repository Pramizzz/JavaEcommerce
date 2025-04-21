package controller;

@WebServlet("/admin/products")
public class ProductListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Connection conn = DBConnection.getConnection();
			ProductDAO dao = new ProductDAO(conn);
			List<Product> products = dao.getAllProducts();
			request.setAttribute("products", products);
			RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
