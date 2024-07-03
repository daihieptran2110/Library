package Controller;

import dal.*;
import Model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class RegisterServlet extends HttpServlet {

    private AccountDAO accountDAO;

    @Override
    public void init() throws ServletException {
        // Initialize AccountDAO
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String cfpassword = request.getParameter("cfpassword");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        if (!password.equals(cfpassword)) {
            request.setAttribute("errorMessage", "Passwords do not match");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            if (isUsernameTaken(username)) {
                request.setAttribute("errorMessage", "Username is already taken");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
                return;
            }

            if (accountDAO.registerAccount(username, password, firstName, lastName, email, phone, address)) {
                request.setAttribute("successMessage", "Registration successful! You can now log in.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Server error. Please try again later.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }

    private boolean isUsernameTaken(String username) throws SQLException {
        Members member = accountDAO.getMembersByUsername(username);
        return member.getUsername() != null;
    }
}
