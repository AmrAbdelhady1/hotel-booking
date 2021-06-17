<%-- 
    Document   : index
    Created on : Dec 29, 2020, 9:15:27 PM
    Author     : User
--%>

<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="Style.css">
        
    </head>
    <body class="homeBody">
        <div class="header">
            <h1>Booking system</h1>        
        </div>

        
        <%
            String profileName = "";
            Calendar calendar = Calendar.getInstance();
            Date date = new Date(calendar.getTime().getTime());
            calendar.setTime(date);
            calendar.add(Calendar.MONTH, 1);
            Date currentDatePlusOne = new Date(calendar.getTime().getTime());
            try {
                String username = request.getSession().getAttribute("Username").toString();
                profileName = request.getSession().getAttribute("DisplayName").toString();
        %>
        <div class="topnav">
            <a href="Signout">Sign out</a>
            <a href="Profile.jsp"><%=profileName%></a>
            <a href="myreservations.jsp">My Reservation</a>
        </div>
        <%
        } catch (Exception e) {
        %>
        <div class="topnav">
            <a href="SignUp.jsp">Sign up</a>
            <a href="Login.jsp">Login</a>
        </div>
        <%
            }

        %>
        <br>
        <div class="book_Cont">
            <form method="post" action="resultSearch.jsp">
                <input list="locations" name="location" placeholder="Where are you going?" class="loc" required>
                <datalist id="locations">
                    <option value="Alexandria">
                    <option value="Cairo">
                    <option value="Hurghada">
                    <option value="Sharm El sheikh">
                    <option value="Giza">
                </datalist>
                <input type="date" name="checkin" min="<%= date.toString()%>" max="<%=currentDatePlusOne.toString()%>" class="chk" required>
                <input type="date" name="checkout" min="<%= date.toString()%>" max="<%=currentDatePlusOne.toString()%>"class="chk" required>
                <input type="number" name="adult" placeholder="Adults" min="1" max="10" class="person" required>
                <input type="number" name="child" placeholder="Childs" min="1" max="10" class="person" required>
                <input type="submit" name="submit" value="Search" class="srchBtn">
            </form>
        </div> 
        <div class="footer">
        </div>
         <p>${param.message}</p>       
    </body>
</html>
