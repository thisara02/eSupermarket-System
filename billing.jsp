<%@page import="cn.develop.dao.ProductDao"%>
<%@page import="cn.develop.connection.DbCon"%>
<%@page import="java.util.List"%>
<%@page import="cn.develop.model.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.develop.model.Cart"%>
<%@ page import="com.paypal.api.payments.*" %>
<%@ page import="com.paypal.base.rest.*" %>

<%
   if (session.getAttribute("name")==null){
      response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
DecimalFormat dcf = new DecimalFormat("###.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style2.css">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/stylesheet.css" />
    <link rel="shortcut icon" href="images/Green.jpg" />
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
    <style>
        .container1{
    max-width: 600px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

form{
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 10px;
    font-weight: bold;
}

input {
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    background-color: #007bff;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #0056b3;
}
    </style>
    <title>GREEN Supermarket</title>


</head>
<body>
        <nav class="navigation">
        <a href="index.html" class="logo"> <span>GREEN&nbsp;</span>Supermarket </a>
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

<div class="container1">
    <img style="align-content: center" src="img/Paypal-logo.png" width="200" height="100" alt=""/>
        <h1>Pay with PayPal</h1>

        <form method="post" action="processPayPalPayment">
            
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%
String userEmail = request.getParameter("userEmail");
if (userEmail != null && !userEmail.isEmpty()) {
    
    userEmail = userEmail.toLowerCase();
    
    Properties properties = new Properties();
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.port", "587");
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");

    // Set up the session
    final String username = "greensupermarket56@gmail.com";
    final String password = "nume hmif eaqa lesb";
    
    Session s1 = Session.getInstance(properties, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        MimeMessage message = new MimeMessage(s1);

        message.setFrom(new InternetAddress(username));

        message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
        message.setSubject("Payment Confirmation");
        message.setText("Thank you for your payment. Your order is confirmed.");

        Transport.send(message);
    } catch (MessagingException e) {
        
    }
}
%>
            <h3 class="title">billing address</h3>

                <div class="inputBox">
                    <span>full name :</span>
                    <input type="text" placeholder="Thisara Madusanka" required />
                </div>
                <div class="inputBox">
                    <span>email :</span>
                    <input type="email" name="userEmail" placeholder="example@gmail.com" required />
                </div>
                <div class="inputBox">
                    <span>address :</span>
                    <input type="text" placeholder="Maharagama, Sri Lanka" required />
                </div>
                <div class="inputBox">
                    <span>city :</span>
                    <input type="text" placeholder="Maharagama" required />
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>state :</span>
                        <input type="text" placeholder="Sri Lanka" required />
                    </div>
                    <div class="inputBox">
                        <span>zip code :</span>
                        <input type="text" placeholder="500 600" required />
                    </div>
                </div>
            <label for="amount">Amount:</label>
            <input type="text" name="amount" id="amount" value="<%= request.getAttribute("total") %>" required readonly />
            
            <button type="submit" onclick="alert('Continue with Paypal')">Pay with PayPal</button>
        </form>
    </div>
</body>
</html>
