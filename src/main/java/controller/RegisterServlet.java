package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RegisterModelDAO;
import model.RegisterModel;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String birthday = request.getParameter("birthday");
        String password = request.getParameter("pass");
        String confirmPassword = request.getParameter("re_pass");
        String contact = request.getParameter("contact");
        String agreeTerm = request.getParameter("agree-term");

        
        RequestDispatcher dispatcher = null;

        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("status", "emptyName");
            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
            dispatcher.forward(request, response);
            return;
        } else if (!name.matches("^[A-Za-z\\s]+$")) {
            request.setAttribute("status", "invalidName");
            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
            dispatcher.forward(request, response);
            return;
        } else if (name.length() < 6) {
            request.setAttribute("status", "shortName");
            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
            dispatcher.forward(request, response);
            return;
        }


        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("status", "emptyUserName");
            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
            dispatcher.forward(request, response);
            return;
        } else if (!username.matches("^[A-Za-z0-9]+$")) {
            request.setAttribute("status", "invalidUserName");
            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
            dispatcher.forward(request, response);
            return;
        } else if (username.length() < 6) {
            request.setAttribute("status", "shortUserName");
            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("status", "emptyEmail");
            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
            dispatcher.forward(request, response);
            return;
            
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            request.setAttribute("status", "invalidEmail");
            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
            dispatcher.forward(request, response);
            return;
        }


	    try {
	        LocalDate birthDate = LocalDate.parse(birthday);
	        LocalDate today = LocalDate.now();
	        int age = Period.between(birthDate, today).getYears();

	        if (birthDate.isAfter(today)) {
	            request.setAttribute("status", "invalidFutureBirthday");
	            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	            dispatcher.forward(request, response);
	            return;
	        }

	        if (age < 14 || age > 100) {
	            request.setAttribute("status", "invalidAge");
	            dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	            dispatcher.forward(request, response);
	            return;
	        }
	    } catch (DateTimeParseException e) {
	        request.setAttribute("status", "invalidBirthdayFormat");
	        dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	        dispatcher.forward(request, response);
	        return;
	    }


	    if (password == null || password.trim().isEmpty()) {
	        request.setAttribute("status", "emptyPassword");
	        dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	        dispatcher.forward(request, response);
	        return;
	    } else if (
	        password.length() < 6 ||
	        !password.matches(".*[A-Z].*") ||               
	        !password.matches(".*\\d.*") ||                 
	        !password.matches(".*[!@#$%^&*(),.?\":{}|<>].*") 
	    ) {
	        request.setAttribute("status", "invalidPassword");
	        dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	        dispatcher.forward(request, response);
	        return;
	    }

	    if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
	        request.setAttribute("status", "emptyConfirmPassword");
	        dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	        dispatcher.forward(request, response);
	        return;
	    } else if (!confirmPassword.equals(password)) {
	        request.setAttribute("status", "invalidConfirmPassword");
	        dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	        dispatcher.forward(request, response);
	        return;
	    }
	    
	    if (contact == null || contact.trim().isEmpty()) {
	        request.setAttribute("status", "emptyPhone");
	        dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	        dispatcher.forward(request, response);
	        return;
	    } else if (!contact.matches("^\\d{10}$")) {
	        request.setAttribute("status", "invalidPhone");
	        dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	        dispatcher.forward(request, response);
	        return;
	    }
	   
	    if (agreeTerm == null) {
	        request.setAttribute("status", "termsNotAccepted");
	        dispatcher = request.getRequestDispatcher("/register/registration.jsp");
	        dispatcher.forward(request, response);
	        return;
	    }
	    
        String hashedPassword = hashPassword(password);
        RegisterModel user = new RegisterModel(name, username, email, birthday, hashedPassword, contact);

        try {
            RegisterModelDAO dao = new RegisterModelDAO();
            boolean hasInserted = dao.addRegisterModel(user);

            if (hasInserted) {
                out.println("<script>alert('User registered successfully!'); window.location='register/registration.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to register user. Try again.'); window.location='register/registration.jsp';</script>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('Database error occurred. Contact admin.'); window.location='register/registration.jsp';</script>");
        }
    }
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                hexString.append(String.format("%02x", b));
            }

            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    }