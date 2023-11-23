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

        int x;

        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
       

        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

                // STEP 5: INSTANTIATING TH             E CONNECTION
                oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");

                // STEP 6: INSTANTIATING THE STATEMENT OBJECT
                  ops = (OraclePreparedStatement)oconn.prepareCall("UPDATE USERDETAILS SET PASSWORD=? WHERE EMAIL=?");
                  ops.setString(1, password);
                  ops.setString(2, email);
                  

                  x = ops.executeUpdate();

                if(x>0){
                    %>
                    <script>alert("password changed kindly log in again");</script>
                    <%
                        
                      HttpSession se = request.getSession(false);
                      se.invalidate();

                     response.sendRedirect("http://localhost:8080/Bookinggo/");
                } else {
                    out.println("<h2 style='color:brown'>error try again later...");
                }

            ops.close();
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
