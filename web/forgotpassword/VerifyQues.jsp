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
         
         <<link rel="stylesheet" href="ValidE.css"/>
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

            <div class="main">
        <form name="frmSecurity" method="POST" action="http://localhost:8080/Bookinggo/forgotpassword/VerifyQues.jsp?EMAIL=<%=vEMAIL%>">

            <span class="new">QUESTION</span>
            <input class="un " type="text" align="center" placeholder="enter here" name="tbQUES" value="<%=vQUES%>">
            <span>ANSWER</span>
            <input class="un " type="password" align="center" placeholder="Confirm" name="tbANS">
                  <div class="buttons">
                  <input type="submit" class="submit" align="center" value="Save" name="bVerify">
                  <input type="reset" class="submit"  align="center" value="Clear">
                  <button type="button" class="submit"  name="bClose" onclick="funClose();">Close</button>
                  </div>
        </form>
            </div>       
    </body>
    </html>
    
    
    