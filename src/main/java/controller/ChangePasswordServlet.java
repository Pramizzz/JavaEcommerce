package controller;

import java.io.IOException;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Userc;
import utils.PasswordUtil;
import DAO.PasswordDAO;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final Pattern PASSWORD_PATTERN =
        Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%?&])[A-Za-z\\d@$!%?&]{8,}$");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Userc user = (Userc) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (currentPassword == null || newPassword == null || confirmPassword == null ||
            currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "New password and confirm password do not match.");
            request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
            return;
        }

        if (!PASSWORD_PATTERN.matcher(newPassword).matches()) {
            request.setAttribute("errorMessage", "Password must be at least 8 characters and include a lowercase, uppercase, digit, and special character.");
            request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
            return;
        }

        String hashedCurrentPassword = PasswordUtil.hashPassword(currentPassword);

        if (!hashedCurrentPassword.equals(user.getPassword())) {
            request.setAttribute("errorMessage", "Current password is incorrect.");
            request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
            return;
        }

        String hashedNewPassword = PasswordUtil.hashPassword(newPassword);
        PasswordDAO passwordDAO = new PasswordDAO();

        try {
            boolean updated = passwordDAO.updateUserPassword(user.getId(), hashedNewPassword);

            if (updated) {
                user.setPassword(hashedNewPassword);
                session.setAttribute("user", user); // update session with new password
                request.setAttribute("successMessage", "Password changed successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to update password. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating password.");
        }

        request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
    }
}
