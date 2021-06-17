<%-- 
    Document   : MakeReservation
    Created on : Jan 7, 2021, 3:10:28 AM
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
        <title>Reservation</title>
        <link rel="stylesheet" href="Style.css">
    </head>
    <body class="mr_body">
        <div class="header">
            <h1>Booking system</h1>        
        </div>
        <%
            String hotelName = session.getAttribute("hotelname").toString();
            String temp = hotelName + "/" + "0" + ".jpg";
            ArrayList<String> roomsList = new ArrayList<>();
        %>

        <div class ="mr_ng">
            <h2><%= hotelName%></h2>
            <img  src = "images/<%out.print(temp);%>" width="500" height="333"/>
        </div>
        <span>Your booking details</span>
        <div>
            <%
                String nights = "";
                try{
                nights = request.getParameter("nights");}
                catch(Exception e){
                    out.print(e);
                }
                int count = Integer.parseInt(request.getParameter("count").toString());
                int sumPrice = 0;
                String checkIN = request.getSession().getAttribute("checkin").toString();
                String checkOut = request.getSession().getAttribute("checkout").toString();
            %>
            Check-in<p><%= checkIN%></p>
            Check-out<p><%= checkOut%></p>
            <br>
            Total length of stay:<p><%out.println(nights + " nights");%></p><br>
            You selected: <br>
            <%
                for (int i = 0; i < count; i++) {
                    String roomtype = request.getParameter("room" + i);
                    String[] rooms = request.getParameter("roomNumber" + i).toString().split("-");

                    if (rooms.length == 2) {
                        sumPrice += Integer.parseInt(rooms[1]);
                        roomsList.add(rooms[0]+"_"+roomtype);
                %>
                        
            <p><%out.println(rooms[0] + " " + roomtype);%></p><br>
            <%

                    }
                }

            %>
            <br>
            The total price: <p><%= sumPrice%></p><br>
            <form action="viewHotel.jsp" method="post">
                <input type="hidden" name="nights" value="<%=nights%>">
                <input type="hidden" name="hotelname" value="<%=hotelName%>">
                <input type="submit" value="Change your selection">
            </form>
            <!--            <a href="viewHotel.jsp">Change your selection</a>-->
        </div>
        <br>
        <span>Enter your details</span>
        <form method="post"action="AddReservation">
            <div>
                <input type="hidden" name="price" value="<%= sumPrice%>"
                <label for="firstName">First Name</label> 
                <input type="text" id="firstName" name="firstname" required>
                <br>
                <label for="lastName">Last Name</label> 
                <input type="text" id="lastName" name="lastname" required>
                <br>
                <label for="Email">Email Address</label> 
                <input type="email" id="Email" name="Email" required>
                <br>
                <label for="confirmEmail">Confirm email</label> 
                <input type="email" id="confirmEmail" name="confirm" onchange="validate()" required>
                <br>
                <label for="phone">Phone Number:</label> 
                <input type="number" id="phone" name="Phone" required>
                <br>
                <span>Enter your Payment Information:</span>
                <label for="CardNO.">Card Number:</label>
                <input type="number" id="CardNO." name="cardnumber" placeholder="Card No.">
                <br>
                <label for="expired">Expired Date:</label>
                <input type="date" id="expired" name="expireddate" placeholder="Expired date">
                <span id="error"style="color: red;"></span>
            </div>
            <br>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3307/hotel";
                String user = "root";
                String password = "qwe123@thelover";
                Connection con = DriverManager.getConnection(url, user, password);
                Statement stmt = con.createStatement();
                int counter = 0;
                for (int i = 0; i < count; i++) {
                    String roomtype = request.getParameter("room" + i);
                    String[] rooms = request.getParameter("roomNumber" + i).toString().split("-");
                    String RoomFacilities = "";
                    String smoking = "";
                    if (rooms.length == 2) {
                        ResultSet RS = stmt.executeQuery("SELECT* FROM rooms WHERE name='" + hotelName + "' AND roomtype='" + roomtype + "'");
                        RS.beforeFirst();
                        RS.next();
                        for (int j = 0; j < Integer.parseInt(rooms[0]); j++) {

                            RoomFacilities = RS.getString("roomfacilities");
                            smoking = RS.getString("smoking");
                            String check = RS.getString("breakfast");
                            
                            if (check.equalsIgnoreCase("yes")) {
                                check = "breakfast included";
                            } else {
                                check = "breakfast not included";
                            }
            %>
            <div>
                <h3><%= roomtype%></h3>
                <p><%= RoomFacilities%></p>
                <p><%= smoking%></p>
                <p><%=check%></p>
                <p>Make changes online to your booking included</p>
                <input type="text" name="guest<%= j%>" placeholder="First name, Last name" required>
            </div>
            <%                   counter++;
                        }
                    }
                }
                
                for(int k=0;k<roomsList.size();k++){%>
                <input type="hidden" name="room<%=k%>" value="<%=roomsList.get(k)%>">
            <%
                    
                }
            %>
            <input type="hidden" name="size" value="<%=roomsList.size()%>">
            <br>
            <input type="submit" value="Make Reserve" id="MakeReserve"> 
        </form>

        <script>
            function validate() {
                var email = document.getElementById("Email").value;
                var confirmEmail = document.getElementById("confirmEmail").value;
                if (email != confirmEmail) {
                    document.getElementById("error").innerHTML = "Enter email correctly";
                }
            }
        </script>


        <%
            String message = request.getParameter("message");
            if(message!=null){%>
            <script>
                alert("Reservation made successfully");
                document.getElementById("MakeReserve").disabled = true;
            </script>
            <form action="CancelReservation">
                <input type="submit" value="Cancel Reservation">
            </form>
                <%
            }
        %>

    </body>
</html>
