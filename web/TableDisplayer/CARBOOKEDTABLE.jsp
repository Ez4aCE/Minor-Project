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
        <title>BOOKED CAR Record Displayer</title>
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
            ops = (OraclePreparedStatement)oconn.prepareCall("select * from BOOKEDCARS");
            
            // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
            ors = (OracleResultSet)ops.executeQuery();
            
            // STEP 8: GETTING THE COLUMNS INFORMATION(METADATA)
            orsmd = (OracleResultSetMetaData)ors.getMetaData();
            
            
            
            if(request.getParameter("bConfirm")!=null)
            {              
                   String ticketid = request.getParameter("ticketId");
                   opt =(OraclePreparedStatement) oconn.prepareStatement("DELETE FROM BOOKEDCARS WHERE TICKETID = ?");
                   opt.setString(1, ticketid);
                   int x = opt.executeUpdate();
                   
                   if(x>0){
                   response.sendRedirect("http://localhost:8080/Bookinggo/TableDisplayer/CARBOOKEDTABLE.jsp");
                    return;
                   }
                   opt.close();
                   oconn.close();
                     
            }
            else if (request.getParameter("bAdd") != null) {
                
        int id = Integer.parseInt(request.getParameter("id"));                
        String passname = request.getParameter("passname");
        int cardnumber = Integer.parseInt(request.getParameter("cardnumber"));
        int carid = Integer.parseInt(request.getParameter("carid"));        
        String date = request.getParameter("date");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dt = sdf.parse(date);
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
        date = sdf1.format(dt);
                    
                    
        
        
        int price =Integer.parseInt(request.getParameter("price"));
        int noseat = Integer.parseInt(request.getParameter("no.seat"));
        


        opt = (OraclePreparedStatement) oconn.prepareStatement("INSERT INTO BOOKEDCARS (TICKETID, ID, PASSNAME, CARDNUMBER, CARID, TRAVELDATE, FARE, NOSEAT) VALUES (TICKETIDC_SEQ.NEXTVAL,?, ?, ?, ?,?,?,?)");
        opt.setInt(1, id);
        opt.setString(2, passname);
        opt.setInt(3, cardnumber);
        opt.setInt(4, carid);
        opt.setString(5, date);
        opt.setInt(6, price);
        opt.setInt(7, noseat);
        
        

        int x = opt.executeUpdate();

        if (x > 0) {
            response.sendRedirect("http://localhost:8080/Bookinggo/TableDisplayer/CARBOOKEDTABLE.jsp");
            return;
        }
    }
            else
            {
                   %>
                   <h3 style="color: blueviolet">
                   below is BOOKED CAR details.
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
    <form method="post" action="http://localhost:8080/Bookinggo/TableDisplayer/CARBOOKEDTABLE.jsp"> 
        <input type="hidden" name="ticketId" value="<%=ors.getString("TICKETID")%>">
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
                <p>enter the records: (!!!  IMPORTANT - PLZ TRY NOT TO ENTER RECORDS FROM HERE UNLESS SOME DATABASE ERROR AND USER PAYMENT IS DONE BUT NOT SHOWING HIS/HER DATA IN DATABASE.... ELSE USE THE DIRECT PAYMENT PORTAL TO BOOK !!!!
                    YOU WILL NEED REAL ID,NAME,CARDNUMBER OF THAT USER AND CARID WITH THAT DATE AND PRICE OR ELSE IT CAN CAUSE ERRORS)<p> 
                <form method="post" action="http://localhost:8080/Bookinggo/TableDisplayer/CARBOOKEDTABLE.jsp">
                        <input type="number" name="id" placeholder="id" required>                        
                        <input type="text" name="passname" placeholder="PASS NAME" required>
                        <input type="number" name="cardnumber" placeholder="card number" required>
                        <input type="number" name="carid" placeholder="carid" required>
                        <input type="date" name="date" placeholder="New date" required>
                        <input type="number" name="price" placeholder="New price" required>
                        <input type="number" name="no.seat" placeholder="no. of seat" required>
          
                        
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


