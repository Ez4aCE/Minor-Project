<%-- 
    Document   : Profile
    Created on : Nov 22, 2023, 9:02:39 AM
    Author     : ryben(aditya)
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page import ="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="profilecss.css">
    
    
</head>

<%
        // STEP 3: DECLARING OBJECTS AND VARIABLES
            OracleConnection oconn;
            OraclePreparedStatement ops;
            OracleResultSet ors;
            OracleResultSetMetaData orsmd;
            int counter, reccounter, colcounter;
            String date, departureStation, arrivalStation, trainName,nop ;
            int id,trainId,trainPrice;
        %>
        
      <%! String name,email; %>
        <% HttpSession se=request.getSession(false);
        try {
            if(se!=null){
            name = se.getAttribute("sname").toString();
            email = se.getAttribute("EMAIL").toString();   
            }
          } catch(Exception ex) { %>
          <script>
            alert("you are not logged in!!!");

             location.href="http://localhost:8080/Bookinggo/Userlogin/UserLogin.html";
          </script>
          <% } %>  
        
        
        
        
        
        <%
            
            departureStation = request.getParameter("departure");
            date = request.getParameter("date");
            nop = request.getParameter("nop");
                     
            arrivalStation = request.getParameter("arrival"); 
            String ids = "1";
            
            // STEP 4: REGISTRATION OF ORACLE DRIVER
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            
            // STEP 5: INSTANTIATING TH             E CONNECTION
            oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
            
            // STEP 6: INSTANTIATING THE STATEMENT OBJECT
            ops = (OraclePreparedStatement)oconn.prepareCall("SELECT * FROM BOOKEDTRAINS WHERE ID=?");
            ops.setString(1, ids);
              
            // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
            ors = (OracleResultSet)ops.executeQuery();
            
            // STEP 8: GETTING THE COLUMNS INFORMATION(METADATA)
            orsmd = (OracleResultSetMetaData)ors.getMetaData();
            %>

<body>
    
    <nav>
        <div class="topnav">
            <img src="/image/booking-go-logo-PhotoRoom.png-PhotoRoom.png" alt="" style="height: 40px; margin-top: 5px;">
            <a href="/Bookinggo/">home</a>
            <a href="/Bookinggo/"> book</a>
            <a href="#">Help </a>
            <a href="#"> contact us</a>

            <input type="text" placeholder="Search..">

          
        </div>

    </nav>
          
         
        
<div class="con">


<div class="flex">

        <div class="pro">
            <img src="image/profile-user.png" alt="" class="respon">
        </div>


        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'profile')">profile</button>
            <button class="tablinks" onclick="openCity(event, 'history')">my bookings</button>
            <button class="tablinks" onclick="openCity(event, 'security')">security</button>
            <button class="tablinks" onclick="openCity(event, 'logout')">log out</button>
        </div>

</div>
    
    


<div class="result">
    <div id="profile" class="tabcontent">
        <h3>profile</h3>
        
        
        
        
        
        
        
        
        
    </div>

    <div id="history" hidden class="tabcontent">
        
        <h3>MY BOOKING</h3>
       
        

        <table class="table table-hover table-bordered border-dark" id="result">
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
                     <th></th>
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
                   <td></td>

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
                    
        
        
        
    </div>

    <div id="security" hidden class="tabcontent">
        <h3>To change password</h3>
        
        
        <form action="/Bookinggo/profilepage/changepassword.jsp" action="POST">
            
            <h4> fill the form</h4> <br><br>
             <span>enter email</span> <br>
             <input type="text" value="<%=email%>" name="email" > <br><br>
             <span>enter password</span> <br>
             <input type="password" value="" placeholder="enter new password" name="password"> <br><br><br>
            <button type="submit">click here</button>
        </form>
        
        
        
        
    </div>

    <div id="logout" hidden class="tabcontent">
        <h3>CLICK BELOW TO LOGOUT </h3>
        
       
        
        <form action="http://localhost:8080/Bookinggo/SessLogOut" method="post">
            <button type="submit">click here</button>
        </form>


    </div>
</div>
            
 </div>
            
           

    <script src="profile.js"></script>
    <%
                        // STEP 11: CLOSING THE CONNECTIONS
                        ors.close();
                        ops.close();
                        oconn.close();
                        %>

</body>

</html>
