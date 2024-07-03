<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- BOXICONS -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="style.css">
        <title>FPT University Library - Register</title>

    </head>
    <body>
        <div class="wrapper">
            <nav class="nav">
                <div class="nav-logo">
                    <img src="Image/Logo.svg" alt="">
                </div>
                <div class="nav-menu" id="navMenu">
                    <ul>
                        <li><a href="home.jsp" class="link">Home</a></li>
                        <li><a href="login.jsp" class="link">Login</a></li>
                        <li><a href="register.jsp" class="link active">Register</a></li>
                        <li><a href="#" class="link">Blog</a></li>
                        <li><a href="#" class="link">Services</a></li>
                        <li><a href="#" class="link">About</a></li>
                    </ul>
                </div>
                <div class="nav-menu-btn">
                    <i class="bx bx-menu" onclick="myMenuFunction()"></i>
                </div>
            </nav>
            <!----------------------------- Register Form ----------------------------------->
            <div class="form-box">
                <div class="register-container">
                    <div class="top">
                        <span>Have an account? <a href="login.jsp">Login</a></span>
                        <header>Sign Up</header>
                    </div>
                    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                    <% if (errorMessage != null) { %>
                    <div class="error" style="color: red; font-weight: bold; margin-top: 10px;">
                        <%= errorMessage %>
                    </div>
                    <% } %>

                    <% String successMessage = (String) request.getAttribute("successMessage"); %>
                    <% if (successMessage != null) { %>
                    <div class="success" style="color: green; font-weight: bold; margin-top: 10px;">
                        <%= successMessage %>
                    </div>
                    <% } %>

                    <form action="register" method="post">
                        <div class="two-forms">
                            <div class="input-box">
                                <input type="text" name="firstname" class="input-field" placeholder="First Name" required>
                                <i class="bx bx-user"></i>
                            </div>
                            <div class="input-box">
                                <input type="text" name="lastname" class="input-field" placeholder="Last Name" required>
                                <i class="bx bx-user"></i>
                            </div>
                            <div class="input-box">
                                <input type="text" name="username" class="input-field" placeholder="Username" required>
                                <i class="bx bx-user"></i>
                            </div>
                        </div>
                        <div class="input-box">
                            <input type="email" name="email" class="input-field" placeholder="Email" required>
                            <i class="bx bx-envelope"></i>
                        </div>
                        <div class="input-box">
                            <input type="tel" name="phone" class="input-field" placeholder="Phone" required>
                            <i class="bx bx-phone"></i>
                        </div>
                        <div class="input-box">
                            <input type="text" name="address" class="input-field" placeholder="Address" required>
                            <i class="bx bx-map"></i>
                        </div>
                        <div class="input-box">
                            <input type="password" name="password" class="input-field" placeholder="Password" required>
                            <i class="bx bx-lock-alt"></i>
                        </div>
                        <input type="password" name="cfpassword" class="input-field" placeholder="Confirm Password" required>
                        <i class="bx bx-lock-alt"></i>
                </div>

                <div class="input-box">
                    <input type="submit" class="submit" value="Register">
                </div>
                <div class="two-col">
                    <div class="one">
                        <input type="checkbox" id="register-check">
                        <label for="register-check"> Remember Me</label>
                    </div>
                    <div class="two">
                        <label><a href="#">Terms & conditions</a></label>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        function myMenuFunction() {
            var i = document.getElementById("navMenu");
            if (i.className === "nav-menu") {
                i.className += " responsive";
            } else {
                i.className = "nav-menu";
            }
        }
    </script>
</body>
</html>
