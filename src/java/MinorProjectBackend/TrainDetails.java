/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MinorProjectBackend;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

        
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;        
import oracle.jdbc.OracleResultSet;

/**
 *
 * @author ryben(aditya)
 */
public class TrainDetails extends HttpServlet {
    
    
    OracleConnection oconn;
    OraclePreparedStatement ost;
    OracleResultSet ors = null;
    String date, departureStation, arrivalStation, trainDetails;
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         date = request.getParameter("date");
         departureStation = request.getParameter("departure");
         arrivalStation = request.getParameter("arrival");

         trainDetails = fetchTrainDetails(date, departureStation, arrivalStation);

        request.setAttribute("trainDetails", trainDetails);
        request.getRequestDispatcher("/Bookinggo/TicketSearch/TrainDetails.jsp").forward(request, response);
   
        
    }
    
    
    private String fetchTrainDetails(String date, String departureStation, String arrivalStation) {
        String result = "No train details found for the provided input.";

        try  {
            
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
           ost =(OraclePreparedStatement) oconn.prepareStatement("SELECT * FROM AVAILABLETRAINS WHERE LTIME = ? AND DEPSTATION = ? AND ARRSTATION = ?");    
            
            
            
                ost =(OraclePreparedStatement) oconn.prepareStatement("SELECT * FROM AVAILABLETRAINS WHERE LTIME = ? AND DEPSTATION = ? AND ARRSTATION = ?");
                ost.setString(1, date);
            ost.setString(2, departureStation);
            ost.setString(3, arrivalStation);

                
                    ors = (OracleResultSet) ost.executeQuery();
                    if (ors.next()) {
                         result = "TRAINID" + ors.getInt("TRAINID") + "<br>";
                    }
                
            
        } catch (SQLException e) {
            // Handle database exceptions
            e.printStackTrace();
        }

        return result;
    }
    
    
    

    
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>ticket filter</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("");
//            
//        String date = request.getParameter("date");
//        String departureStation = request.getParameter("departure");
//        String arrivalStation = request.getParameter("arrival");
//            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
//            oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");
//           ost =(OraclePreparedStatement) oconn.prepareStatement("SELECT * FROM AVAILABLETRAINS WHERE LTIME = ? AND DEPSTATION = ? AND ARRSTATION = ?");
//            ost.setString(1, date);
//            ost.setString(2, departureStation);
//            ost.setString(3, arrivalStation);
//                    
//            
//                 
//            ors = (OracleResultSet) ost.executeQuery();
//            if(ors.next()) 
//            {
//        String trainDetails = "TRAINID" + ors.getString("TRAINID") + "<br>";
//        request.setAttribute("trainDetails", trainDetails);
//        request.getRequestDispatcher("/Bookinggo/TicketSearch/TrainDetails.jsp").forward(request, response);
////        response.sendRedirect("/Bookinggo/TicketSearch/TrainDetails.jsp");
//                
//            }
//            else 
//            {
//                response.sendRedirect("http://localhost:8080/Bookinggo/forgotpassword/WrongEmail.html");
//            }
//            ost.close();
//            oconn.close();
//            out.println("</body>");
//            out.println("</html>");
//            out.println("</body>");
//            out.println("</html>");
//        }     catch (SQLException ex) {
//                  Logger.getLogger(ValidateEmails.class.getName()).log(Level.SEVERE, null, ex);
//              }
//    }
    
    
    


   
    
    
    
  


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

     
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet TrainDetails</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet TrainDetails at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>

}
