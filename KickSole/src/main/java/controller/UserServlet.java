/*package controller;

import model.UserModel;
import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try (UserDAO userDAO = new UserDAO()) {
            if (action == null || action.isEmpty()) {
                // Show all users
                List<UserModel> userList = userDAO.selectAllUsers();
                request.setAttribute("listUser", userList);
                request.getRequestDispatcher("/pages/admin/userList.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                // Edit specific user
                int userId = Integer.parseInt(request.getParameter("id"));
                UserModel user = userDAO.selectUser(userId);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/pages/admin/userForm.jsp").forward(request, response);
            } else if (action.equals("delete")) {
                // Delete user
                int userId = Integer.parseInt(request.getParameter("id"));
                userDAO.deleteUser(userId);
                response.sendRedirect(request.getContextPath() + "/user");
            }
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");

        UserModel user = new UserModel(name, username, email, birthday, phone);

        try (UserDAO userDAO = new UserDAO()) {
            if ("update".equals(action)) {
                // Update user
                user.setId(Integer.parseInt(id));
                userDAO.updateUser(user);
            } else {
                // Insert new user
                userDAO.insertUser(user);
            }
            response.sendRedirect(request.getContextPath() + "/user");
        } catch (SQLException e) {
            throw new ServletException("Database error while saving user", e);
        }
    }
}*/
