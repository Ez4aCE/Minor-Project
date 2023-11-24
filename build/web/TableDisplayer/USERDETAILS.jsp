<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER Record Displayer</title>
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
            ops = (OraclePreparedStatement)oconn.prepareCall("select * from USERDETAILS");
            
            // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
            ors = (OracleResultSet)ops.executeQuery();
            
            // STEP 8: GETTING THE COLUMNS INFORMATION(METADATA)
            orsmd = (OracleResultSetMetaData)ors.getMetaData();
            
            
            
            if(request.getParameter("bConfirm")!=null)
            {              
                   String id = request.getParameter("id");
                   opt =(OraclePreparedStatement) oconn.prepareStatement("DELETE FROM USERDETAILS WHERE ID=?");
                   opt.setString(1, id);
                   int x = opt.executeUpdate();
                   
                   if(x>0){
                   response.sendRedirect("http://localhost:8080/Bookinggo/TableDisplayer/USERDETAILS.jsp");
                    return;
                   }
                   opt.close();
                   oconn.close();
                     
            }
            
            else
            {
                   %>
                   <h3 style="color: blueviolet">
                   below is feedback details.
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
       
                       <th>ACTION</th>
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
    <form method="post" action="http://localhost:8080/Bookinggo/TableDisplayer/USERDETAILS.jsp"> 
        <input type="hidden" name="id" value="<%=ors.getString("ID")%>">
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
