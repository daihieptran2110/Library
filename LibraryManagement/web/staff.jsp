<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Check if session contains an account
    if (session == null || session.getAttribute("account") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Check if the account role is Admin
    Model.Account account = (Model.Account) session.getAttribute("account");
    if (!"Staff".equalsIgnoreCase(account.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
    </head>
    <body>
        <h1>Welcome <%= account.getUsername() %>!</h1>
        <!-- Admin-specific content goes here -->
        <form action="logout" method="get">
            <input type="submit" value="Log out">
        </form>
    </body>
</html>
