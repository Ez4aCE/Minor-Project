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
//         date = request.getParameter("date");
         response.setContentType("text/html;charset=UTF-8");
         try (PrintWriter out = response.getWriter()) {
             
         out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ValidateEmail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("");
         departureStation = request.getParameter("departure");
         arrivalStation = request.getParameter("arrival");

         trainDetails = fetchTrainDetails(date, departureStation, arrivalStation);

        request.setAttribute("trainDetails", trainDetails);
//        request.getRequestDispatcher("/Bookinggo/TicketSearch/TrainDetails.jsp").forward(request, response);
        response.sendRedirect("/Bookinggo/TicketSearch/TrainDetails.jsp");

        out.println("</body>");
        out.println("</html>");
        out.println("</body>");
        out.println("</html>");
         }
        
    }
    
    
    private String fetchTrainDetails(String date, String departureStation, String arrivalStation) {
        String result = "No train details found for the provided input.";

        try  {
            
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
        oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-G27GBF4:1521:orcl","TECHNOK4","DATABASE");    
        ost =(OraclePreparedStatement) oconn.prepareStatement("SELECT * FROM AVAILABLETRAINS WHERE DEPSTATION=? AND ARRSTATION=?");
//            ost.setString(1, date);
        ost.setString(1, departureStation);
        ost.setString(2, arrivalStation);
        ors = (OracleResultSet) ost.executeQuery();
        
                    if (ors.next()) {
                        result = ors.getString("TRAINNAME");
                    }
                ost.close();
                oconn.close();
            
        } catch (SQLException e) {
            // Handle database exceptions
            Logger.getLogger(ValidateEmails.class.getName()).log(Level.SEVERE, null, e);
//            e.printStackTrace();
        }

        return result;
    }
    
}
