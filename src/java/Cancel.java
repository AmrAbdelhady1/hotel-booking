/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.email.durgesh.Email;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.Session;

/**
 *
 * @author User
 */
public class Cancel extends HttpServlet {

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
                int id = Integer.parseInt(request.getParameter("id"));
                request.getSession().setAttribute("id", id);
                String nights = request.getParameter("nights");
                String hotelname = request.getParameter("hotelname");
                String change = request.getParameter("chng");
                out.print(nights);
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3307/hotel";
                String user = "root";
                String password = "qwe123@thelover";
                Connection con = DriverManager.getConnection(url, user, password);
                Statement stmt = con.createStatement();
                ResultSet RS = stmt.executeQuery("SELECT* from reservation WHERE (idreservation = '"+id+"') ");
                request.setAttribute("hotelname", hotelname);
                request.setAttribute("nights", nights);
                if(change.equals("change")){
                    stmt.executeUpdate("DELETE FROM reservation WHERE idreservation = '" + id + "' ");
                    response.sendRedirect("viewHotel.jsp?nights="+nights+"&hotelname="+hotelname);
                }else{
                    Email email = new Email("internetproject57@gmail.com", "qwe123@thelover");
                email.setFrom("internetproject57@gmail.com", "IA Project");
                email.setSubject("System Mail");
                email.setContent(RS.getString("firstname")+RS.getString("lastname")+"<h1>  has canceled the reservation <h1>", "text/html");
                email.addRecipient("alizidan571@gmail.com");
                email.send();
                   stmt.executeUpdate("DELETE FROM reservation WHERE idreservation = '" + id + "' ");
                response.sendRedirect("myreservations.jsp");
                }
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
