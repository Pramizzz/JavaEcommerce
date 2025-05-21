package controller;

import DAO.RegisterModelDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);

                RegisterModelDAO dao = new RegisterModelDAO();
                boolean deleted = dao.deleteUserById(id);
                if (!deleted) {
                    System.out.println("No user found with id " + id);
                }

                // If you open a DB connection in DAO constructor, you should close it after
                // e.g. dao.closeConnection();

            } catch (NumberFormatException e) {
                System.err.println("Invalid id parameter for deletion: " + idStr);
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.err.println("DeleteUserServlet: 'id' parameter is missing or empty");
        }
        response.sendRedirect(request.getContextPath() + "/pages/admin/user.jsp");
    }
}
