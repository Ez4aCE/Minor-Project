<%-- 
    Document   : BookTrain
    Created on : Nov 21, 2023, 9:19:02 AM
    Author     : ryben(aditya)
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page import="java.lang.Integer" %>
<%@page import="java.sql.*"%>
<%@page import ="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Booking details</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

      <!-- bootstrap icon  -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

      <!-- css  -->
      <link rel="stylesheet" href="http://localhost:8080/Bookinggo/HomePage/hp.css">
      <link rel="stylesheet" href="http://localhost:8080/Bookinggo/HomePage/booktra.css">
</head>
<body>

<%  
            OracleConnection oconn;
            OraclePreparedStatement ops;
            OracleResultSet ors;
            OracleResultSetMetaData orsmd;
            String date, departureStation, arrivalStation, trainName ;
            int  trainId,trainPrice,avaseat,totalseat,nop;
    // Retrieve the selected train ID from the request
    String trainIds = request.getParameter("trainId");
    trainId = Integer.parseInt(trainIds);
    
    String nops = request.getParameter("nop");
//    nop = Integer.parseInt(nops);
        nop = 1;

    
    
     DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            
            // STEP 5: INSTANTIATING TH             E CONNECTION
            oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
            
            // STEP 6: INSTANTIATING THE STATEMENT OBJECT
            ops = (OraclePreparedStatement)oconn.prepareCall("SELECT * FROM AVAILABLETRAINS WHERE TRAINID = ?");
              ops.setString(1, trainIds);
            
            // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
            ors = (OracleResultSet)ops.executeQuery();
           
    
    
    

