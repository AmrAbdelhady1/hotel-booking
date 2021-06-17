<%-- 
    Document   : adminPage
    Created on : Jan 11, 2021, 3:04:08 PM
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
        <link rel="stylesheet" href="Style.css?version=52">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
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
            </div>
            <div class="btn">
                <i class="fas fa-bars menu-btn"></i>
            </div>
            <div class="dropdown">
  <button class="dropbtn">Dropdown</button>
  <div class="dropdown-content">
  <p>Link 1</p>
  </div>
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
            <form action="UpdateHotelInfo.jsp">
                <input type="text" placeholder="Hotel Name" name="hotelname" onchange="validate()" id="hotel" required>
                <script>

                    function validate() {
                        var hotel = document.getElementById("hotel").value;
                        var xmlhttp = new XMLHttpRequest();
                        xmlhttp.open("GET", "CheckHotel?hotel=" + hotel, true);
                        xmlhttp.send();
                        xmlhttp.onreadystatechange = function () {
                            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                                if (xmlhttp.responseText != "") {
                                    document.getElementById("err").innerHTML = xmlhttp.responseText;
                                    document.getElementById("updateBtn").disabled = true;
                                } else {
                                    document.getElementById("err").innerHTML = "";
                                    document.getElementById("updateBtn").disabled = false;
                                }
                            }
                        }
                    }
                </script>
                <button  id="updateBtn" class="btnLogin">Update Hotel</button>
            </form>
            <p id="err"></p>
            <h1 for="roomsForm">Enter the hotel name to Add or Update room</h1>
            <form name="roomsForm" id="roomsForm" action="updateRooms.jsp">
                <input type="text" name="hotelname2" placeholder="Hotel Name" id="hotel2" onchange="validate2()" required>
                <script>
                    function validate2() {
                        var hotel = document.getElementById("hotel2").value;
                        var xmlhttp = new XMLHttpRequest();
                        xmlhttp.open("GET", "CheckHotel?hotel=" + hotel, true);
                        xmlhttp.send();
                        xmlhttp.onreadystatechange = function () {
                            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                                if (xmlhttp.responseText != "") {
                                    document.getElementById("err2").innerHTML = xmlhttp.responseText;
                                    document.getElementById("updromBtn").disabled = true;
                                    document.getElementById("adromBtn").disabled = true;
                                    document.getElementById("viewBtn").disabled = true;
                                } else {
                                    document.getElementById("err2").innerHTML = "";
                                    document.getElementById("updromBtn").disabled = false;
                                    document.getElementById("adromBtn").disabled = false;
                                    document.getElementById("viewBtn").disabled = false;
                                }
                            }
                        }
                    }
                </script>
                <br>
                <button class="btnLogin" value="Update" id="updromBtn">Update Room</button>
                <p id="1"></p><br>
                <button class="btnLogin" id="adromBtn" onclick="roomsForm.action = 'addRooms.jsp'">Add</button>
                <p id="2"></p><br>
                <button class="btnLogin" id="viewBtn" onclick="roomsForm.action = 'viewComments.jsp'">View Comments</button>
            </form>
            <p id="err2"></p> <p>${param.message}</p>
        </div>
    </body>
</html>
