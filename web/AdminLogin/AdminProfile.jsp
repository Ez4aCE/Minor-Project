<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Profile</title>
</head>
<body>

<%
    String name = null, email = null;
    HttpSession admin = request.getSession(false);

    if (admin != null) {
        try {
            name = (String) admin.getAttribute("aname");
            email = (String) admin.getAttribute("email");
        } catch (Exception ex) {
            // Handle any exceptions here (e.g., logging)
        }
    } else { %>
        <script>
            alert("You are not logged in!!!");
            location.href = "http://localhost:8080/Bookinggo/AdminLogin/Adminlogin.html";
        </script>
<% } %>

<%
    if (name != null) { // Display content only if the user is logged in
%>
    <h2>Welcome <%= name %> </h2>
    <p>Your role is</p>
<%
    }
%>

</body>
</html>
