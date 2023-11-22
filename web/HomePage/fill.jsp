<%-- 
Document   : fill
Created on : Nov 8, 2023, 11:37:03 PM
    Author     : ryben(aditya)
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page import= "java.util.Date" %>
<%@page import= "java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TRAIN DETAILS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

      <!-- bootstrap icon  -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

      <!-- css  -->
    <link rel="stylesheet" href="http://localhost:8080/Bookinggo/HomePage/hp.css">
    <link rel="stylesheet" href="filter.css">
    </head>
    <%!
        // STEP 3: DECLARING OBJECTS AND VARIABLES
            OracleConnection oconn;
            OraclePreparedStatement ops;
            OracleResultSet ors;
            OracleResultSetMetaData orsmd;
            int counter, reccounter, colcounter;
            String date, departureStation, arrivalStation, trainName,nop ;
            int  trainId,trainPrice;
        %>
        <%
            
            departureStation = request.getParameter("departure");
            date = request.getParameter("date");
            nop = request.getParameter("nop");
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date dt = sdf.parse(date);
                SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
                date = sdf1.format(dt);
//         
            arrivalStation = request.getParameter("arrival"); 
            
            
            // STEP 4: REGISTRATION OF ORACLE DRIVER
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            
            // STEP 5: INSTANTIATING TH             E CONNECTION
            oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
            
            // STEP 6: INSTANTIATING THE STATEMENT OBJECT
            ops = (OraclePreparedStatement)oconn.prepareCall("SELECT * FROM AVAILABLETRAINS WHERE DEPSTATION=? AND ARRSTATION=? AND TRAVELDATE=?");
              ops.setString(1, departureStation);
              ops.setString(2, arrivalStation);
              ops.setString(3, date);
            // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
            ors = (OracleResultSet)ops.executeQuery();
            
            // STEP 8: GETTING THE COLUMNS INFORMATION(METADATA)
            orsmd = (OracleResultSetMetaData)ors.getMetaData();
            %>
            <body>

                

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
                    <li><a href="/Bookinggo/HomePage/Home.jsp" class="nav-link px-2 link">home</a></li>
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
                         
                      <li><a class="dropdown-item" href="/Bookinggo/profilepage/profile.html">my bookings</a></li>
                      <li><a class="dropdown-item" href="/Bookinggo/profilepage/profile.html">Profile</a></li>
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
            
            
            
            <%! String vname; %>
        <% HttpSession se=request.getSession(false);
        try {
            if(se!=null){
            vname = se.getAttribute("sname").toString();
            %>
                <script>
                    
//                var name =  <%=vname%>;
                document.getElementById('login').style.display = "none";
                       
                </script>
                
            <%   
            }
          } catch(Exception ex) { %>
          <script>
//            alert("you are not logged in!!!");
            document.getElementById('logout').style.display = "none";

            // alert("Redirecting for logging==>>");
            // location.href="http://localhost:8080/TestWeb/Pages/SessLogin.html";
          </script>
          <% } %>
                
                
                


<div class="container-fluid">



        <!--STEP 1: BASIC STRUCTURE OF A TABLE-->
        
        <div class="row justify-content-evenly" id="tablea">
            <div class="col-12">

        <table class="table table-hover mt-4 mb-4 table-bordered border-dark" id="result">
            <thead>
                <tr class="table-dark">
                    <%
                        // STEP 9: BRINGING THE TABLE HEADINGS
                        for(counter = 1; counter <= orsmd.getColumnCount(); counter ++)
                        {
                        %>
                        <th><%=orsmd.getColumnName(counter)%></th>
                        <%
                            }
                        %>
                     <th>ACTION</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // STEP 10: BRINGING ALL THE RECORDS AND DISPLAYING AS TABLE ROWS
                    while(ors.next() == true)
                    {
                    %>
                <tr>
                    <%
                       for(counter = 1; counter <= orsmd.getColumnCount(); counter ++)
                        {
                        %>
                        <th><%=ors.getString(counter)%></th>
                        <%
                            }
                        %>
                   <td>
    <form method="post" action="BookTrain.jsp"> <!-- Create a new JSP for booking -->
        <input type="hidden" name="trainId" value="<%=ors.getString("TRAINID")%>">
        <input type="hidden" name="nop" value="<%=nop%>">

        <button type="submit" class="btn btn-danger">Book</button>
    </form>
</td>

                </tr>
                <%
                    }
                    %>
            </tbody>
            <tfoot>
                <tr>
                
                </tr>
            </tfoot>
        </table>
                    <%
                        // STEP 11: CLOSING THE CONNECTIONS
                        ors.close();
                        ops.close();
                        oconn.close();
                        %>
                </div>
           </div>             
           
           
                
                
                
                
           
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
