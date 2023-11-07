<%-- 
    Document   : TrainDetails
    Created on : Nov 8, 2023, 2:14:19 AM
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
        <div> <%= request.getAttribute("trainDetails") %> div
            <h1>Train Details</h1>
    <p>Train ID: ${trainDetails.trainId}</p> 
    <p>Train Name: ${trainDetails.trainName}</p>
    <!-- Display other train details as needed -->
    </body>
</html>
