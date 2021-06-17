/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class adminSearch extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat( "EEE MMM dd HH:mm:ss z yyyy", Locale.US);
                SimpleDateFormat sdf1 = new SimpleDateFormat( "yyyy-MM-dd");

                String checkin = request.getParameter("checkin");
               String checkout = request.getParameter("checkout");


                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3307/hotel";
                String user = "root";
                String password = "qwe123@thelover";
                Connection con = DriverManager.getConnection(url, user, password);
                Statement stmt = con.createStatement();
                ResultSet RS = stmt.executeQuery("SELECT * FROM reservation WHERE confirmed='0'");
                int count = 0;

                if (!checkin.equals("") && !checkout.equals("")) {
                    
                Date datein = sdf1.parse(checkin);
                Date dateout = sdf1.parse(checkout);
                    out.print("<h1>Reservations :</h1>");

                    out.print("<table class=\"styled-table\">");
                    out.print("<thead>");
                            out.print("<tr>");
                            out.print("<th>Reservation ID</th>");
                            
                            out.print("<th>Hotel Name</th>");
                            out.print("<th>Check In</th>");
                            out.print("<th>checkout</th>");
                            out.print("<th>price</th>");
                            out.print("<th>Room Name</th>");
                            out.print("<th>Nights</th>");
                            
                            out.print("<th>Card Number</th>");
                            out.print("<th>Expired date</th>");
                            out.print("</tr>");
                            out.print("</thead>");
                    while (RS.next()) {
                        String cout = RS.getString("checkout");
                        String cin = RS.getString("checkin");
                        Date datein1 = sdf.parse(cin);
                       Date dateout2 = sdf.parse(cout);
                       
                        long daysin = ((datein1.getTime() - datein.getTime()) / (1000 * 60 * 60 * 24)) % 365;
                        long daysout = ((dateout.getTime() - dateout2.getTime()) / (1000 * 60 * 60 * 24)) % 365;
                        
                        if (daysin >= 0 && daysout >= 0) {
                            
                            out.print("<tr class=\"active-row\">");

                            out.print("<td>" + RS.getString("idreservation") + "</td>");
                            out.print("<td>" + RS.getString("hotelname") + "</td>");
                            out.print("<td>" + RS.getString("checkin") + "</td>");
                            out.print("<td>" + RS.getString("checkout") + "</td>");
                            out.print("<td>" + RS.getString("price") + "</td>");
                            out.print("<td>" + RS.getString("roomname") + "</td>");
                            out.print("<td>" + RS.getString("nights") + "</td>");
                            
                            out.print("<td>" + RS.getString("cardnumber") + "</td>");
                            out.print("<td>" + RS.getString("expireddate") + "</td>");

                            out.print("</tr>");
                        }
                    }
                    out.print("</table>");
                    RS.beforeFirst();
                    count =1;
                    
                }
                if (!RS.isBeforeFirst()) {
                    out.print("<h2> no Reservations</h2>");

                } else if(count ==0){

                    out.print("<h1>Reservations :</h1>");

                    out.print("<table border=\"1\">");
                    out.print("<tr>");
                        out.print("<th>Reservation ID</th>");
                        out.print("<th>Hotel Name</th>");
                        out.print("<th>Check In</th>");
                        out.print("<th>checkout</th>");
                        out.print("<th>price</th>");
                        out.print("<th>Room Name</th>");
                        out.print("<th>Nights</th>");
                        
                        out.print("<th>Card Number</th>");
                        out.print("<th>Expired date</th>");
                        out.print("</tr>");
                        out.print("<tr>");

                    while (RS.next()) {

                        

                        out.print("<td>" + RS.getString("idreservation") + "</td>");
                        out.print("<td>" + RS.getString("hotelname") + "</td>");
                        out.print("<td>" + RS.getString("checkin") + "</td>");
                        out.print("<td>" + RS.getString("checkout") + "</td>");
                        out.print("<td>" + RS.getString("price") + "</td>");
                        out.print("<td>" + RS.getString("roomname") + "</td>");
                        out.print("<td>" + RS.getString("nights") + "</td>");
                        
                        out.print("<td>" + RS.getString("cardnumber") + "</td>");
                        out.print("<td>" + RS.getString("expireddate") + "</td>");

                        out.print("</tr>");
                    }
                }

                out.print("</table>");
            } catch (Exception e) {
                out.print(e);
            }
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
