/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class AddReservation extends HttpServlet {

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
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3307/hotel";
                String user = "root";
                String password = "qwe123@thelover";
                Connection con = DriverManager.getConnection(url, user, password);
                Statement stmt = con.createStatement();
                String firstName = request.getParameter("firstname");
                String lastName = request.getParameter("lastname");
                String email = request.getParameter("Email");
                String cardNum = request.getParameter("cardnumber");
                String phone = request.getParameter("Phone");
                String expiireddate = request.getParameter("expireddate");
                String checkIN = request.getSession().getAttribute("checkin").toString();
                String checkOut = request.getSession().getAttribute("checkout").toString();
                SimpleDateFormat sdf = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");
                Date checkindate =  sdf.parse(request.getSession().getAttribute("checkin").toString());
                Date checkoutdate =  sdf.parse(request.getSession().getAttribute("checkin").toString());
                long nights = (Math.abs(checkindate.getTime() - checkoutdate.getTime()) / (1000 * 60 * 60 * 24)) % 360;
                if (nights == 0)
                {
                    nights = 1;
                }
                String price = request.getParameter("price");
                String hotelname = request.getSession().getAttribute("hotelname").toString();
                String username = request.getSession().getAttribute("Username").toString();
                String roomsNames = "";
                String total = request.getSession().getAttribute("price").toString();
                out.print("<br>");
                out.print(total);
                int size = Integer.parseInt(request.getParameter("size"));
                for(int i=0;i<size;i++){
                    String room = request.getParameter("room"+i);
                    roomsNames+=room;
                    roomsNames+=",";
                }
                stmt.execute("INSERT INTO `hotel`.`reservation` (`Username`, `hotelname`, `checkin`, `checkout`, `price`, `roomname`, `nights`,totalprice,firstname,lastname,email,cardnumber,expireddate,phonenumber,confirmed) VALUES "
                        + "('"+username+"', '"+hotelname+"', '"+checkIN+"', '"+checkOut+"', '"+price+"', '"+roomsNames+"','"+nights+"','"+total+"','"+firstName+"','"+lastName+"','"+email+"','"+cardNum+"','"+expiireddate+"','"+phone+"','0');");
                String message = "Reservation made successfully";
                response.sendRedirect("index.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
            }catch(Exception e){
                String rateMessage = "Please login first before making reservation";
                //out.print(e);
                response.sendRedirect("Login.jsp?rateMessage="+URLEncoder.encode(rateMessage, "UTF-8"));
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
