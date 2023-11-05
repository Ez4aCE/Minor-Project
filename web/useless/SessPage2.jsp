<%-- 
    Document   : SessPage2
    Created on : Nov 5, 2023, 1:06:16 AM
    Author     : ryben(aditya)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            String vname;
            %>
        <%
            HttpSession sess = request.getSession(false);
            try
{
            if(sess!=null) vname = sess.getAttribute("fname").toString();        
}
catch(Exception ex)
{
                %>
                <script>
                    alert("Session was not created!!!");
                    alert("Redirecting for logging==>>");
                    location.href="http://localhost:8080/Bookinggo/UserLogin/UserLogin.html";
                </script>
                <%  
}
            %> 
            <span style="align-content: flex-end">
            Welcome <%=vname%> . <a href="http://localhost:8080/TestWeb/SessLogout">Sign out</a>
        </span>
       
        <h1>THIS IS PAGE 2 AFTER LOGGING IN PROPERLY!</h1>
        <a href="http://localhost:8080/Bookinggo/HomePAGE/Home.jsp">Home</a>
        <a href="http://localhost:8080/Bookinggo/useless/SessPage2.jsp">Page 2</a>
        <a href="http://localhost:8080/Bookinggo/useless/SessPage3.jsp">Page 3</a>
        <a href="http://localhost:8080/Bookinggo/useless/SessPage4.jsp">Page 4</a>
    </body>
</html>
