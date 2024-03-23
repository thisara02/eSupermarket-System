<%@page import="java.util.ArrayList"%>
<%@page import="cn.develop.model.Cart"%>
<%
   if (session.getAttribute("name")==null){
      response.sendRedirect("login.jsp");
    }
%>

<html lang="en">
  <head>
          <style>
        
        .why-choose-us-section {
            background-color: #f4f4f4;
            padding: 50px 0;
            text-align: center;
        }

        .why-choose-us-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .why-item {
            display: inline-block;
            width: 30%;
            padding: 20px;
            margin: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .why-item img {
            width: 50px;
            height: 50px;
            margin-bottom: 10px;
        }

        .why-item p {
            font-size: 14px;
            color: #555;
        }
            .carousel-container {
        position: relative;
        width: 100%;
        overflow: hidden;
        margin-top: 20px;
    }

    .carousel-images {
        display: flex;
        transition: transform 0.5s ease; 
    }

    .carousel-image {
        flex: 0 0 80%; 
        box-sizing: border-box;
        margin: 0 10%; 
    }

    .carousel-image img {
        width: 100%;
        height: auto;
        border-radius: 8px; 
    }

    .carousel-arrow {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        font-size: 24px;
        cursor: pointer;
        background-color: #fff;
        border: 1px solid #ddd;
        padding: 10px;
        border-radius: 5px;
        color: #333;
        z-index: 1;
    }

    .left-arrow {
        left: 10px;
    }

    .right-arrow {
        right: 10px;
    }
        
    </style>
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
    <script>
    function moveCarousel(direction) {
        const carouselImages = document.getElementById('carouselImages');
        const imageWidth = document.querySelector('.carousel-image').offsetWidth;
        const scrollAmount = direction === 'left' ? -imageWidth : imageWidth;
        carouselImages.style.transform = `translateX(${scrollAmount}px)`;
        setTimeout(() => {
            
            if (direction === 'left') {
                carouselImages.appendChild(carouselImages.firstElementChild);
            } else {
                carouselImages.prepend(carouselImages.lastElementChild);
            }
            carouselImages.style.transition = 'none';
            carouselImages.style.transform = 'translateX(0)';
            setTimeout(() => {
                carouselImages.style.transition = 'transform 0.5s ease'; 
            });
        }, 500); 
    }
</script>
    <title>GREEN Supermarket</title>
  </head>
  <body>
    <nav class="navigation">
        <a href="index.jsp" class="logo"> <span>GREEN&nbsp;</span>Supermarket </a>
   
      <input type="checkbox" class="menu-btn" id="menu-btn" />
      <label for="menu-btn" class="menu-icon">
        <span class="nav-icon"></span>
      </label>

      <ul class="menu">
        <li><a href="index.jsp" class="active">Home</a></li>
        <li><a href="product.jsp">Products</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="review.jsp">Review</a></li>
        <li><a style="background-color: #FF7276; border-radius: 30px;" href="log-out">Logout</a></li>
      </ul>
      
      <div class="right-nav">
        
        <a href="cart.jsp" class="cart">
        <i class="fas fa-shopping-cart"></i>
        <span><%= (session.getAttribute("cart-list") != null) ? ((ArrayList<Cart>) session.getAttribute("cart-list")).size() : 0 %></span>
    </a>
      </div>
    </nav>

    <section id="search-banner">
      
      <img src="images/bg-1.png" class="bg-1" alt="bg" />
      <img src="images/bg-2.png" class="bg-2" alt="bg-2" />
      
      <div class="search-banner-text">
        <h1>Order Your daily Groceries</h1>
        <strong>#Free Delivery</strong>
      </div>
    </section>
    
<section class="carousel-container">
    <div class="carousel-arrow left-arrow" onclick="moveCarousel('left')">&#9665;</div>
    <div class="carousel-images" id="carouselImages">
        <!-- Your carousel images here -->
        <div class="carousel-image"><img src="images/carousel-1.jpg" alt="Image 1"></div>
        <div class="carousel-image"><img src="images/carousel-2.jpg" alt="Image 2"></div>
        <div class="carousel-image"><img src="images/carousel-3.jpg" alt="Image 3"></div>
        <div class="carousel-image"><img src="images/carousel-4.jpg" alt="Image 4"></div>
        <div class="carousel-image"><img src="images/carousel-5.jpg" alt="Image 5"></div>
        <div class="carousel-image"><img src="images/carousel-6.jpg" alt="Image 6"></div>
        <div class="carousel-image"><img src="images/carousel-7.jpg" alt="Image 7"></div>
        <div class="carousel-image"><img src="images/carousel-8.jpg" alt="Image 8"></div>
        <div class="carousel-image"><img src="images/carousel-9.jpg" alt="Image 9"></div>
        <!-- Add more images as needed -->
    </div>
    <div class="carousel-arrow right-arrow" onclick="moveCarousel('right')">&#9655;</div>
</section>

    
    <div class="why-choose-us-section">
    <h2 class="why-choose-us-title">Why Choose Us?</h2>
    <div class="why-item">
        <img src="assets/refund-1.png" alt="Icon 1">
        <p>Quality Products</p>
    </div>
    <div class="why-item">
        <img src="assets/vegetable-1.png" alt="Icon 2">
        <p>Fresh and Organic</p>
    </div>
    <div class="why-item">
        <img src="assets/fast-icon.png" alt="Icon 3">
        <p>Fast Delivery</p>
    </div>
    <div class="why-item">
        <img src="assets/credit-card-1.png" alt="Secure Icon">
        <p>Secure Payment</p>
    </div>
</div>
    <section id="category">     
      <div class="category-heading">
        <h2>Category</h2>
        <span>All</span>
      </div>    
      <div class="category-container">       
        <a href="#" class="category-box">
          <img src="images/fish.png" alt="Fish" />
          <span>Fish & Meat</span>
        </a>      
        <a href="#" class="category-box">
          <img src="images/Vegetables.png" alt="Fish" />
          <span>Vegatbles</span>
        </a>        
        <a href="#" class="category-box">
          <img src="images/medicine.png" alt="Fish" />
          <span>Medicine</span>
        </a>       
        <a href="#" class="category-box">
          <img src="images/baby.png" alt="Fish" />
          <span>Baby</span>
        </a>
        <a href="#" class="category-box">
          <img src="images/office.png" alt="Fish" />
          <span>Office</span>
        </a>     
        <a href="#" class="category-box">
          <img src="images/beauty.png" alt="Fish" />
          <span>Beauty</span>
        </a>
        <a href="#" class="category-box">
          <img src="images/Gardening.png" alt="Fish" />
          <span>Gardening</span>
        </a>
      </div>
    </section>
    
    <section id="partner">
      
      <div class="partner-heading">
        <h3>Our Trusted Partner</h3>
      </div>
      
      <div class="logo-container">
        <img src="images/cbl_logo.png" alt="logo"/>
        <img src="images/baby_logo.png" alt="logo" />
        <img src="images/prima_logo.png" alt="logo" />
        <img src="images/eh_logo.jpg" alt="logo" />
      </div>
      <div class="logo-container">
        <img src="images/kist_logo.png" alt="logo"/>
        <img src="images/sunsilk.png" alt="logo" />
        <img src="images/maliban_logo.png" alt="logo" />
        <img src="images/com.png" alt="logo" />
      </div>
    </section>
    
    <footer>
      <div class="footer-container">
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
        <div class="footer-links">
          <strong>Location</strong>
          <ul>
            <li><a href="#">NSBM Green University<br/>Pitipana - Thalagala Rd,<br/>Homagama<br/>Sri Lanka.</a></li>
          </ul>
        </div>
        <div class="footer-links">
          <strong>Navigate</strong>
          <ul>
            <li><a href="about.jsp">About</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="review.jsp">Review</a></li>
            <li><a href="product.jsp">Products</a></li>
          </ul>
        </div>
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