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
        <title>TRAIN Record Displayer</title>
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
            ops = (OraclePreparedStatement)oconn.prepareCall("select * from AVAILABLETRAINS");
            
            // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
            ors = (OracleResultSet)ops.executeQuery();
            
            // STEP 8: GETTING THE COLUMNS INFORMATION(METADATA)
            orsmd = (OracleResultSetMetaData)ors.getMetaData();
            
            
            
            if(request.getParameter("bConfirm")!=null)
            {              
                   String trainid = request.getParameter("trainId");
                   opt =(OraclePreparedStatement) oconn.prepareStatement("DELETE FROM AVAILABLETRAINS WHERE TRAINID=?");
                   opt.setString(1, trainid);
                   int x = opt.executeUpdate();
                   
                   if(x>0){
                   response.sendRedirect("http://localhost:8080/Bookinggo/TableDisplayer/train.jsp");
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

//        String dateString = request.getParameter("date");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Date date = sdf.parse(dateString);
//        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
//        String formattedDate = sdf1.format(date);
                    
                    
        String ltime = request.getParameter("ltime");
        String atime = request.getParameter("atime");
        
        
        int price =Integer.parseInt(request.getParameter("price"));
        String avaseat = request.getParameter("avaseat");
        String totalseat = request.getParameter("totalseat");
        

        // Add other fields as needed

        opt = (OraclePreparedStatement) oconn.prepareStatement("INSERT INTO AVAILABLETRAINS (TRAINID,TRAINNAME, DEPSTATION, ARRSTATION,TRAVELDATE,LTIME,ATIME,PRICE,AVASEAT,TOTALSEAT) VALUES (?,?,?, ?, ?, TO_TIMESTAMP(?, 'HH24:MI'),TO_TIMESTAMP(?, 'HH24:MI'), ?, ?, ?)");
        opt.setInt(1, trainid);        
        opt.setString(2, newTrainName);
        opt.setString(3, newDepStation);
        opt.setString(4, arrs);
        opt.setString(5, date);
        opt.setString(6, ltime);
        opt.setString(7, atime);
        opt.setInt(8, price);
        opt.setString(9, avaseat);
        opt.setString(10, totalseat);
        
        

        int x = opt.executeUpdate();

        if (x > 0) {
            response.sendRedirect("http://localhost:8080/Bookinggo/TableDisplayer/train.jsp");
            return;
        }
    }
            else
            {
                   %>
                   <h3 style="color: blueviolet">
                   below is train details.
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
    <form method="post" action="http://localhost:8080/Bookinggo/TableDisplayer/train.jsp"> 
        <input type="hidden" name="trainId" value="<%=ors.getString("TRAINID")%>">
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
                <form method="post" action="http://localhost:8080/Bookinggo/TableDisplayer/train.jsp">
                        <input type="number" name="trainid" placeholder="New Train id" required>                        
                        <input type="text" name="newTrainName" placeholder="New Train Name" required>
                        <input type="text" name="newDepStation" placeholder="New Departure Station" required>
                        <input type="text" name="arrs" placeholder="New arr Station" required>
                        <input type="date" name="date" placeholder="New  date" required>
                        <input type="text" name="ltime" placeholder="New ltime" required>
                        <input type="text" name="atime" placeholder="New atime" required>
                        <input type="number" name="price" placeholder="New price" required>
                        <input type="number" name="avaseat" placeholder="New avaseat" required>
                        <input type="number" name="totalseat" placeholder="New totalseat" required>
          
                        
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


