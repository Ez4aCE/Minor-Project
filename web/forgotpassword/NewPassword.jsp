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
            HttpSession sess;
          
            %>
            <%
            if(request.getParameter("bConfirm")!=null)
            {
                if(request.getParameter("tpass").equals(request.getParameter("cpass")))
                {
                   sess = request.getSession(false);
                   vpass = request.getParameter("tpass");
                   vemail = sess.getAttribute("sessemail").toString();
                   DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                   oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
                   ost =(OraclePreparedStatement) oconn.prepareStatement("update USERDETAILS set  PASSWORD=? where EMAIL=?");
                   ost.setString(1, vpass);
                   ost.setString(2, vemail);
                   int x = ost.executeUpdate();
                   ost.close();
                   oconn.close();
                   sess.invalidate();
                     %>
                    <script>
                    alert("Password reset successfully!!! You can now login using your new password");
                    alert("Redirecting for logging==>>");
                    location.href="http://localhost:8080/UserLogin/UserLogin.html";
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
                   vemail = request.getParameter("pemail");
                   sess = request.getSession(true);
                   sess.setAttribute("sessemail", vemail);
                   %>
                   <h3 style="color: blueviolet">
                   Please verify your security credentials.
                   </h3>
                    <%
                   
            }   
            %>

     <div class="main">
            <p class="sign" align="center">RESET YOUR PASSWORD</p>
            <form class="form1"  method="POST" action="/Bookinggo/ValidateEmails">
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
    <!-- <div>
        <br/><br/><br/><br/>
        <table border="1" style="font-size: 100%; color:whitesmoke; background-color: black">
            <thead>
                <tr><th colspan="2">RESET YOUR PASSWORD</th></tr>
            </thead>
            <tbody>
                <tr>
                    <td>NEW PASSWORD</td>
                    <td><input type="password" name="tpass" id="tpass" required></td>
                </tr>
                <tr>
                    <td>CONFIRM PASSWORD</td>
                    <td><input type="password" name="cpass" id="cpass" required></td>
                </tr>
                <tr><td><button type="submit" style="font-size: 50%" name="bConfirm">Confirm</button></td>
                    <td>
                        <button type="reset" style="font-size: 50%" name="bClear">Clear</button>
                    </td>
            </tbody>
            <tfoot>
                <th  colspan="2"> &copy; TECHNO INDIA TECHNOLOGIES &reg;</th>
            </tfoot>
        </table>
    </div> -->