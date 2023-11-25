<%-- 
    Document   : Complaints
    Created on : Nov 23, 2023, 7:02:51 AM
    Author     : ryben(aditya)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>complaint</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

      <!-- bootstrap icon  -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

      <!-- css  -->
      <link rel="stylesheet" href="http://localhost:8080/Bookinggo/HomePage/hp.css">
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        

        section {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
                        height: 100vh;

            background-image: radial-gradient( circle farthest-corner at 10% 20%,  rgba(176,229,208,0.1) 42%, rgba(92,202,238,0.20) 93.6% );
    box-shadow: 1px 15px 51px 0px rgba(0,0,0,0.75);
    -webkit-box-shadow: 1px 15px 51px 0px rgba(0,0,0,0.75);
    -moz-box-shadow: 1px 15px 51px 0px rgba(0,0,0,0.75);
        }

        h1 {
            color: #007BFF;
        }

        p {
            line-height: 1.6;
        }

       
        
    </style>
</head>
<body>

<!-- navbar -->

            <header class="p-3  border-bottom " id="nav">
              <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                  <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
                    <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                      <use xlink:href="#bootstrap"></use>
                    </svg>
                  </a>

                  <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">

                    <li><a href="#">
                        <img src="/Bookinggo/image/logo.png"
                          style="height: 50px; width: 100px;">
                      </a></li>
                    <li><a href="/Bookinggo/" class="nav-link px-2 link">home</a></li>
                    <li><a href="/Bookinggo/" class="nav-link px-2 link">book</a></li>
                    <li><a href="/Bookinggo/ComplaintsPage/Complaints.jsp" class="nav-link px-2 link">help</a></li>
                    <li><a href="http://localhost:8080/Bookinggo/AboutUs/Aboutus.jsp" class="nav-link px-2 link">about us</a></li>
                  </ul>


                  <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                    <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
                  </form>

                  <div class="dropdown text-end" id="log">
                    <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                      data-bs-toggle="dropdown" aria-expanded="false">
                      <img src="/Bookinggo/image/profile.png" alt="mdo" width="32" height="32"
                        class="rounded-circle">
                    </a>
                    <ul class="dropdown-menu text-small" >
<%! String vname; %>
<% HttpSession se=request.getSession(false);
  try {
    if (se != null) {
        vname = se.getAttribute("sname").toString();
%>                     
                      <li><a class="dropdown-item" href=""><%=vname%></li>                      
                      <li><a class="dropdown-item" href="/Bookinggo/profilepage/Profile.jsp">my bookings</a></li>
                      <li><a class="dropdown-item" href="/Bookinggo/profilepage/Profile.jsp">Profile</a></li>
                      <li>
                        <hr class="dropdown-divider">
                      </li>
                      <li><a class="dropdown-item" href="http://localhost:8080/Bookinggo/SessLogOut">log out</a></li>
 <%
    }
}  catch(Exception ex) { %> 
                      
                      <li><a class="dropdown-item" href="/Bookinggo/UserRegistration/Register.html">create new account</a></li>
                      <li><a class="dropdown-item" href="/Bookinggo/UserLogin/UserLogin.html">log in</a></li>
<%
    }
%>                      
                    </ul>
                  </div>

                  
                </div>
              </div>
            </header>
            
            


<section>
    <h4>Welcome to BookingGo, </h4>
    
    <p></p>


    <p>you can contact below for more help</p>

    <ul>
        <li>call us - 9523405897</li>
        <li>email us at - bookinggominorproject@gmail.com</li>
    </ul>
    
    <h4>Our Office Address-</h4>
    
    <p> sector 4 <br>
                    saltlake, kolkata 700106 <br>
                    <i class="bi bi-telephone"></i> 9523405897
                  </p>
                  <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7369.000542194446!2d88.41522145913822!3d22.56038525009889!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a02743399dde5b7%3A0xb7fda47d544f467a!2sSukantanagar%20Vidyaniketan!5e0!3m2!1sen!2sin!4v1692858806058!5m2!1sen!2sin"
                    height="250" style="width: 100%;" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>

     
</section>

    <div class="container-fluid">    
    
        <!-- footer  -->
              <div class="row justify-content-evenly bg-dark text-white pt-3 pb-5">
                <div class="col-lg-3 pt-4">
                  <h5 class="pb-2">Booking go</h5>
                  <p> booking go is the world's largest online ticket booking service trusted by over 1 million happy
                    customers globally. we offer ticket booking through our website, iOS and Android mobile apps for all
                    major routes. </p>
                </div>
                <div class="col-lg-3 pt-4">
                  <h5 class="pb-2">important link</h5>
                  <p>
                    <a href="/Bookinggo/ComplaintsPage/Complaints.jsp" class="link-light text-decoration-none">help</a><br>
                     <a href="http://localhost:8080/Bookinggo/AboutUs/Aboutus.jsp" class="link-light text-decoration-none">about us</a><br>
                    <a href="http://localhost:8080/Bookinggo/Feedback/feedback.jsp" class="link-light text-decoration-none">feedback</a><br>
                    
                  </p>
                </div>
                <div class="col-lg-3 pt-4">

                  <img class="img" src="/Bookinggo/image/rupay.png" alt="" style="height: 5vh;">
                  <img class="img" src="/Bookinggo/image/visa.png" style="height: 6vh; margin-left: 5px;"
                    alt="">
                  <img class="img" src="/Bookinggo/image/master.png" alt="">

                </div>
              </div>

              <!-- copyright -->
              <div class="row bg-secondary text-white text-center pb-1">
                <div class="col-12" style="height: 20px;">
                  <p>&copy;copyright 2022-2024 by booking go. All Rights Reserved.</p>
                </div>
              </div>

              <!-- closing div  -->
            </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
              integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
              crossorigin="anonymous"></script>

</body>
</html>

