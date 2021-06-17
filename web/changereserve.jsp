<%-- 
    Document   : changereserve
    Created on : Jan 10, 2021, 10:14:34 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance();%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change reservation</title>
    </head>
    <body>
        <%
            Calendar calendar = Calendar.getInstance();
            Date date = new Date(calendar.getTime().getTime());
            calendar.setTime(date);
            calendar.add(Calendar.MONTH, 1);
            Date currentDatePlusOne = new Date(calendar.getTime().getTime());
        %>
        <form method="POST">
            Change checkin date <input type="date" name="checkin" min="<%= date.toString()%>" max="<%=currentDatePlusOne.toString()%>">
            Change checkout date <input type="date" name="checkout" min="<%= date.toString()%>" max="<%=currentDatePlusOne.toString()%>">
            Change room type <input type="text" name ="type">
        </form>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3307/hotel";
            String user = "root";
            String password = "qwe123@thelover";
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet RS = stmt.executeQuery("SELECT * FROM reservation WHERE Username='" + username + "'");

        %>
    </body>
</html>
