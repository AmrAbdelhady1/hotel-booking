<%-- 
    Document   : Login
    Created on : Dec 29, 2020, 12:06:14 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String rate = request.getParameter("rateMessage");
        if (rate != null) {%>
            <script>
                
                alert("Please, Login first");
                
            </script>
    <%}
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="Style.css">
    </head>
    <body class="loginBody">
        
        <div class="loginContainer">
                   <p>Login<p>

        <form method="post" action="LoginAccount">

            <input type="text" name="username" id="username" class="form-control" placeholder="username" required>
            <input type="password" name="pass" id="pass" class="form-control" placeholder="password" required>
            <input type="hidden" value="${param.rateMessage}" name="rate">
            <button type="submit" class="btnLogin">Login</button>
            <p class="message">Not registered? <a href="SignUp.jsp">Create an account</a></p>
        </form>
            <p class="message"> ${param.message}</p>
        </div>
        
    </body>
</html>
