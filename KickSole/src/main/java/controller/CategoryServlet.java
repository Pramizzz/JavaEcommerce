package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AddCategory;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/CategoryServlet" })
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			
			String op = request.getParameter("operation");
			if(op.trim().equals("addcategory")) {
				 //add category
				//fetching category data  
				String title = request.getParameter("categoryName");
				String description = request.getParameter("description");
				
				AddCategory category = new AddCategory();
				category.setCategoryName(title);
				category.setCategoryDescription(description);
				
				//category database save:
				
			}
			else if (op.trim().equals("addproducts")){
				// add products
			}
				
		}
	}
	
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
