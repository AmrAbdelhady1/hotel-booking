<%-- 
    Document   : checkingclients
    Created on : Jan 12, 2021, 10:21:15 PM
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
        <title>Check</title>
        <link rel="stylesheet" href="Style.css?version=51">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    </head>
    <body class="loginBody">
        <header style="background: #009879">
            <a href="index.jsp" class="brand">Brand</a>
            <div class="menu">
                <div class="btn">
                    <i class="fas fa-times close-btn"></i>
                </div>
                <a href="viewReservations.jsp">View Reservations</a>
                <a href="adminPage.jsp">Admin Page</a>
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
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/hotel";
            String user = "root";
            String password = "qwe123@thelover";
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet RS = stmt.executeQuery("SELECT* from reservation WHERE checkoutclient=0");

        %>
        <div class="table">
        <table class="styled-table">
            <tr>
                <th>Reservation ID</th>
                <th>Username</th>
                <th>Hotel Name</th>
                <th>Check in</th>
                <th>Check out</th>
                <th>Price</th>
                <th>Rooms</th>
                <th>Nights</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th></th>
            </tr>
            <%                int count = 0;
                while (RS.next()) {%>
                <tr class="active-row">
                <td><%=RS.getString("idreservation")%></td>
                <td><%=RS.getString("Username")%></td>
                <td><%=RS.getString("hotelname")%></td>
                <td><%=RS.getString("checkin")%></td>
                <td><%=RS.getString("checkout")%></td>
                <td><%=RS.getString("price")%></td>
                <td><%=RS.getString("roomname")%></td>
                <td><%=RS.getString("nights")%></td>
                <td><%=RS.getString("firstname")%></td>
                <td><%=RS.getString("lastname")%></td>  
                <td>
                    <form action="MakeCheckIn" method="POST">
                        <input type="submit" value="Checkin" class="btnLo" id="chknBtn<%=count%>">
                        <script>
                        var checkin = <%out.print(RS.getString("checkinclient"));%>
                        if (checkin == "1") {
                            document.getElementById("<%out.print("chknBtn" + count);%>").disabled = true;
                        }

                        </script>
                        <input type="hidden" name="ID" value="<%=RS.getString("idreservation")%>">
                    </form>
                    <br>
                    <form action="MakeCheckOut" method="POST">
                        <button class="btnLo" id="chktBtn" >Checkout</button>
                        <input type="hidden" name="ID" value="<%=RS.getString("idreservation")%>">
                    </form>
                </td>
            </tr>
            <%
                    count++;
                }
            %>
        </table>
        </div>
    </body>
</html>
