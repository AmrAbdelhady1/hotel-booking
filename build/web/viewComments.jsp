<%-- 
    Document   : viewComments
    Created on : Jan 13, 2021, 6:10:06 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Comments and Rate</title>
       <link rel="stylesheet" href="Style.css?version=51">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    </head>
    <body class="loginBody">
         <header>
            <a href="index.jsp" class="brand">Brand</a>
            <div class="menu">
                <div class="btn">
                    <i class="fas fa-times close-btn"></i>
                </div>
                <a href="viewReservations.jsp">View Reservations</a>
                <a href="checkingclients.jsp">Checking Clients</a>
                <a href="adminPage.jsp">AdminPage</a>
            </div>
            <div class="btn">
                <i class="fas fa-bars menu-btn"></i>
            </div>
        </header>
         <script type="text/javascript">
            window.addEventListener("scroll", function () {
                var header = document.querySelector("header");
                header.classList.toggle('sticky', window.scrollY > 0);
            });
            var menu = document.querySelector('.menu');
            var menuBtn = document.querySelector('.menu-btn');
            var closeBtn = document.querySelector('.close-btn');

            menuBtn.addEventListener("click", () => {
                menu.classList.add('active');
            });

            closeBtn.addEventListener("click", () => {
                menu.classList.remove('active');
            });
        </script>
        <div class="loginContainer">
        <%
            String hotelname = "";
            hotelname = request.getParameter("hotelname2");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/hotel";
            String user = "root";
            String password = "qwe123@thelover";
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet RS = stmt.executeQuery("SELECT* FROM RATE WHERE name='" + hotelname + "'");
        %>
        <center>
        <table class="styled-table">
            <thead>
            <tr>
                <th>Username</th>
                <th>Rate</th>
                <th>Comment</th>

            </tr>
            </thead>
            <tbody>
            <%
                while (RS.next()) {%>
                
            <tr class="active-row">
                <td><%=RS.getString("Username")%></td>
                <td><%=RS.getString("stars")%></td>
                <td><%=RS.getString("comment")%></td>
            </tr>
               
            <%}
            %>
             </tbody>
        </table>
        </center>
        </div>
    </body>
</html>
