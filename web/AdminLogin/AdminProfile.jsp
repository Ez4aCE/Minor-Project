<%-- 
    Document   : adminlogin
    Created on : Nov 23, 2023, 12:35:09 AM
    Author     : ryben(aditya)
--%>

<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin profile</title>
</head>
<body>

<%  String adminname, email;
    HttpSession admin = request.getSession(false);
    try {
            if(admin!=null){
            adminname = admin.getAttribute("sname").toString();
            %>
                <script>
                    
                var name =  
                document.getElementById('login').style.display = "none";
                       
                </script>
                
            <%   
            }
          } catch(Exception ex) { %>
          <script>
            alert("you are not logged in!!!");
            document.getElementById('logout').style.display = "none";

             alert("Redirecting for logging==>>");
             location.href="http://localhost:8080/TestWeb/Pages/SessLogin.html";
          </script>
          <%
 

    adminname = admin.getAttribute("aname").toString();
    email = admin.getAttribute("email").toString();
%>

<h2>Welcome<%=adminname%></h2>
<p>Your role is</p>

</body>
</html>
