<%-- 
    Document   : SessPage1
    Created on : Nov 5, 2023, 1:03:51 AM
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
            if(sess==null)
            {
                %>
                <script>
                    alert("Logged out successfully!!!");
                    location.href="http://localhost:8080/TestWeb/Pages/SessLogin.html";
                </script>
                <%
            }
            else
            {
                vname = sess.getAttribute("fname").toString();
            }
            %> 
            <span style="align-content: flex-end">
            Welcome <%=vname%> . <a href="http://localhost:8080/TestWeb/Pages/SignOut.html">Sign out</a>
        </span>
       
        <h1>THIS IS PAGE 2 AFTER LOGGING IN PROPERLY!</h1>
        <a href="http://localhost:8080/TestWeb/PageServes/HomePage.jsp">Home</a>
        <a href="http://localhost:8080/TestWeb/PageServes/SessPage2.jsp">Page 2</a>
        <a href="http://localhost:8080/TestWeb/PageServes/SessPage3.jsp">Page 3</a>
        <a href="http://localhost:8080/TestWeb/PageServes/SessPage4.jsp">Page 4</a>
    </body>
</html>