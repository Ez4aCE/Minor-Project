<%-- 
    Document   : VerifyQues
    Created on : Nov 5, 2023, 1:36:03 AM
    Author     : ryben(aditya)
--%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function funClose()
            {
                if(window.parent) if(confirm("Closing window......") === true)  window.parent.window.close();    
                else if(confirm("Closing window......") === true) window.close();   
              }
         </script>     
    </head>
    <body style="background-color: antiquewhite">
         <%!
            String vEMAIL, vQUES, vANS;
            OracleConnection oconn;
          OraclePreparedStatement ost;
          OracleResultSet ors = null;
            %>
        <%
            vEMAIL = request.getParameter("EMAIL");
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
           ost =(OraclePreparedStatement) oconn.prepareStatement("SELECT * FROM USERDETAILS where EMAIL=?");
            ost.setString(1, vEMAIL);
            ors = (OracleResultSet) ost.executeQuery();
            if(ors.next()) 
            {
                vQUES = ors.getString("QUES"); //SQUES IS D COL NAME FOR SECURITY QUES IN UR DB
                vANS = ors.getString("ANS");
            }
            else
            {
                 %>
                <script>
                    alert("Do not try any malaligned URL. \n You can only use  the link received in mail ");
                    window.close();
                </script>
                <%
            }
            ost.close();
            oconn.close();
            if(request.getParameter("bVerify")!=null)
            {
                if(request.getParameter("tbANS").equals(vANS))
                {
                %>
                <script>
                    alert("Security Answer verified successfully!!!");
                    location.href="http://localhost:8080/Bookinggo/forgotpassword/NewPassword.jsp?EMAIL=<%=vEMAIL%>";
                </script>
                <%
                }
                else
                {
                       %> 
                       <h3 style="color:red">Wrong Answer. Please try again!!!</h3>                 
                        <%
                }
            }
            else
            {
                   %>
                   
                   <h3 style="color: blueviolet">
                   Please verify your security credentials.
                    <h3>
                    <%
            }   
            %> 
        <h2>THIS IS SECURITY QUESTION AND ANSWER VERIFICATION PAGE!</h2>
        <form name="frmSecurity" method="POST" action="http://localhost:8080/Bookinggo/forgotpassword/VerifyQues.jsp?EMAIL=<%=vEMAIL%>">
        <div>
            <table border="1">
                <thead>
                    <tr><th colspan="2">SECURITY VERIFICATION FORM</th></tr>
                </thead>
                <tbody>
                    <tr>
                        <td>QUESTION</td>
                        <td><input type="text" size="30" name="tbQUES" value="<%=vQUES%>" readonly /></td>
                    </tr>
                    <tr>
                        <td>ANSWER</td>
                        <td><input type="text" size="30" name="tbANS" required/></td>
                    </tr>
                    
                    <tr>
                        <td>
                            <button type="submit" name="bVerify">Verify</button>
                        </td>
                        <td>
                            <button type="reset" name="bReset">Reset</button>
                            <button type="button" name="bClose" onclick="funClose();">Close</button>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr><th colspan="2">&copy;Techno India Technologies ; Limited &reg;</th></tr>
                </tfoot>
            </table>
        </div>
            </form>
    </body>
</html>

