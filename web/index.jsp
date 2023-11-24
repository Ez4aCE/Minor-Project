<%-- Document : Home Created on : Nov 5, 2023, 1:05:00 AM Author : ryben(aditya) --%>
  <%@page import ="javax.servlet.http.HttpSession" %>
  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>BookingGo</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

      <!-- bootstrap icon  -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

      <!-- css  -->
      <link rel="stylesheet" href="http://localhost:8080/Bookinggo/HomePage/hp.css">
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
            
            
            
            
            
            
            <!-- heading -->

            <div class="container-fluid">

              <!-- tagline -->
              <div class="row">
                <div class="col-12">
                    <h3 class="display-6 text-center mt-4 mb-2 text-light "> welcome to booking go <br> Your first step to
                    future destination
                  </h3>
                </div>
              </div>

              <!-- features -->
              <div class="row justify-content-evenly pt-3 pb-3 ">
                <div class="col-md-3 text-center mt-2">
                  <h1><i class="bi bi-calendar-date text-primary"></i></h1>
                  <h5>book your dates</h5>
                  <p>never miss your trip and book your trip today.</p>
                </div>
                <div class="col-md-3 text-center mt-2">
                  <h1><i class="bi bi-credit-card-2-back-fill text-danger"></i></h1>
                  <h5>easy payment</h5>
                  <p>we accept varity of payment method so no worries of payment.</p>
                </div>
                <div class="col-md-3 text-center mt-2">
                  <h1><i class="bi bi-telephone-inbound-fill "></i></h1>
                  <h5>24hr support</h5>
                  <p>we are always here for your problems and try to find solution as soo as possible.</p>
                </div>
              </div>

              <hr>


              <script type="text/javascript">
                function OnSubmitForm()
                {
                  if(document.myform.rado[0].checked == true)
                  {
                    document.myform.action ="fill.jsp";
                  }
                  else
                  if(document.myform.rado[1].checked == true)
                  {
                    document.myform.action ="CarSearch.jsp";
                  }
                  return true;
                }
                </script>
              


              <!-- from of ticket-->
              
              <div class="row justify-content-evenly pt-4 pb-3 mt-4 mb-5 ">
                <div class="col-lg-10" id="cont-form">
                  <form class="formm" method="POST" onsubmit="return OnSubmitForm();" name="myform">

                    <div class="radio">
                      <input type="radio" class="r form-check-input" name="rado" id="train"><img
                        src="/Bookinggo/image/train (1).png" alt="" style="height: 30px;">Train
                        <input type="radio" class="r form-check-input" name="rado" id="car"><img
                          src="/Bookinggo/image/car.png" alt="" style="height: 40px;">Car

                      
                    </div>

                    <div class="search">
                        <input type="text" class="form-control" id="from" placeholder="from" name="departure">
                      <img src="/Bookinggo/image/next.png" alt="" style="width: 2vw; margin-right: 10px;">
                      <input type="text" class="form-control" id="dest" placeholder="destination" name="arrival">
                      <input type="date" class="form-control" id="dot" name="date">
                      <!--<input type="number" class="form-control" id="nop" placeholder="no. of people" name="nop">-->
                      <button type="submit" class="btn btn-danger">search</button>
                    </div>


                  </form>
                </div>
              </div>

           



              <!-- slider(carousel ) -->

              <div id="carouselExampleAutoplaying" class="carousel slide " data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="/Bookinggo/image/airplane-4974678_1280.jpg" height="400px" width="50px" class="d-block w-100"
                      alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="/Bookinggo/image/bus-2546383_1280.jpg" height="400px" width="50px" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="/Bookinggo/image/blur-1239439_1280.jpg" height="400px" width="50px" class="d-block w-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
                  data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
                  data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>


              <hr>



              <div class="row justify-content-evenly pt-2 pb-5" id="contact">

                <!-- contact -->
                <div class="col-lg-5 mt-4" id="con">
                  <h3 class="pb-4" style="text-align: center;">FEEDBACK FORM</h3>
                  <form action="http://localhost:8080/Bookinggo/FeedBackLog" method="POST">
                    <div class="mb-3 mt-4">
                      <label for="exampleInputname1" class="form-label">Enter name</label>
                      <input type="text" class="form-control" id="exampleInputname1" name="name">

                    </div>
                    <div class="mb-3 mt-3">
                      <label for="exampleInputEmail1" class="form-label">Email address</label>
                      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
                      <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                    </div>

                     <div class="mb-3">
                      <label for="exampleFormControlTextarea1" class="form-label">Type message</label>
                      <textarea class="form-control" id="exampleFormControlTextarea1" rows="1" name="content"></textarea>
                    </div> 

                    <div class="mb-3 form-check">
                      <input type="checkbox" class="form-check-input" id="exampleCheck1">
                      <label class="form-check-label" for="exampleCheck1">Accept T&C</label>
                    </div>
                    <button type="submit" class="btn btn-danger">Submit</button>
                  </form>

                </div>

                <!-- address  -->
                <div class="col-lg-5 mt-4" id="add">
                  <h3 class="mb-4" style="text-align: center;"> OUR OFFICE ADDRESS</h3>
                  <p> sector 4 <br>
                    saltlake, kolkata 700106 <br>
                    <i class="bi bi-telephone"></i> 9523405897
                  </p>
                  <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7369.000542194446!2d88.41522145913822!3d22.56038525009889!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a02743399dde5b7%3A0xb7fda47d544f467a!2sSukantanagar%20Vidyaniketan!5e0!3m2!1sen!2sin!4v1692858806058!5m2!1sen!2sin"
                    height="250" style="width: 100%;" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>

                </div>
              </div>

              <hr>
              <!-- FAQ  -->

              <div class="row justify-content-evenly mt-4 mb-5">

                <div class="col-lg-10  ">
                  <h2 class="text-center">FAQ</h2>

                  <div class="accordion accordion-flush border" id="accordionFlushExample">
                    <div class="accordion-item">
                      <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                          data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                          can we book without login
                        </button>
                      </h2>
                      <div id="flush-collapseOne" class="accordion-collapse collapse"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">no you cant book anything without sign-in.
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                          data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                          what payment modes are there?
                        </button>
                      </h2>
                      <div id="flush-collapseTwo" class="accordion-collapse collapse"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">we accept credit, debit cards and upi.
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                          data-bs-target="#flush-collapseThree" aria-expanded="false"
                          aria-controls="flush-collapseThree">
                          if train delay can i get refund
                        </button>
                      </h2>
                      <div id="flush-collapseThree" class="accordion-collapse collapse"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">sorry we have a no refund policy.
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>


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



            <script src="home.js"></script>


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
              integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
              crossorigin="anonymous"></script>

              
        



    </body>

    </html>