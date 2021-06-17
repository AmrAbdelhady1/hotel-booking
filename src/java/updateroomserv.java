/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class updateroomserv extends HttpServlet {

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
            String message = "";
            try {
                String roomID = request.getParameter("roomsel");
                String roomfac = request.getParameter("roomfac");
                String view = request.getParameter("view");
                String smoking = request.getParameter("smoking");
                String size = request.getParameter("size");
                String parking = request.getParameter("parking");
                String bedtype = request.getParameter("bedtyp");
                String price = request.getParameter("price");
                String breakfast = request.getParameter("brk");
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3307/hotel";
                String user = "root";
                String password = "qwe123@thelover";
                Connection con = DriverManager.getConnection(url, user, password);
                Statement stmt = con.createStatement();
                stmt.executeUpdate("UPDATE `hotel`.`rooms` SET `roomfacilities` = '"
                        + roomfac
                        + "', `view` = '"
                        + view
                        + "', `smoking` = '​"
                        + smoking
                        + "', `size` = '"
                        + size
                        + "', `parking` = '"
                        + parking
                        + "', `bedtype` = '"
                        + bedtype
                        + "', `price` = '"
                        + price
                        + "', `breakfast` = '"
                        + breakfast
                        + "' WHERE (`roomID` = '"
                        + roomID
                        + "');");
                message = "Room updated successfully";
                response.sendRedirect("adminPage.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
            } catch (Exception e) {
                message = "Room update failed";
                response.sendRedirect("adminPage.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
            }
        }
    }
//
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
