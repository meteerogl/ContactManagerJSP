<%-- 
    Document   : login
    Created on : 22.May.2018, 14:17:08
    Author     : mete
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Database" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<body>

    <div class="header">
        <a href="#default" class="logo">Contacts Manager</a>
        <div class="header-right">
            
            <a href="register.jsp">Register</a>
            <a class="active" href="login.jsp">Login</a>
            <a href="About">About</a>
        </div>
    </div>

     <div class="form" style="padding: 30px;margin-bottom: 100px;margin-right: 450px;margin-left: 450px;">
         <form action="validation.jsp" method="POST"  >
                <center><h1>LOGIN</h1></center>
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="User Name">

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="User Password">

                    <input type="submit" value="Login" name="gonder"></input>
                    
                                    
                
            </form>
     </div>
    
</body>
</html>
