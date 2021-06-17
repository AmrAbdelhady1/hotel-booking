<%-- 
    Document   : searchClients
    Created on : Jan 12, 2021, 4:17:21 PM
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
        <title>Clients</title>
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
        <div class="table1" style="display: inline-block;">
            <h1 style="color: #009879">Client information for this reservation:</h1>
        <%
            String id;
            try {
                id = request.getSession().getAttribute("id").toString();
            } catch (Exception e) {
                id = request.getParameter("id");
            }
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/hotel";
            String user = "root";
            String password = "qwe123@thelover";
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet RS = stmt.executeQuery("SELECT* FROM reservation WHERE idreservation='" + id + "'");
            RS.beforeFirst();
            RS.next();
        %>
        <table class="styled-table">
            <thead>
            <tr>
                <th>Username</th> 
                <th>Phone Number</th>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th></th>
            </tr>
            </thead>
            <tr class="active-row">
                <td><%=RS.getString("Username")%></td>
                <td><%=RS.getString("phonenumber")%></td>
                <td><%=RS.getString("email")%></td>
                <td><%=RS.getString("firstname")%></td>
                <td><%=RS.getString("lastname")%></td>              
                <td>
                    <form action="confirmReservation" method="POST">
                        <input style="background:#009879;padding: 5px" class="btnLo" type="submit" value="Confirm" onclick="viewBtn()" id="confBtn" >
                        <input type="hidden" name="username" value="<%=RS.getString("Username")%>">
                        <input type="hidden" name="ID" value="<%=id%>">
                        <input type="hidden" name="email" value="<%=RS.getString("email")%>">
                    </form>
                    <br>
                    <form action="cancelReservation" method="POST">
                        <input style="background:#009879;padding: 5px" class="btnLo" type="submit" value="Cancel" id="cancBtn" >
                        <input type="hidden" name="username" value="<%=RS.getString("Username")%>">
                        <input type="hidden" name="ID" value="<%=id%>">
                        <input type="hidden" name="email" value="<%=RS.getString("email")%>">
                    </form>
                </td>
            </tr>
        </table>
        <p id="message"></p>
        </div>
        <script>
        var message = "<%=request.getParameter("message")%>";
        if (message != "null") {
            document.getElementById("message").innerHTML = message;
            if (message == "Reservation confirmed") {
                document.getElementById("confBtn").disabled = true;
            }
        }



        </script>
    </body>
</html>
