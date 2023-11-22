<%-- 
    Document   : adminlogin
    Created on : Nov 23, 2023, 12:35:09 AM
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin Session</title>
</head>
<body>

<%
    // Get or create the HttpSession
    HttpSession admin = request.getSession(true);
    

//    String username = (String) session.getAttribute("username");
//    String userRole = (String) session.getAttribute("userRole");
    

    OracleConnection oconn;
    OraclePreparedStatement ops;
    OraclePreparedStatement opu;
    OraclePreparedStatement opt;    
    OracleResultSet ors;
    
    
    
    String adminname = request.getParameter("adminname");
    String password = request.getParameter("password");
    

    try {
             DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            
            // STEP 5: INSTANTIATING TH             E CONNECTION
            oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
             
            // STEP 6: INSTANTIATING THE STATEMENT OBJECT
              ops =(OraclePreparedStatement) oconn.prepareStatement("SELECT * FROM ADMINDETAILS where ADMINNAME=? and PASSWORD=?");
              ops.setString(1, adminname);
              ops.setString(2, password);
              ors = (OracleResultSet) ops.executeQuery();

          if(ors.next()) 
            {
                String email = ors.getString("EMAIL");
                int adminid = ors.getInt("ID");

                admin.setAttribute("aname",adminname);
                admin.setAttribute("adminid",adminid);
                admin.setAttribute("email",email);
                response.sendRedirect("http://localhost:8080/Bookinggo/AdminLogin/AdminProfile.jsp");
             

            }else 
            {
                response.sendRedirect("http://localhost:8080/Bookinggo/UserLogin/WrongPass.html");
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
