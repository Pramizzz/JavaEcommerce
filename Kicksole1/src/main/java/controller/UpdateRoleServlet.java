package controller;

import DAO.RegisterModelDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;

@WebServlet("/updateRole")
public class UpdateRoleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String role = request.getParameter("role");

        if (idStr != null && role != null && !idStr.trim().isEmpty() && !role.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                RegisterModelDAO dao = new RegisterModelDAO();
                dao.updateUserRole(id, role);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/pages/admin/user.jsp");
    }
}
