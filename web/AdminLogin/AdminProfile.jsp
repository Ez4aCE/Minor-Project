<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>BookingGo admin</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

      <!-- bootstrap icon  -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
      
      <style>
          body{
                  background-image: linear-gradient(#2C3E50,#FD746C);
          }
          
      </style>

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

<script>
    function redirectToUserTable() {
        window.open('/Bookinggo/TableDisplayer/USERDETAILS.jsp');
    }
</script>
<script>
    function redirectTotrain() {
        window.open('/Bookinggo/TableDisplayer/newjsp.jsp');
    }
</script>
<script>
    function redirectTocar() {
        window.open('/Bookinggo/TableDisplayer/CARBOOKEDTABLE.jsp');
    }
</script>
<script>
    function redirectTotraind() {
        window.open('/Bookinggo/TableDisplayer/TRAINDETAILS.jsp');
    }
</script>
<script>
    function redirectTocard() {
        window.open('/Bookinggo/TableDisplayer/CARDETAILS.jsp');
    }
</script>
<script>
    function redirectTofeedback() {
        window.open('/Bookinggo/TableDisplayer/FEEDBACKLOG.jsp');
    }
</script>
<script>
    function logout() {
        window.location.href ='http://localhost:8080/Bookinggo/AdminLogOut';
    }
</script>




    
<div class="container my-5">
  <div class="p-5 text-center bg-body-tertiary rounded-3">
      
    <h1 class="text-body-emphasis">ADMIN PAGE FOR BOOKINGGO</h1>
    <p class="col-lg-8 mx-auto fs-5 text-muted">
     Welcome <%= name %> below are some function for admin to access.
    </p>
    <div class="d-inline-flex gap-2 mb-5" style="display:fex;flex-wrap: wrap;">
        
      <button class="d-inline-flex align-items-center btn btn-primary btn-lg px-4 rounded-pill" type="button" onclick="redirectToUserTable()">
        usertable
      </button>
        
<button class="d-inline-flex align-items-center btn btn-primary btn-lg px-4 rounded-pill" type="button" onclick="redirectTotrain()">
        booked trains
      </button>
        
<button class="d-inline-flex align-items-center btn btn-primary btn-lg px-4 rounded-pill" type="button" onclick="redirectTocar()">
        booked cars
      </button>
        
        <button class="d-inline-flex align-items-center btn btn-primary btn-lg px-4 rounded-pill" type="button" onclick="redirectTotraind()">
         train details   
      </button>
        
        <button class="d-inline-flex align-items-center btn btn-primary btn-lg px-4 rounded-pill" type="button" onclick="redirectTocard()">
         car details
      </button>
        
        <button class="d-inline-flex align-items-center btn btn-primary btn-lg px-4 rounded-pill" type="button" onclick="redirectTofeedback()">
         Feedback details
      </button>
        
        <button class="d-inline-flex align-items-center btn btn-danger btn-lg px-4 rounded-pill" type="button" onclick="logout()">
        LOG OUT
      </button>        
      
    </div>
  </div>
</div>    
    
    
    
   
<%
    }
%>


<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
