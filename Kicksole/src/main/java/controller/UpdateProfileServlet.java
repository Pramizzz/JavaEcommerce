package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Userc;
import DAO.UsercDAO;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Userc currentUser = (Userc) session.getAttribute("user");
        
        if (currentUser == null) {
            response.sendRedirect("/customer/login.jsp");
            return;
        }
        
        // Get form data
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        
        // Validate email
        if (email == null || email.trim().isEmpty() || !email.contains("@")) {
            request.setAttribute("errorMessage", "Please enter a valid email address.");
            request.getRequestDispatcher("/pages/customer/Profile_Edit.jsp").forward(request, response);
            return;
        }
        
        try {
            // Update user object
            currentUser.setName(fullName);
            currentUser.setEmail(email);
            currentUser.setBirthday(birthday);
            currentUser.setPhone(phone);
            
            // Update in database
            UsercDAO userDAO = new UsercDAO();
            boolean updated = userDAO.updateUser(currentUser);
            
            if (updated) {
                session.setAttribute("user", currentUser);
                request.setAttribute("successMessage", "Profile updated successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to update profile. Please try again.");
            }
            
            request.getRequestDispatcher("/pages/customer/Profile_Edit.jsp").forward(request, response);
            
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/pages/customer/Profile_Edit.jsp").forward(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/pages/customer/Profile_Edit.jsp");
    }
}