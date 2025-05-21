package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Userc;
import database.DatabaseConnection;
import utils.PasswordUtil;
import DAO.PasswordDAO;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Password validation regex - matches requirements from the JSP
    private static final Pattern PASSWORD_PATTERN = 
        Pattern.compile("^(?=.[a-z])(?=.[A-Z])(?=.\\d)(?=.[@$!%?&])[A-Za-z\\d@$!%?&]{8,}$");
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Check if user is logged in
        HttpSession session = request.getSession();
        Userc user = (Userc) session.getAttribute("user");
        
        if (user == null) {
            // If not logged in, redirect to login
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            // If logged in, forward to the change password page
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Userc user = (Userc) session.getAttribute("user");
        
        // Redirect to login if not logged in
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        // Get form parameters
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Basic validation
        if (currentPassword == null || newPassword == null || confirmPassword == null ||
            currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required");
            request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
            return;
        }
        
        // Check if new passwords match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "New password and confirm password do not match");
            request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
            return;
        }
        
        // Validate password strength
        if (!PASSWORD_PATTERN.matcher(newPassword).matches()) {
            request.setAttribute("errorMessage", "Password does not meet security requirements");
            request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
            return;
        }
        
        // Verify current password by hashing it and comparing with stored hash
        String hashedCurrentPassword = PasswordUtil.hashPassword(currentPassword);
        if (!hashedCurrentPassword.equals(user.getPassword())) {
            request.setAttribute("errorMessage", "Current password is incorrect");
            request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
            return;
        }
        
        // Hash the new password
        String hashedNewPassword = PasswordUtil.hashPassword(newPassword);
        
        PasswordDAO passwordDAO = new PasswordDAO();

        try {
            boolean updated = passwordDAO.updateUserPassword(user.getId(), hashedNewPassword);
            
            if (updated) {
                user.setPassword(hashedNewPassword);
                session.setAttribute("user", user);
                request.setAttribute("successMessage", "Password changed successfully! Please use your new password for future logins.");
            } else {
                request.setAttribute("errorMessage", "Failed to update password. Please try again.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }
        
        // Redirect back to change password page
        request.getRequestDispatcher("pages/customer/change-password.jsp").forward(request, response);
    }
}
