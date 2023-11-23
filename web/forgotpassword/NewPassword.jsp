<%-- 
    Document   : NewPassword
    Created on : Nov 5, 2023, 1:37:44 AM
    Author     : ryben(aditya)
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Reset Page</title>

        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="newpass.css">
    </head>
    <body>
         <%!
            String vemail, vpass;
            OracleConnection oconn;
            OraclePreparedStatement ost;
            HttpSession se;
          
            %>
            <%
            if(request.getParameter("bConfirm")!=null)
            {
                if(request.getParameter("tpass").equals(request.getParameter("cpass")))
                {
                   se = request.getSession(false);
                   vpass = request.getParameter("tpass");
                   vemail = se.getAttribute("sessemail").toString();
                   DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                   oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
                   ost =(OraclePreparedStatement) oconn.prepareStatement("update USERDETAILS set  PASSWORD=? where EMAIL=?");
                   ost.setString(1, vpass);
                   ost.setString(2, vemail);
                   int x = ost.executeUpdate();
                   ost.close();
                   oconn.close();
                   se.invalidate();
                     %>
                    <script>
                    alert("Password reset successfully!!! You can now login using your new password");
                    alert("Redirecting for logging==>>");
                    location.href="http://localhost:8080/Bookinggo/UserLogin/UserLogin.html";
                </script>
                <%  
                }
                else
                {
                       %> 
                       <h3 style="color:red">Password do not match!!!. Please try again!!!</h3>                 
                        <%
                }
            }
            else
            {
                   vemail = request.getParameter("EMAIL");
                   se = request.getSession(true);
                   se.setAttribute("sessemail", vemail);
                   %>
                   <h3 style="color: blueviolet">
                   Please verify your security credentials.
                   </h3>
                    <%
                   
            }   
            %>

     <div class="main">
            <p class="sign" align="center">RESET YOUR PASSWORD</p>
            <form method="POST" action="http://localhost:8080/Bookinggo/forgotpassword/NewPassword.jsp" >
            <span class="new">NEW PASSWORD</span>
          <input class="un " type="password" align="center" placeholder="enter here" name="tpass">
            <span>CONFIRM PASSWORD</span>
          <input class="un " type="password" align="center" placeholder="Confirm" name="cpass">
                <div class="buttons">
                <input type="submit" class="submit" align="center" value="Save" name="bConfirm">
                <input type="reset" class="submit"  align="center" value="Clear">
                <button type="button" class="submit"  name="bClose" onclick="window.close();">Close</button>
                </div>
                        
            </form>     
    </div>
        
    </body>
    </html>
    