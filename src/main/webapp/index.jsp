<%-- 
    Document   : index
    Created on : 22.May.2018, 00:58:45
    Author     : mete
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Database" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
        <link rel="stylesheet" type="text/css" href="style.css"></link>
    </head>
    <body>
<%
        //VERİTABANINA YENİ BİR KAYIT EKLEMEK İÇİN BU KISIM
        out.println(session.getAttribute("key"));
        out.println(session.getAttribute("id"));
        int kullanıcı_id = (Integer)session.getAttribute("id");
        
        String firstname    =request.getParameter("firstname");
        String lastname     =request.getParameter("lastname");
        String city         =request.getParameter("city");
        String tnumber      =request.getParameter("tnumber");
        String email        =request.getParameter("email");
        boolean gonder      =(request.getParameter("gonder") == null);
        Database new_Contact = new Database();
        boolean kayıt_mesaj_kontrol = false;
        
        
        if(!gonder)
        {
            new_Contact.setFirstname(firstname);
            new_Contact.setLastname(lastname);
            new_Contact.setCity(city);
            new_Contact.setTnumber(tnumber);
            new_Contact.setEmail(email);
            kayıt_mesaj_kontrol = true;
            new_Contact.create( kullanıcı_id,firstname,lastname,city,tnumber,email);
            response.sendRedirect("index.jsp");
            
        }
        

%>
<%
    //VERİTABANINDAN İLGİLİ KULLANICININ REHBERİNİ ÇEKMEK İÇİN BU KISIM VE EN AŞŞAĞIDAKİ KISIM VAR DEVAMI
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    String DB_URL = "jdbc:mysql://localhost:3306/contactmanager?useUnicode=yes&characterEncoding=UTF-8";
    String USER = "mete";
    String PASS = "metemete";
    Connection conn = null;
    Statement stmt = null;
    try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            String sql = "Select * from contacts where kullanıcı_id=?";
            
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, kullanıcı_id);
            ResultSet rs = pst.executeQuery();
            
           
            
        
    
    
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
    
  
    <div class="sol">
        <div class="form" style="padding: 20px;">
            <form action="index.jsp" method="POST">
                <center><h1>Add a Contact</h1></center>
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="firstname" placeholder="First Name">

                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lastname" placeholder="Last Name">

                <label for="city">City</label>
                <input type="text" id="city" name="city" placeholder="Enter a City">

                <label for="telephone">Telephone Number</label>
                <input type="text" id="tnumber" name="tnumber" placeholder="Enter a telephone number">

                <label for="email">E Mail</label>
                <input type="text" id="email" name="email" placeholder="E-mail adress">
                    
                <input type="submit" value="submit" name="gonder">
                    
                <% if(kayıt_mesaj_kontrol)
                    {
                        out.println("Success!");
                    }
                %>
                
            </form>

        </div>
    </div>
    <div class="sağ">
        <h1>Contacts</h1>

<form  method="post">
    <table>
        <tr>
            <td>Name</td>
           
        </tr>
        
<%
    
while(rs.next())
{           
           
            int a = rs.getInt(2);
%>
        <tr> 
            <td><%out.println(rs.getString(3));%></td>
            <td><%out.println(rs.getString(4));%></td>
            <td><%out.println(rs.getString(5));%></td>
            <td><%out.println(rs.getString(6));%></td>
            <td><%out.println(rs.getString(7));%></td>
            
        <form action="index.jsp">
            <td><input type="submit" value="<%=a%>" name="delete"></input></td>
            <td><input type="submit" value="submit" name="gonder"></input></td>  
  
        </form>
                 
        </tr>
        <%}%> 
    </table>

 <%    
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
</form>          
        
<%
        String delete    =request.getParameter("delete");
       
        out.println(delete);
        if(delete != null)
        {
            int delete_int = Integer.parseInt(delete);
            out.println(delete_int);
            String sql1 = "delete  from contacts where id=?";
            PreparedStatement pst1 = conn.prepareStatement(sql1);
            pst1.setInt(1, delete_int);
            pst1.execute();
            System.out.print("silindi");
        }
%>
                
  
    
    
    
    </body>
</html>