//    // Use the trainId to fetch the details of the selected train
//    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl", "TECHNOK4", "DATABASE");
//    PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM AVAILABLETRAINS WHERE TRAINID = ?");
//    preparedStatement.setString(1, trainIds);
//    ResultSet resultSet = preparedStatement.executeQuery();

    
    
    
    if (ors.next()) {
        // Retrieve details of the selected train
        trainName = ors.getString("TRAINNAME");
        departureStation = ors.getString("DEPSTATION");
        arrivalStation = ors.getString("ARRSTATION");
        date = ors.getString("TRAVELDATE");
        trainPrice = ors.getInt("PRICE");
        avaseat = ors.getInt("AVASEAT");
        totalseat = ors.getInt("TOTALSEAT");

        // Display the details or process the booking as needed

        
        
        
      if(avaseat > 0 && nop > 0 && nop <= avaseat){
         int navaseat = avaseat-nop;
        
 %>           
    
 
 
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
                    <li><a href="#" class="nav-link px-2 link">book</a></li>
                    <li><a href="#" class="nav-link px-2 link">help</a></li>
                    <li><a href="#" class="nav-link px-2 link">about us</a></li>
                  </ul>

                  <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                    <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
                  </form>

                  <div class="dropdown text-end" id="logout">
                    <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                      data-bs-toggle="dropdown" aria-expanded="false">
                      <img src="/Bookinggo/image/profile.png" alt="mdo" width="32" height="32"
                        class="rounded-circle">
                    </a>
                    <ul class="dropdown-menu text-small" >
                         
                      <li><a class="dropdown-item" href="/Bookinggo/profilepage/Profile.jsp">my bookings</a></li>
                      <li><a class="dropdown-item" href="/Bookinggo/profilepage/Profile.jsp">Profile</a></li>
                      <li>
                        <hr class="dropdown-divider">
                      </li>
                      <li><a class="dropdown-item" href="http://localhost:8080/Bookinggo/SessLogOut">log out</a></li>
                    </ul>
                  </div>

                  <div class="dropdown text-end" id="login">
                    <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                      data-bs-toggle="dropdown" aria-expanded="false">
                      <img src="/Bookinggo/image/profile.png" alt="mdo" width="32" height="32"
                        class="rounded-circle">
                    </a>
                    <ul class="dropdown-menu text-small" >
                      <li><a class="dropdown-item" href="/Bookinggo/UserRegistration/Register.html">create new account</a></li>
                      <li><a class="dropdown-item" href="/Bookinggo/UserLogin/UserLogin.html">log in</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </header>
                 
            <%! String vname,email,userid; %>
        <% HttpSession se=request.getSession(false);
        try {
            if(se!=null){
            vname = se.getAttribute("sname").toString();
            email = se.getAttribute("EMAIL").toString();
            userid = se.getAttribute("userid").toString();
            
            %>
                <script>
                    
//                var name =  <%=vname%>;
                document.getElementById('login').style.display = "none";
                       
                </script>
                
            <%   
            }
          } catch(Exception ex) { %>
          <script>
            alert("you are not logged in!!! Redirecting to login page ");
            document.getElementById('logout').style.display = "none";

             location.href="http://localhost:8080/Bookinggo/UserLogin/UserLogin.html";
          </script>
          <% } %>

          
<div class="container mt-4" id="conbook">          
          
<!--    <h1>Booking Details</h1>
        <p>Departure Station: <%= departureStation %></p>
        <p>Arrival Station: <%= arrivalStation %></p>
        <p>Travel Date: <%= date %></p>
        <p>Available seat: <%= avaseat %></p>
        <p>Total seat: <%= totalseat %></p>        
        <p>Price: <%= trainPrice %></p>  -->
          
 <div class="row g-5" id="booked" >
     
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">Your ticket detail</span>
          <span class="badge bg-primary rounded-pill">3</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Train name</h6>
              <small class="text-body-secondary"></small>
            </div>
            <span class="text-body-secondary"><%= trainName%></span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Departure Station:</h6>
              <small class="text-body-secondary"></small>
            </div>
            <span class="text-body-secondary"><%= departureStation %></span>
          </li>
          
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Arrival Station: </h6>
              <small class="text-body-secondary"></small>
            </div>
            <span class="text-body-secondary"><%= arrivalStation %></span>
          </li> 
          
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Available seat: </h6>
              <small class="text-body-secondary"></small>
            </div>
            <span class="text-body-secondary"><%= avaseat %></span>
          </li>
          
           <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Travel Date:  </h6>
              <small class="text-body-secondary"></small>
            </div>
            <span class="text-body-secondary"><%= date %></span>
          </li>          
          
          <li class="list-group-item d-flex justify-content-between bg-body-tertiary">
            <div class="text-success">
              <h6 class="my-0">Price: </h6>
              <small></small>
            </div>
            <span class="text-success">₹<%= trainPrice %></span>
          </li>
          <li class="list-group-item d-flex justify-content-between">
            <span>Total (RS)</span>
            <strong>₹<%= trainPrice %></strong>
          </li>
        </ul>

        <form class="card p-2">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Promo code">
            <button type="submit" class="btn btn-secondary">Redeem</button>
          </div>
        </form>
      </div>
     
     
     
     
     
      <div class="col-md-7 col-lg-8 mb-4">
        <h2 class="mb-3 text-light">BOOKING DETAILS</h2>
        <form class="needs-validation" novalidate="" method="post" action="http://localhost:8080/Bookinggo/TicketSearch/ProcessPayment.jsp">
            
            <input type="hidden" name="trainId" value="<%=trainId%>">
             <input type="hidden" name="nop" value="<%=nop%>">
            <input type="hidden" name="navaseat" value="<%=navaseat%>">
             <input type="hidden" name="totalvaseat" value="<%=totalseat%>">
             <input type="hidden" name="trainPrice" value="<%=trainPrice%>">
            <input type="hidden" name="userid" value="<%=userid%>">
            <input type="hidden" name="date" value="<%=date%>">
            

            
            
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label text-light">Enter name</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="<%=vname%>" required="" name="username">
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

    

            

            <div class="col-12">
              <label for="email" class="form-label text-light">Email <span class="text-body-secondary text-light">(Optional)</span></label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com" value="<%=email%>" name="email">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            

          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label text-light" for="same-address">Accept Terms & Condition</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label text-light" for="save-info">Save this information for next time</label>
          </div>

          <hr class="my-4">

          <h4 class="mb-3 text-light">Payment</h4>

          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked="" required="">
              <label class="form-check-label text-light" for="credit">Credit card</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required="">
              <label class="form-check-label text-light" for="debit">Debit card</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required="">
              <label class="form-check-label text-light" for="paypal">PayPal</label>
            </div>
          </div>

          <div class="row gy-3">
            <div class="col-md-6">
              <label for="cc-name" class="form-label text-light">Name on card</label>
              <input type="text" class="form-control" id="cc-name" placeholder="" required="">
              <small class="text-body-secondary text-light">Full name as displayed on card</small>
              <div class="invalid-feedback">
                Name on card is required
              </div>
            </div>

            <div class="col-md-6">
              <label for="cc-number" class="form-label text-light"> card number</label>
              <input type="text" class="form-control" id="cc-number" placeholder="" name="cardNumber" required>
              <div class="invalid-feedback">
                card number is required
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-expiration" class="form-label text-light">Expiration</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
              <div class="invalid-feedback">
                Expiration date required
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-cvv" class="form-label text-light">CVV</label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
              <div class="invalid-feedback">
                Security code required
              </div>
            </div>
          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
        </form>
      </div>
    </div>         
          
 </div>
          <div class="container-fluid"> 
          
          


          
<!-- 
 
                      
                        
                        
                        
                         Payment Form 
            <form method="post" action="ProcessPayment.jsp">  Create a new JSP for payment processing 
                <input type="hidden" name="trainId" value="<%=trainId%>">
                <input type="hidden" name="nop" value="<%=nop%>">
                <input type="hidden" name="navaseat" value="<%=navaseat%>">
                <input type="hidden" name="totalvaseat" value="<%=totalseat%>">
                <input type="hidden" name="trainPrice" value="<%=trainPrice%>">
                
               

                 Include additional fields for payment information 
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required>
                 Include other payment-related fields 

                <button type="submit">Proceed to Payment</button>
            </form>-->
                     
            
<%            
             } else {
            out.println("<p>Error: no availabe seat sorry.....</p>");                   
                }
       
        %>
        

<%
    } else {
        // Handle the case when the train details are not found
        out.println("<p>Error: Train details not found.</p>");
    }

    // Close resource
         ors.close();
         ops.close();
         oconn.close();
    
%>



  
  <!-- footer  -->
 <div class="row justify-content-evenly bg-dark text-white pt-3 pb-5">
    <div class="col-lg-3 pt-4">
      <h5 class="pb-2">Booking go</h5>
      <p> booking go is the world's top rated online ticket booking service trusted by over 1 million happy
        customers globally. we offer ticket booking through our website, iOS and Android mobile apps for all
        major routes. </p>
    </div>
    <div class="col-lg-3 pt-4">
      <h5 class="pb-2">important link</h5>
      <p>
        <a href="#" class="link-light text-decoration-none">TERMS & CO.</a><br>
        <a href="#" class="link-light text-decoration-none">policy</a><br>
        <a href="#" class="link-light text-decoration-none">safty guide</a><br>
        <a href="#" class="link-light text-decoration-none">sitemap</a><br>
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

</div>
  

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
  crossorigin="anonymous"></script>
</body>
</html>

