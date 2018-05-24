<%-- 
    Document   : login1
    Created on : 22.May.2018, 17:51:16
    Author     : mete
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Database" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<%
    String username    =request.getParameter("username");
    String password    =request.getParameter("password");
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost:3306/contactmanager?useUnicode=yes&characterEncoding=UTF-8";
    String USER = "mete";
    String PASS = "metemete";
    Connection conn = null;
    Statement stmt = null;
    session.setAttribute("isim", username);
    session.setAttribute("sifre", password);
    Database db = new Database();
    int id = db.login(username, password);
    session.setAttribute("key", username);
    session.setAttribute("id", id);
    try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            PreparedStatement pst = conn.prepareStatement("Select * from users where username=? and sifre=?");
            pst.setString(1, username);
            pst.setString(2, password);
            
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {%>
                <jsp:forward page="index.jsp"/>   
            <%}
            else
            {%>
                <jsp:forward page="login.jsp"/>
            <%}
        }
        catch(SQLException se)
        {
            se.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    
        %>



    
</body>
</html>
