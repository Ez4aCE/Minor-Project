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
    
    String date, departureStation, arrivalStation, trainName, trainIds, nops, navaseats, totalseats ;
    int i, x, trainId,avaseat,totalseat,nop,navaseat, seatno ,trainPrice;
    
    String name = request.getParameter("username");
    String email = request.getParameter("email");
    String userid = request.getParameter("userid");
    date = request.getParameter("date");
    
    // Replace this line with the actual date format used in your database
SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");

// Retrieve the date string from the request
//String travelDateStr = request.getParameter("travelDate");

// Parse the date string to java.util.Date
Date travelDate = sdf.parse(date);

// Use the parsed date in your SQL query
ops.setDate(6, new java.sql.Date(travelDate.getTime()));

    
   
    
    
    // Retrieve payment information from the request
    String cardNumber = request.getParameter("cardNumber");

    // Retrieve the selected train ID from the request
    trainIds = request.getParameter("trainId");
    trainPrice = Integer.parseInt(request.getParameter("trainPrice"));

    
    nops = request.getParameter("nop");
    
    navaseats = request.getParameter("navaseat");

    totalseats = request.getParameter("totalseat");
//    totalseat = Integer.parseInt(totalseats);
    
    
    if (totalseats != null && !totalseats.isEmpty()) {
    totalseat = Integer.parseInt(totalseats);
} else {
        totalseat = 100;
    // Handle the case when totalseats is not provided
    // You might want to set a default value or show an error message
}
    
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
              ops = (OraclePreparedStatement)oconn.prepareCall("INSERT INTO BOOKEDTRAINS (ID, PASSNAME, CARDNUMBER, TRAINID, TRAVELDATE, FARE, SEATNO) VALUES (?, ?, ?, ?,?,?,?)");
              ops.setString(1, userid);
              ops.setString(2, name);
              ops.setString(3, cardNumber);
              ops.setString(4, trainIds);
              ops.setString(5, date);

              ops.setInt(6, trainPrice);
//              int assignedSeat = assignSeat(trainIds);
//              ops.setInt(4, assignedSeat);

// Retrieve already assigned seats
        opt = (OraclePreparedStatement)oconn.prepareCall("SELECT SEATNO FROM BOOKEDTRAINS WHERE TRAINID = ?");
        opt.setString(1, trainIds);

        ResultSet resultSet = opt.executeQuery();
        List<Integer> assignedSeats = new ArrayList<Integer>();
        while (resultSet.next()) {
            assignedSeats.add(resultSet.getInt("SEATNO"));
        }

        // Find the next available seat
        int assignedSeat = -1;
        for (i = 1; i <= totalseat; i++) {
            if (!assignedSeats.contains(i)) {
                assignedSeat = i;
                break;
            }
        }
        
        // Assigning seat number
        ops.setInt(7, assignedSeat);
        
            
            
            // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
            x = ops.executeUpdate();
          
           
            opu = (OraclePreparedStatement)oconn.prepareCall("UPDATE AVAILABLETRAINS SET AVASEAT = ? WHERE TRAINID = ?");
            opu.setString(1, navaseats);
            opu.setString(2, trainIds);
            
            int a = opu.executeUpdate();
            
            if(a>0){
                 response.sendRedirect("Booked.jsp");
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
