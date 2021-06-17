<%-- 
    Document   : resultSearch
    Created on : Dec 30, 2020, 9:51:01 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <link rel="stylesheet" href="Style.css">
    </head>
    <body class="r_sBody">
        <div class="header">
            <h1>Booking system</h1>        
        </div>
        <div class="fiter">
        <label for="filter">Filter By:</label>
        <select id="filter" onchange="getResult()" >
            <option value="priceofwholeroom" selected>price</option>
            <option value="rate">rating</option>
            <option value="stars">stars</option>
            <option value="distance">distance from center</option>
        </select>
        </div>
        <%
            String username = request.getParameter("username");
            String location = request.getParameter("location");
            long adult = Integer.parseInt(request.getParameter("adult"));
            long child = Integer.parseInt(request.getParameter("child"));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date checkin = sdf.parse(request.getParameter("checkin"));
            session.setAttribute("checkin", checkin);
            Date checkout = sdf.parse(request.getParameter("checkout"));
            session.setAttribute("checkout", checkout);
            long nights = (Math.abs(checkin.getTime() - checkout.getTime()) / (1000 * 60 * 60 * 24)) % 360;
            if (nights == 0) {
                nights = 1;
            }%>
    
            <div id="search" class="r_sdiv">
                <%
                     Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3307/hotel";
                String user = "root";
                String password = "qwe123@thelover";
                Connection con = DriverManager.getConnection(url, user, password);
                Statement stmt = con.createStatement();
                ResultSet RS = stmt.executeQuery("SELECT* FROM hotelinfo ORDER BY priceofwholeroom");
                while(RS.next()){
                    if (location.equalsIgnoreCase(RS.getString("location"))) {%>
                    <div>
                        <img class="hotel_img" src="images/<%out.print(RS.getString("name"));%>/0.jpg" width="500" height="333">
                        <%long totalprice = (RS.getInt("priceofwholeroom") * nights) + (adult * RS.getInt("priceofadult")) + (child * RS.getInt("priceofchild"));%>
                        <form method="post" action="viewHotel.jsp">
                            <input type="hidden" name="hotelname" value="<%out.print(RS.getString("name"));%>">
                            <h3><%out.print(RS.getString("name"));%></h3>
                            <br>
                            <input type="hidden" name="price" value="<%out.print(totalprice);%>">
                            <p><%out.print("Total Price ="+totalprice);%></p>
                            <br>
                            <p><%out.print("Rate: " + RS.getString("rate"));%></p>
                            <br>
                            <input type="hidden" name="nights" value="<%out.print(nights);%>">
                            <p><%out.print(RS.getString("distance")+" KM from center");%></p>
                            <br>
                            <input type="submit" value="See Availability">
                        </form>
                    </div>
                    <%}
                }
                %>
            </div>
        <script>
            function getResult(){
            var val = document.getElementById("filter").value;
            var location = "<%out.print(location);%>";
            var adult = <%out.print(adult);%>;
            var child = <%out.print(child);%>;
            var nights = <%out.print(nights);%>;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET", "getResult?filter=" + val + "&location=" + location+ "&adult=" + adult+ "&child=" + child+ "&nights=" + nights, true);
            xmlhttp.send();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                     document.getElementById("search").innerHTML = xmlhttp.responseText;
                }
            }
        }
        </script>
        
    </body>
</html>
