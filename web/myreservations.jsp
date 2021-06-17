<%-- 
    Document   : myreservations
    Created on : Jan 10, 2021, 9:38:04 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>reservations Page</title>
    </head>
    <body>
        <%
            String username = request.getSession().getAttribute("Username").toString();
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/hotel";
            String user = "root";
            String password = "qwe123@thelover";
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet RS = stmt.executeQuery("SELECT * FROM reservation WHERE Username='" + username + "'");
            if(!RS.isBeforeFirst()){%>
            <h2>You have no Reservations</h2>
        <%
            }else{
                String nights = "";
                String hotelname = "";
                
        %>
        <h1>Reservations :</h1>
        <table border="1">
            <%
                while (RS.next()) {

            %>
            <tr>
                <th>Reservation ID</th> 
                <th>Username</th> 
                <th>Hotel Name</th> 
                <th>Check In</th>
                <th>checkout</th>
                <th>price</th>
                <th>Room Name</th>
                <th>Nights</th>
                <th>Phone Number</th>
                <th>Email</th>
            </tr>
            <tr>

                <td><%=RS.getString("idreservation")%></td>
                <td><%=RS.getString("Username")%></td>
                <td><%=RS.getString("hotelname")%></td>
                <td><%=RS.getString("checkin")%></td>
                <td><%=RS.getString("checkout")%></td>
                <td><%=RS.getString("price")%></td>
                <td><%=RS.getString("roomname")%></td>
                <td><%=RS.getString("nights")%></td>
                <td><%=RS.getString("phonenumber")%></td>
                <td><%=RS.getString("email")%></td>
                <%nights = RS.getString("nights");
                hotelname = RS.getString("hotelname");%>
            </tr>
            <%}
            %>
        </table>
        <hr>
        <h1>Change Reservation :</h1>
        <br>
        <form action="Cancel">
            <table border="2">
                <thead>
                </thead>
                <tbody>
                    <tr>
                        <td>Enter Reservation ID</td>
                        <td><input type="text" name="id" /></td>
                        <input type="hidden" value="change" name="chng">
                        <%session.setAttribute("change", 1);%>
                        <input type="hidden" value="<%=nights%>" name="nights">
                        <input type="hidden" value="<%=hotelname%>" name="hotelname">
                    </tr>
                    <tr>
                        <td><input type="submit" value="change" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <hr>
        <h1>Cancel Reservation :</h1>
        <br>
        <form action="Cancel">
            <table border="2">
                <thead>
                </thead>
                <tbody>
                    <tr>
                        <td>Enter Reservation ID</td>
                        <td><input type="text" name="id" value=""/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Cancel" /></td>
                    </tr>
                     <input type="hidden" value="cncel" name="chng">
                        <input type="hidden" value="<%=nights%>" name="nights">
                        <input type="hidden" value="<%=hotelname%>" name="hotelname">
                </tbody>
            </table>
        </form>
    </body>
    <%}
    %>
</html>
