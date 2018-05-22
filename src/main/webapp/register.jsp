<%-- 
    Document   : register
    Created on : 22.May.2018, 14:50:56
    Author     : mete
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Database" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"></link>
        <title>JSP Page</title>
    </head>
    <body>
        
<%
    String username     =request.getParameter("username");
    String password     =request.getParameter("password");
    String name         =request.getParameter("name");
    String soyisim      =request.getParameter("lastname");
    Database new_User   = new Database();
    boolean kayit       =(request.getParameter("kayit") == null);
    if(!kayit)
    {
        
        new_User.register(username,password,name,soyisim);
        kayit = true;
    }
    
        
        
%>
        <div class="header">
            <a href="#default" class="logo">Contacts Manager</a>
            <div class="header-right">
                <a class="active" href="#home">Home</a>
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
                <a href="About">About</a>
            </div>
        </div>
    <div class="form" style="padding: 30px;margin-bottom: 100px;margin-right: 450px;margin-left: 450px;">
            <form action="register.jsp" method="POST">
                <center><h1>REGISTER</h1></center>
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="User Name">

                <label for="password">Password</label>
                <input type="text" id="password" name="password" placeholder="User Password">
                
                <label for="isim">Name</label>
                <input type="text" id="name" name="name" placeholder="Name">
                    
                <label for="password">Lastname</label>
                <input type="text" id="lastname" name="lastname" placeholder="Lastname">

                
                    
                <input type="submit" value="Register" name="kayit">
                    
                    <% if(!kayit)
                    {
                        out.println("Success!");
                    }
                    %>
                
            </form>
     </div>
    </body>
</html>
