<%-- 
    Document   : updateRooms
    Created on : Jan 13, 2021, 2:53:10 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Rooms</title>
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
            ResultSet RS = stmt.executeQuery("SELECT* from rooms WHERE name='" + hotelname + "'");
             
            ArrayList<Integer> list = new ArrayList<Integer>();
        %>
        <table class="styled-table">
            <thead>
            <tr>
                <th>Room ID</th>
                <th>Room type</th>

            </tr>
            </thead>
            <%
                while (RS.next()) {%>
                <tr class="active-row">
            <td><%=RS.getString("roomID")%></td>
            <td><%=RS.getString("roomtype")%></td>
            </tr>
              
            <%list.add(Integer.parseInt(RS.getString("roomID")));
                }
            %>
        </table>
        <script>
                function myfunc(){
                    var val=document.getElementById("chooseroom").value;
                    document.getElementById("roomsel").value = val;
                }
            </script>
            <div class="chooser">
                <label for="chooseroom" style="display: inline;">Choose a room:</label>
        <select onchange="myfunc()" id="chooseroom" >
           <%
               for(Integer i:list){%>
                   <option value="<%=i%>"><%=i%></option>
                   <%}
               %>
        </select>
            </div>
            <form action="updateroomserv" method="post">
                <input type="hidden" id="roomsel" name="roomsel" value="<%=list.get(0)%>">
                <input id="roomfac" name="roomfac" placeholder="Facilities"  required><br>
                <input id="view" name="view" placeholder="view" required><br>
                <input id="smoking" name="smoking" placeholder="smoking"required><br>
                <input id="size" name="size" placeholder="size"required><br>
                <input id="parking" name="parking" placeholder="parking" required><br>
                <input id="bedtyp" name="bedtyp" placeholder="bed type" required><br>
                <input id="price" name="price" placeholder="price" required><br>
                <div id="breakfast">
                    <label for="brkyes">Yes</label>
                    <input type="radio" id="brkyes" name="brk" value="yes" checked>
                    <label for="brkno">No</label>
                    <input type="radio" id="brkno" name="brk" value="no"> 
                </div>
                <input class="btnLogin" type="submit" value="Update"> 

            </form>
            </div>
            
            
        
        
    </body>
</html>
