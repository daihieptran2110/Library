<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Model.Account" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT Library</title>
        <link rel="stylesheet" href="stylehome.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    </head>
    <body>
        <div class="wrapper-1">
            <div class="wrapper">
                <div class="header">
                    <nav class="nav">
                        <div class="nav-logo">
                            <img src="Image/Logo.svg" alt="">
                        </div>
                        <div class="nav-menu" id="navMenu">
                            <ul>
                                <li><a href="home.jsp" class="link">Home</a></li>
                                    <c:choose>
                                        <c:when test="${sessionScope.account == null}">
                                        <li><a href="login.jsp" class="link">Login</a></li>
                                        <li><a href="register.jsp" class="link">Register</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li><input type="text" value="${sessionScope.account.username}" readonly class="user-info"></li>
                                        <li><a href="logout" class="link">Logout</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                <li><a href="#" class="link">Blog</a></li>
                                <li><a href="#" class="link">Services</a></li>
                                <li><a href="#" class="link">About</a></li>
                            </ul>
                        </div>
                        <div class="nav-menu-btn">
                            <i class="bx bx-menu" onclick="myMenuFunction()"></i>
                        </div>
                    </nav>
                </div>
                <div class="text-box">
                    <h1>FPT Library</h1>
                    <p>Welcome to FPT Library, a vibrant hub for knowledge and community engagement! We offer an extensive
                        collection of books, digital resources, and multimedia materials for all ages and interests. Explore and grow with us at FPT Library!</p>
                    <a href="#events-container" class="hero-btn">Visit us to know more</a>
                </div>
            </div>
        </div>
        <div id="events-container" class="events-container">
            <h1>Upcoming Events</h1>
            <div class="events">
                <div class="event">
                    <div class="event-image">
                        <img src="Image/448389980_932364458691430_4408059251112181533_n.jpg" alt="Beat the heart">
                    </div>
                    <div class="event-details">
                        <span class="event-date">June 26, 2024</span>
                        <h2><a href="https://www.facebook.com/photo/?fbid=932364462024763&set=a.552202316707648">FPTU STUDENT ACHIEVEMENT AWARDS SPRING 2024 - BEAT THE HEAT</a></h2>
                        <p>
                            <a href="https://lu.ma/mpdw861a">Registration link</a><br>
                            Welcome the vibrant summer with the Spring 2024 Honors Ceremony - A place to honor the individuals and groups from FPT University Hanoi who have excelled in academics and extracurricular activities throughout the Spring 2024 semester.
                        </p>
                    </div>
                </div>
                <div class="event">
                    <div class="event-image">
                        <img src="Image/449080023_934616875132855_5317647981371107440_n.jpg" alt="Letterpress">
                    </div>
                    <div class="event-details">
                        <span class="event-date">June 23, 2024</span>
                        <h2><a href="https://www.facebook.com/photo?fbid=934616878466188&set=a.552202316707648">[F-TALKS 2024] INTERESTING FACTS ABOUT JAPAN YOU MAY NOT KNOW</a></h2>
                        <p><a href="https://forms.gle/EVKYGpYk4zHtrQ1XA">Registration link</a><br>
                            F-Talks: "Fascinating Japan" is a Japanese debating competition aimed at providing an experiential platform for students who have a special passion for the Japanese language at FPT University Hanoi. It encourages academic spirit and a passion for the Japanese language within the student community.
                        </p>
                    </div>
                </div>
                <div class="event">
                    <div class="event-image">
                        <img src="Image/448641194_932050775389465_2926342240311869721_n.jpg" alt="Letterpress">
                    </div>
                    <div class="event-details">
                        <span class="event-date">September, 2024</span>
                        <h2><a href="https://www.facebook.com/photo/?fbid=932050772056132&set=a.552202310040982">STUDENT COMPETITION ON INFORMATION SECURITY 2024</a></h2>
                        <a href="https://forms.gle/3LSxSgcmkPTHeqhj6">Registration link</a><br>
                        <p>Official announcement: Registration is now open for teams to participate in the ASEAN Student Information Security Competition 2024, held in Vietnam for the 6th time. This is an opportunity for students of FPT University to learn, exchange, and hone their skills with peers from other universities both domestically and internationally.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="featured-container">
            <div class="featured-header">
                <h1>Book Collections</h1>
                <p class="description">Welcome to our library, a treasure trove of books and resources designed to cater to diverse interests and needs. Whether you're a student, researcher, casual reader, or lifelong learner, our library offers an extensive collection and various services to support your journey. Here’s top 3 books you can explore</p>
            </div>
            <div class="collections">
                <div class="collection">
                    <img src="Image/9780262046305.avif" alt="Introduction to Algorithms, Fourth Edition">
                    <h2><a href="#">Introduction to Algorithms, Fourth Edition</a></h2>
                    <p>Introduction to Algorithms uniquely combines rigor and comprehensiveness. It covers a broad range of algorithms in depth, yet makes their design and analysis accessible to all levels of readers, with self-contained chapters and algorithms in pseudocode.</p>
                </div>
                <div class="collection">
                    <img src="Image/9780262048972.avif" alt="Foundations of Computer Vision">
                    <h2><a href="#">Foundations of Computer Vision</a></h2>
                    <p>Providing a much-needed modern treatment, this accessible and up-to-date textbook comprehensively introduces the foundations of computer vision while incorporating the latest deep learning advances.</p>
                </div>
                <div class="collection">
                    <img src="Image/9780262046824.avif" alt="Probabilistic Machine Learning">
                    <h2><a href="#">Probabilistic Machine Learning</a></h2>
                    <p>This book offers a detailed and up-to-date introduction to machine learning (including deep learning) through the unifying lens of probabilistic modeling and Bayesian decision theory.</p>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col">
                        <h4>Library</h4>
                        <ul>
                            <li><a href="#">about us</a></li>
                            <li><a href="#">our services</a></li>
                            <li><a href="#">privacy policy</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>get help</h4>
                        <ul>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">returns</a></li>
                            <li><a href="#">Services</a></li>
                            <li><a href="register.jsp">Register</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>follow us</h4>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script>
            function myMenuFunction() {
                var x = document.getElementById("navMenu");
                if (x.style.display === "block") {
                    x.style.display = "none";
                } else {
                    x.style.display = "block";
                }
            }

            document.querySelector('.hero-btn').addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        </script>
    </body>
</html>
