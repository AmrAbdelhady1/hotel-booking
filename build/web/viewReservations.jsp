<%-- 
    Document   : viewReservations
    Created on : Jan 11, 2021, 10:33:10 PM
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
        <title>Reservations</title>
        <link rel="stylesheet" href="Style.css?version=52">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script>
            function show(){
            var checkin;
            var checkout;
            try{
                checkin = document.getElementById("checkin").value;
                checkout = document.getElementById("checkout").value;
            }catch(err){
                checkin = "";
                checkout = "";
            }
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET", "adminSearch?checkin=" + checkin+"&checkout="+checkout , true);
            xmlhttp.send();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById("reservations").innerHTML = xmlhttp.responseText;
                }
            }
            }

        </script>
    </head>
    <body class="loginBody">

        <header style="background:">
            <a href="index.jsp" class="brand">Brand</a>
            <div class="menu">
                <div class="btn">
                    <i class="fas fa-times close-btn"></i>
                </div>
                <a href="checkingclients.jsp">Checking Clients</a>
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
        <div class="table1">
        <form method="get">
            <input type="date" name ="checkin" id="checkin">
            <input type="date" name ="checkout" id="checkout" >
            <input class="btnLo" type="button" value="Check" onclick="show()">
        </form>
            <div id="reservations" class="res">
            
        </div>
        <div>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3307/hotel";
                String user = "root";
                String password = "qwe123@thelover";
                Connection con = DriverManager.getConnection(url, user, password);
                Statement stmt = con.createStatement();
                ResultSet RS = stmt.executeQuery("SELECT idreservation FROM reservation WHERE confirmed=0");
                
        %>
            <form action="searchClients.jsp" method="post">
                <h1 for="resList">Enter the reservation id:</h1>
                <input list="reservationslist" name="id" placeholder="Reservation id" id="resList"required>
            <datalist id="reservationslist"><%
                while(RS.next()){
                    String id = RS.getString("idreservation");
                   
                    %>
                
                    <option value="<%out.print(id);%>">
                        <%
                   }
                %>
                       
                </datalist>
                <br>
                <input class="btnLo" type="submit" value="Search" id="searchbtn">
        </form>
        </div>
        </div>
    </body>
</html>
