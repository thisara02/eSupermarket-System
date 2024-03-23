<%@page import="java.util.ArrayList"%>
<%@page import="cn.develop.model.Cart"%>
<%
   if (session.getAttribute("name")==null){
      response.sendRedirect("login.jsp");
    }
%>

<html lang="en">
  <head>
 
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
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        section {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: green;
            font-family: 'Arial', serif; 
            font-size: 3em; 
            margin-bottom: 20px;
            
        }

        p {
            line-height: 1.6;
            color: #666;
            text-align: left;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-top: 20px;
        }
    </style>

    <title>GREEN Supermarket</title>
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
    
    <section>
        <h1>About Us</h1>
        

        <h2>Our Story</h2>
        <img src="img/wall-1.jpeg" alt="Image Below H1" style="max-width: 100%; height: auto; border-radius: 8px; margin-top: 20px;">
        <p>Green Supermarket is a trailblazing entity in the supermarket industry, positioned at the forefront of eco-conscious retail. Over the years, the supermarket has emerged as a leader, distinguishing itself not only through its extensive range of products but also through a commitment to sustainability and innovation. However, one of the notable challenges faced by the Green Supermarket is the outdated state of its website. As the supermarket's business has evolved significantly since its inception, there is a pressing need to integrate modern features into the online platform to enhance user experience and align with contemporary industry standards.</p>
        <p>The concept of the Green Supermarket revolves around the principles of sustainability, environmental responsibility, and a dedication to providing customers with ethically sourced and eco-friendly products. The supermarket recognizes the growing importance of environmentally conscious consumption and aims to be a catalyst for positive change in the retail landscape. From sourcing products with minimal environmental impact to implementing green technologies in its operations, the Green Supermarket is a beacon of sustainable practices in the retail sector.</p>
        <p>One of the core advantages of the Green Supermarket concept is its contribution to environmental conservation. By prioritizing eco-friendly products and sustainable sourcing practices, the supermarket reduces its carbon footprint and minimizes the environmental impact of its operations. This commitment to sustainability extends to various aspects of the business, including packaging, waste management, and energy consumption. Through these efforts, the Green Supermarket not only meets the evolving expectations of environmentally conscious consumers but also sets a standard for responsible business practices.</p>
        <p>Additionally, the Green Supermarket concept fosters community engagement and supports local economies. By emphasizing the importance of locally sourced products and collaborating with regional suppliers, the supermarket becomes a hub for promoting local businesses. This approach not only strengthens ties within the community but also bolsters the economic sustainability of local producers. Customers, in turn, benefit from access to fresh, locally sourced goods, creating a symbiotic relationship that goes beyond traditional retail transactions.</p>
        <p>Furthermore, the Green Supermarket distinguishes itself through its dedication to transparency and ethical business practices. The supermarket ensures that customers are informed about the origin and production methods of the products they purchase. This transparency builds trust and loyalty among consumers who increasingly seek authenticity and ethical considerations in their purchasing decisions. In a world where consumers are becoming more conscientious about the environmental and social impact of their choices, the Green Supermarket's commitment to transparency becomes a key differentiator in the market.</p>
        <p>To address the challenges posed by the obsolete website, the Green Supermarket envisions a digital transformation that aligns with its core values and enhances the overall customer experience. Introducing features such as online payment handling, SMS or email notifications for purchases and cancellations, and a user-friendly interface will not only modernize the website but also cater to the changing preferences of consumers in the digital age. The integration of these features will streamline the online shopping process, making it more convenient and efficient for customers while reinforcing the Green Supermarket's commitment to innovation.</p>
        <p>In conclusion, the Green Supermarket concept represents a pioneering approach to retail, placing sustainability, community engagement, and transparency at its core. The advantages of this concept extend beyond environmental conservation to encompass community support, ethical business practices, and a commitment to meeting the evolving needs of conscious consumers. As the supermarket embarks on revitalizing its website, the incorporation of modern features will undoubtedly amplify its impact, ensuring that the Green Supermarket remains a trailblazer in the supermarket industry, setting new standards for eco-conscious retail</p>
        <br><br>
        <h2>Our Mission</h2>
        <p>The mission of Green Supermarket is to redefine the landscape of retail by embodying a steadfast commitment to sustainability, environmental responsibility, and community well-being. Our purpose is to offer a diverse range of products that prioritize ethical sourcing, minimize environmental impact, and contribute to the collective effort for a greener, healthier planet. We aim to lead by example, inspiring a conscious shift in consumer behavior towards eco-friendly choices and responsible consumption.</p>

        <img src="img/wall-2.jpg" alt="Company Image">

       
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
