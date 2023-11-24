/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MinorProjectBackend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;

/**
 *
 * @author ryben(aditya)
 */
public class FeedBackLog extends HttpServlet {

    OracleConnection oconn;
        OraclePreparedStatement ost;
        OracleResultSet ors = null;
        String vEMAIL, vPASSWORD, vname;
        String vto, vfrom, vcc, vbcc, vsubject, vbody, sname,EMAIL,otp,content,id,name;
        int x;
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SessServe</title>");            
            out.println("</head>");
            out.println("<body>");

//            HttpSession se = request.getSession(false);
//            id = se.getAttribute("userid").toString();
             
            name = request.getParameter("name");
            vEMAIL = request.getParameter("email");
            content = request.getParameter("content");
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
  oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
  ost =(OraclePreparedStatement) oconn.prepareStatement("INSERT INTO FEEDLOG (NAME, EMAIL, CONTENT) VALUES (?, ?, ?)");
            ost.setString(1, name);
            ost.setString(2, vEMAIL);
            ost.setString(3, content);
             x =ost.executeUpdate();
            if(x>0) 
            {

                // PLS NOTE THAT U CAN IGNORE MANY LINES BELOW IF U R NOT DEALING WITH OTP OR MAIL SENDING
                vto=vEMAIL;
                vsubject="BOOKINGGO!!!";
                vbody="REGARDING YOUR FEEDBACK.";
                final String username ="bookinggominorproject@gmail.com";
                final String password = "naqcjyqrqnhkuqrk";
                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props,
              new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                    }
              });

            try {

                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(username));
                    message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(vto));
                    message.setSubject(vsubject);
                     
                     vbody += "\n WE THANK YOU FOR YOUR FEEDBACK, WE WILL GET BACK TO YOU ON THIS VERY SOON. ";

                     
                    message.setText(vbody);
                    Transport.send(message);
                    response.sendRedirect("http://localhost:8080/Bookinggo/Feedback/feedbackh.html");
                    
            } catch (MessagingException e) {

                     out.println("<h2 style='color:red'>"+e.getMessage()+"</h2>");
            }
                
            }   
            else 
            {
                response.sendRedirect("http://localhost:8080/Bookinggo/");
            }
            ost.close();
            oconn.close();
            out.println("</body>");
            out.println("</html>");
        }    catch (SQLException ex) {
                 Logger.getLogger(SessServe.class.getName()).log(Level.SEVERE, null, ex);
             }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}