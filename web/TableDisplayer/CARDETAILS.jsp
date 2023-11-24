<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page import= "java.util.Date" %>
<%@page import= "java.text.SimpleDateFormat" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CAR Record Displayer</title>
        <!--STEP 2: ADDING A INTERNAL STYLE FOR TABLE-->
         <style>
                table, tr, td
                {
                    padding: 10px;
                    border: 5px solid yellow;
                    border-collapse: collapse
                }
                th
                {
                    padding: 10px;
                    border: 5px solid greenyellow;
                    border-collapse: collapse;
                    color: chartreuse
                }
                p{
                    color: white;
                }
            </style>
    </head>
    <%!
        // STEP 3: DECLARING OBJECTS AND VARIABLES
            OracleConnection oconn;
            OraclePreparedStatement ops;
            OraclePreparedStatement opt;

            OracleResultSet ors;
            OracleResultSetMetaData orsmd;
            int counter, reccounter, colcounter;
        %>
        <%
            // STEP 4: REGISTRATION OF ORACLE DRIVER
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            
            // STEP 5: INSTANTIATING TH             E CONNECTION
            oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
            
            // STEP 6: INSTANTIATING THE STATEMENT OBJECT
            ops = (OraclePreparedStatement)oconn.prepareCall("select * from AVAILABLECAR");
            
            // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
            ors = (OracleResultSet)ops.executeQuery();
            
            // STEP 8: GETTING THE COLUMNS INFORMATION(METADATA)
            orsmd = (OracleResultSetMetaData)ors.getMetaData();
            
            
            
            if(request.getParameter("bConfirm")!=null)
            {              
                   String carid = request.getParameter("carId");
                   opt =(OraclePreparedStatement) oconn.prepareStatement("DELETE FROM AVAILABLECAR WHERE CARID = ?");
                   opt.setString(1, carid);
                   int x = opt.executeUpdate();
                   
                   if(x>0){
                   response.sendRedirect("http://localhost:8080/Bookinggo/TableDisplayer/CARDETAILS.jsp");
                    return;
                   }
                   opt.close();
                   oconn.close();
                     
            }
            else if (request.getParameter("bAdd") != null) {
                
        int trainid = Integer.parseInt(request.getParameter("trainid"));                
        String newTrainName = request.getParameter("newTrainName");
        String newDepStation = request.getParameter("newDepStation");
        String arrs = request.getParameter("arrs");
        String date = request.getParameter("date");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dt = sdf.parse(date);
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
        date = sdf1.format(dt);
                    
                    
        int esttime = Integer.parseInt(request.getParameter("ltime"));
        
        
        int price =Integer.parseInt(request.getParameter("price"));
        String avaseat = request.getParameter("avaseat");
        String totalseat = request.getParameter("totalseat");
        

        // Add other fields as needed

        opt = (OraclePreparedStatement) oconn.prepareStatement("INSERT INTO AVAILABLECAR (CARID,CARMODEL, YOURLOC, DESTINATION,TRAVELDATE,EST_TIME_IN_HR,PRICE,AVACARS,NOSEAT) VALUES (?,?,?, ?, ?, ?, ?, ?, ?)");
        opt.setInt(1, trainid);        
        opt.setString(2, newTrainName);
        opt.setString(3, newDepStation);
        opt.setString(4, arrs);
        opt.setString(5, date);
        opt.setInt(6, esttime);
        opt.setInt(7, price);
        opt.setString(8, avaseat);
        opt.setString(9, totalseat);
        
        

        int x = opt.executeUpdate();

        if (x > 0) {
            response.sendRedirect("http://localhost:8080/Bookinggo/TableDisplayer/CARDETAILS.jsp");
            return;
        }
    }
            else
            {
                   %>
                   <h3 style="color: blueviolet">
                   below is CAR details.
                   </h3>
                    <%
                   
            }   


            %>
    <body style="background-color: black">
        <!--STEP 1: BASIC STRUCTURE OF A TABLE-->
        <table>
            <thead>
                <tr>
                    <%
                        // STEP 9: BRINGING THE TABLE HEADINGS
                        for(counter = 1; counter <= orsmd.getColumnCount(); counter ++)
                        {
                        %>
                        <th><%=orsmd.getColumnName(counter)%></th>
                        <%
                            }
                        %>
                </tr>
            </thead>
            <tbody>
                <%
                    // STEP 10: BRINGING ALL THE RECORDS AND DISPLAYING AS TABLE ROWS
                    while(ors.next() == true)
                    {
                    %>
                <tr>
                    <%
                       for(counter = 1; counter <= orsmd.getColumnCount(); counter ++)
                        {
                        %>
                        <th><%=ors.getString(counter)%></th>
                        <%
                            }
                        %>
                        <td>
    <form method="post" action="http://localhost:8080/Bookinggo/TableDisplayer/CARDETAILS.jsp"> 
        <input type="hidden" name="carId" value="<%=ors.getString("CARID")%>">
        <button type="submit" class="btn btn-danger" name="bConfirm">delete</button>
    </form>
</td>
                </tr>
                <%
                    }
                    %>
            </tbody>
            <tfoot>
                <tr>
            <td colspan="<%= orsmd.getColumnCount() + 1 %>">
                <p>enter the records:<p> 
                <form method="post" action="http://localhost:8080/Bookinggo/TableDisplayer/CARDETAILS.jsp">
                        <input type="number" name="trainid" placeholder="New car id" required>                        
                        <input type="text" name="newTrainName" placeholder="New car model" required>
                        <input type="text" name="newDepStation" placeholder="your location" required>
                        <input type="text" name="arrs" placeholder="destination" required>
                        <input type="date" name="date" placeholder="New date" required>
                        <input type="number" name="ltime" placeholder="est time" required>
                        <input type="number" name="price" placeholder="New price" required>
                        <input type="number" name="avaseat" placeholder="New avacars" required>
                        <input type="number" name="totalseat" placeholder="New no.seat" required>
          
                        
                        <button type="submit" class="btn btn-success" name="bAdd">Add</button>
                    </form>
                </td>                    
                </tr>
            </tfoot>
        </table>
            
            
                    <%
                        // STEP 11: CLOSING THE CONNECTIONS
                        ors.close();
                        ops.close();
                        oconn.close();
                        %>
    </body>
</html>


