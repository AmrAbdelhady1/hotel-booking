/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

/**
 *
 * @author User
 */
public class Update extends HttpServlet {

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
                String hotelname = request.getSession().getAttribute("hotelname").toString();
                String Location = request.getParameter("location");
                String phone = request.getParameter("phone");
                String mobile = request.getParameter("mobile");
                String facilities = request.getParameter("facil");
                String email = request.getParameter("email");
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3307/hotel";
                String user = "root";
                String password = "qwe123@thelover";
                Connection con = DriverManager.getConnection(url, user, password);
                Statement stmt = con.createStatement();
                stmt.executeUpdate("UPDATE `hotel`.`hotelinfo` SET `location` = "
                        + "'"
                        + Location
                        + "', `Mobile` = '"
                        + mobile
                        + "', `phone` = '"
                        + phone
                        + "', `email` = '"
                        + email
                        + "', `facilities` = '"
                        + facilities
                        + "' WHERE (`name` = '"+hotelname+"');");
                
                
                File file ;
		   int maxFileSize = 5000 * 1024;
		   int maxMemSize = 5000 * 1024;
		   ServletContext context = getServletContext();
		   String filePath = "E:\\Ali\\4th Year\\1st Term\\Internet applications\\htotelProject\\web\\images\\"+hotelname+"\\";
		   System.err.println(filePath);
		   // Verify the content type
		   String contentType = request.getContentType();
		   
		   if ((contentType.indexOf("multipart/form-data") >= 0)) {
			   System.out.println("multif");
		      DiskFileItemFactory factory = new DiskFileItemFactory();
		      // maximum size that will be stored in memory
		      factory.setSizeThreshold(maxMemSize);
		      
		      // Location to save data that is larger than maxMemSize.
		      factory.setRepository(new File("c:\\temp"));

		      // Create a new file upload handler
		      ServletFileUpload upload = new ServletFileUpload(factory);
		      
		      // maximum file size to be uploaded.
		      upload.setSizeMax( maxFileSize );
                      try { 
		         // Parse the request to get file items.
		         List fileItems = upload.parseRequest(request);

		         // Process the uploaded file items
		         Iterator i = fileItems.iterator();


		         
		         while ( i.hasNext () ) {
		        	 
		            FileItem fi = (FileItem)i.next();
		            if ( !fi.isFormField () ) {
		               // Get the uploaded file parameters
		               String fieldName = fi.getFieldName();
		               String fileName = fi.getName();
		               System.out.println(fileName);
		               boolean isInMemory = fi.isInMemory();
		               long sizeInBytes = fi.getSize();
		            
		               // Write the file
		               if( fileName.lastIndexOf("\\") >= 0 ) {
		                  file = new File( filePath + 
		                  fileName.substring( fileName.lastIndexOf("\\")));
		               } else {
		                  file = new File( filePath + 
		                  fileName.substring(fileName.lastIndexOf("\\")+1));
		               }
		              
		               fi.write( file ) ;

		            }
		         }
		      } catch(Exception ex) {
		         ex.printStackTrace();
                   }
		     
                   }
                String message = "*Hotel Information updated successfully*";
                response.sendRedirect("UpdateHotelInfo.jsp?message="+URLEncoder.encode(message, "UTF-8"));
            }catch(Exception e){
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
