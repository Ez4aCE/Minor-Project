    <%-- 
        Document   : ProcessPayment
        Created on : Nov 21, 2023, 9:30:02 AM
        Author     : ryben(aditya)
    --%>
    <%@page import="java.sql.DriverManager"%>
    <%@page import="oracle.jdbc.OraclePreparedStatement"%>
    <%@page import="oracle.jdbc.OracleResultSetMetaData"%>
    <%@page import="oracle.jdbc.OracleResultSet"%>
    <%@page import="oracle.jdbc.OracleConnection"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.*"%>
    <%@page import="java.util.List"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="java.sql.*"%>
    <%@page import ="javax.servlet.http.HttpSession" %>
    <%@page import= "java.util.Date" %>
    <%@page import= "java.text.SimpleDateFormat" %>

    <%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!DOCTYPE html>
    <html>
    <head>
        <!-- Head content -->
    </head>
    <body>

    <%
        OracleConnection oconn;
        OraclePreparedStatement ops;
        OraclePreparedStatement opu;
        OraclePreparedStatement opt;    
        OracleResultSet ors;

        String date, departureStation, arrivalStation, trainName, carId, nops, navaseats, totalseats ;
        int i, x, trainId,avaseat,avacars,nop,navaseat, seatno ,rentPrice;

        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String userid = request.getParameter("userid");
        date = request.getParameter("date");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date dt = sdf.parse(date);
                    SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
                    date = sdf1.format(dt);


        // Retrieve payment information from the request
        String cardNumber = request.getParameter("cardNumber");

        // Retrieve the selected train ID from the request
        carId = request.getParameter("carId");
        rentPrice = Integer.parseInt(request.getParameter("rentPrice"));


        nops = request.getParameter("nop");

        String navacars = request.getParameter("navacars");

        String noseat = request.getParameter("noseat");

    //    avacars = request.getParameter("avacars");
    //    totalseat = Integer.parseInt(totalseats);


    //    if (avacars != null && !avacars.isEmpty()) {
    //    avacars = Integer.parseInt(avacars);
    //} else {
    //        avacars = 100;
    //    // Handle the case when totalseats is not provided
    //    // You might want to set a default value or show an error message
    //}

    //    int assignseat;
    //    
    //    for( i = Integer.parseInt(nops); i <= Integer.parseInt(totalseats); i++){
    //        
    //    }

        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

                // STEP 5: INSTANTIATING TH             E CONNECTION
                oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");

                // STEP 6: INSTANTIATING THE STATEMENT OBJECT
                  ops = (OraclePreparedStatement)oconn.prepareCall("INSERT INTO BOOKEDCARS (TICKETID, ID, PASSNAME, CARDNUMBER, CARID, TRAVELDATE, FARE, NOSEAT) VALUES (TICKETIDC_SEQ.NEXTVAL,?, ?, ?, ?,?,?,?)");
                  ops.setString(1, userid);
                  ops.setString(2, name);
                  ops.setString(3, cardNumber);
                  ops.setString(4, carId);
                  ops.setString(5, date);
                  ops.setInt(6, rentPrice);
                  ops.setString(7, noseat);

                  x = ops.executeUpdate();


                opu = (OraclePreparedStatement)oconn.prepareCall("UPDATE AVAILABLECAR SET AVACARS = ? WHERE CARID = ?");
                opu.setString(1, navacars);
                opu.setString(2, carId);

                int a = opu.executeUpdate();

                if(a>0){
                     response.sendRedirect("http://localhost:8080/Bookinggo/HomePage/Booked.jsp");
                } else {
                    out.println("<h2 style='color:brown'>error tey again later...");
                }

            ops.close();
            opu.close();
            oconn.close();


        } catch (SQLException e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        out.println("<p>Stack Trace: " + sw.toString() + "</p>");
        out.println("<p>Error processing payment. Please try again. Check the console and logs for details.</p>");
        } 





    %>

    </body>
    </html>
