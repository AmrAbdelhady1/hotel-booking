<%-- 
    Document   : addRooms
    Created on : Jan 13, 2021, 3:20:41 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Rooms</title>
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
        <%
            String hotelname = "";
            hotelname = request.getParameter("hotelname2");
        %>
        <div class="loginContainer">
            <p>Enter room Information</p>  
            <form action="addRoomServ" method="post">
                <input name="hotel" type="hidden" value="<%out.print(hotelname);%>"
                <input id="roomtyp" name="roomtyp" placeholder="room type"  required><br>
                <input id="roomfac" name="roomfac" placeholder="Facilities"  required><br>
                <input id="view" name="view" placeholder="view" required><br>
                <input id="smoking" name="smoking" placeholder="smoking"required><br>
                <input id="size" name="size" placeholder="size"required><br>
                <input id="parking" name="parking" placeholder="parking" required><br>
                <input id="bedtyp" name="bedtyp" placeholder="bed type" required><br>
                <input id="price" name="price" placeholder="price" required><br>
                <div id="breakfast" >
                    <label for="brkyes">Yes</label>
                    <input type="radio" id="brkyes" name="brk" value="yes" checked>
                    <label for="brkno">No</label>
                    <input type="radio" id="brkno" name="brk" value="no"> 
                </div>
                <input class="btnLogin" type="submit" value="Add"> 
            </form>
        </div>
    </body>
</html>
