<%-- 
    Document   : VerifyOTP
    Created on : Nov 5, 2023, 12:53:53 AM
    Author     : ryben(aditya)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            String vname, votp, vemail;
            %>
        <%
            HttpSession sess = request.getSession(false);
            try
{
            if(sess!=null) 
            {
                vname = sess.getAttribute("fname").toString();
                votp = sess.getAttribute("otp").toString();
                vemail = sess.getAttribute("email").toString();
            }
}
catch(Exception ex)
{
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
                    location.href="http://localhost:8080/TestWeb/PageServes/HomePage.jsp";
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
                   Welcome <%=vname%> . 
                   Your designated email is : <%=vemail%>. Check your inbox .
                   Please complete the login process.
                   <a href="http://localhost:8080/TestWeb/SessLogout">Sign out</a>
                   <h3>
                    <%
            }   
            %> 
        <h2>THIS IS OTP VERIFICATION PAGE BEFORE LOGGING IN COMPLETELY!</h2>
        <form name="frmOTP" method="POST" action="http://localhost:8080/TestWeb/PageServes/VerifyOTP.jsp">
        <div>
            <table border="1">
                <thead>
                    <tr><th colspan="2">OTP VERIFICATION FORM</th></tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ENTER OTP</td>
                        <td><input type="number" size="4" name="tbOTP" required/></td></tr>    
                    <tr>
                        <td>
                            <button type="submit" name="bVerify">Verify</button>
                        </td>
                        <td>
                            <button type="reset" name="bReset">Reset</button>
                            <button type="button" name="bClose" onclick="funClose();">Close</button>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr><th colspan="2">&copy;Techno India Technologies ; Limited &reg;</th></tr>
                </tfoot>
            </table>
        </div>
            </form>
    </body>
</html>
