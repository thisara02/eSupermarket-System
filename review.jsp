<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.develop.model.Cart"%>
<%
   if (session.getAttribute("name")==null){
      response.sendRedirect("login.jsp");
    }
%>

<html lang="en">
<head>
    <!-- Your existing head content -->
    <!-- ... -->
    <script src="https://kit.fontawesome.com/80224b9ef7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/stylesheet.css" />
    <link rel="stylesheet" href="css/review.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet"/>
    <title>GREEN Supermarket</title>

    <script>
        function submitForm() {
            var username = document.getElementById("username").value;
            var message = document.getElementById("message").value;

            // Basic validation (you may want to enhance this)
            if (username.trim() === "" || message.trim() === "") {
                alert("Please enter both username and message.");
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("client-box-container").innerHTML += xhr.responseText;
                    document.getElementById("username").value = "";
                    document.getElementById("message").value = "";
                }
            };
            xhr.open("POST", "ReviewServlet", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("username=" + encodeURIComponent(username) + "&message=" + encodeURIComponent(message));
        }
    </script>
</head>
<body>
        <nav class="navigation">
        <a href="index.jsp" class="logo"> <span>GREEN&nbsp;</span>Supermarket </a>
      <!--menu-btn---->
      <input type="checkbox" class="menu-btn" id="menu-btn" />
      <label for="menu-btn" class="menu-icon">
        <span class="nav-icon"></span>
      </label>
      <!--menu-------->
      <ul class="menu">
        <li><a href="index.jsp" class="active">Home</a></li>
        <li><a href="product.jsp">Products</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="review.jsp">Review</a></li>
        <li><a style="background-color: #FF7276; border-radius: 30px;" href="log-out">Logout</a></li>
      </ul>
      <!--right-nav-(cart-like)-->
      <div class="right-nav">
        <!--cart----->
        <a href="cart.jsp" class="cart">
        <i class="fas fa-shopping-cart"></i>
        <span><%= (session.getAttribute("cart-list") != null) ? ((ArrayList<Cart>) session.getAttribute("cart-list")).size() : 0 %></span>
    </a>
      </div>
    </nav>
<!-- Your existing navigation bar -->
<!-- ... -->

<div class="c_us" padding="20px">
    <h1>Review Form</h1>
    <form onsubmit="event.preventDefault(); submitForm();">
        <input type="text" id="username" placeholder="Your Name" required>
        <textarea id="message" placeholder="Your Message" required></textarea>
        <button type="submit">Submit</button>
    </form>
</div>


<section id="clients">
    <div class="client-heading">
        <h3>What Our Client's Say</h3>
    </div>
    <div class="client-box-container" id="client-box-container">
        <!-- Existing client boxes -->
        <!-- ... -->

        <%-- Display messages from the database here --%>
        <%
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                // Assuming you have a database named "your_database" and a table named "reviews"
                String url = "jdbc:mysql://localhost:3306/esupermarket";
                String dbUser = "admin";
                String dbPassword = "8645";

                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, dbUser, dbPassword);

                // Retrieve messages from the "reviews" table
                String query = "SELECT username, message FROM reviews";
                preparedStatement = connection.prepareStatement(query);
                resultSet = preparedStatement.executeQuery();

                // Display the existing messages
                while (resultSet.next()) {
                    String username = resultSet.getString("username");
                    String message = resultSet.getString("message");
        %>
        <!-- Display each message as a new client box -->
        <div class="client-box">
            <div class="client-profile">
                <div class="profile-text">
                    <strong><%= username %></strong>
                </div>
            </div>
            <p><%= message %></p>
        </div>
        <% } // End of while loop %>
        <%-- Close database resources --%>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</section>
    <footer>
      <div class="footer-container">
        <!--logo-container------>
        <div class="footer-logo">
          <a href="index.jsp" class="logo"> <span>GREEN&nbsp;</span>Supermarket </a>
          <!--social----->
          <div class="footer-social">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
        <!--links------------------------->
        <div class="footer-links">
          <strong>Location</strong>
          <ul>
            <li><a href="#">NSBM Green University
    <br/>
    Pitipana - Thalagala Rd,
    <br/>
    Homagama
    <br/>
    Sri Lanka.</a></li>
            
          </ul>
        </div>
        <!--links------------------------->
        <div class="footer-links">
          <strong>Navigate</strong>
          <ul>
            <li><a href="about.jsp">About</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="review.jsp">Review</a></li>
            <li><a href="product.jsp">Products</a></li>
          </ul>
        </div>
        <!--links-------------------------->
        <div class="footer-links">
          <strong>Contact</strong>
          <ul>
            <li><a href="#">Phone : 0785509917</a></li>
            <li><a href="#">Email : greensupermarket56@gmail.com</a></li>
          </ul>
        </div>
      </div>
    </footer>
</body>
</html>
