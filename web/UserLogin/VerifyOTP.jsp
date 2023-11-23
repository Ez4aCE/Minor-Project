<%-- 
    Document   : VerifyOTP
    Created on : Nov 8, 2023, 7:22:08 PM
    Author     : ryben(aditya)
--%>

<%-- 
    Document   : VerifyOTP
    Created on : Nov 5, 2023, 12:53:53 AM
    Author     : ryben(aditya)
--%>
<%@page import ="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="verifyotp.css">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <style>
            body{
                    background-image: linear-gradient(#2C3E50,#FD746C);

            }
        </style>
        <script>
            function funClose()
            {
                if(window.parent) if(confirm("Closing window......") === true)  window.parent.window.close();    
                else if(confirm("Closing window......") === true) window.close();   
              }
         </script>     
    </head>
    <body style="background-color: antiquewhite">
         <%!
            String name, votp, vemail;
            int otp;
            %>
        <%
            HttpSession se = request.getSession(false);
            

            if(se!=null) 
            {
                name = se.getAttribute("sname").toString();
                votp = se.getAttribute("otp").toString();
                vemail = se.getAttribute("EMAIL").toString();  
            }
            else {
                 %>
                <script>
                    alert("Session was not created!!!");
                    alert("Redirecting for logging==>>");
                    location.href="/Minor-Project/UserLogin/UserLogin.html";
                </script>
                <% 
            }


            if(request.getParameter("bVerify")!=null)
            {
                if(request.getParameter("tbOTP").equals(votp))
                {
                %>
                <script>
                    alert("OTP verified successfully!!!");
                    location.href="http://localhost:8080/Bookinggo/";
                </script>
                <%
                }
                else
                {
                       %> 
                       <h3 style="color:red">Wrong OTP. Please try again!!!</h3>                 
                        <%
                }
            }
            else
            {
                   %>
                   
                   <h3 style="color: blueviolet">
                   Welcome <%=name%> . 
                   Your designated email is : <%=vemail%>. Check your inbox .
                   Please complete the login process.
                   <h3>
                    <%
            }   
            %> 
  <div class="main">
  <p class="sign" align="center">verification</p>
        <form name="frmOTP" method="POST" action="http://localhost:8080/Bookinggo/UserLogin/VerifyOTP.jsp">
    
            <span> Enter OTP</span>
            <input class="un " type="number" align="center" placeholder="OTP" name="tbOTP">
            <div class="buttons">
              <input type="submit" class="submit" align="center" name="bVerify" value="verify">
              <input type="reset" class="submit"  align="center" value="Clear">
             <button type="button" class="submit"  name="bClose" onclick="funClose();">Close</button>
            </div>     
        </form>
    </div>    
    </body>
    </html>
    
    
    