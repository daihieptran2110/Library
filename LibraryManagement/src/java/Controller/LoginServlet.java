package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.AccountDAO;
import Model.Account;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String error;
        HttpSession session = request.getSession();

        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getByUsernamePassword(username, password);
        if (account == null) {
            error = " Wrong username or password";
            request.setAttribute("error", error);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (username != null && password != null) {
            // Authentication successful
            String role = account.getRole();
            session.setAttribute("account", account);
            if (account.getUsername().equalsIgnoreCase(username) && account.getPassword().equals(password)) {
                if (role != null && !role.isEmpty()) {
                    if (role.equalsIgnoreCase("Admin")) {
                        request.getRequestDispatcher("admin.jsp").forward(request, response);
                    } else if (role.equals("Staff")) {
                        request.getRequestDispatcher("staff.jsp").forward(request, response);
                    } else if (role.equals("Members")) {
                        session.setAttribute("role", role); // Save the role in the session
                        session.setAttribute("username", username); // Save the username in the session
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                    }
                }
            }
        }
    }
}
