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
    //Update İŞLEMLERİ İÇİN GEREKİYOR
    String update = request.getParameter("update");
    
    String kontrol="gonder";//Submit butonundaki değişiklikler için 
    String addcontact="Add New Contact";
    String place_firstname ="firstname";
    String place_lastname ="lastname";
    String place_city ="city";
    String place_tnumber ="tnumber";
    String place_email ="email";
    if(update!=null)
    {   
        
        int ab = Integer.parseInt(request.getParameter("update"));
        kontrol = "update1";//Submit butonu değişir
        out.println(ab);
        Database db1 = new Database();
        Connection conn1 = db1.connection();
        Statement stmt1 = null;
        try
        {
            stmt1 = conn1.createStatement();
            String sql1 = "Select * from contacts where id=?";
            PreparedStatement pst1 = conn1.prepareStatement(sql1);
            pst1.setInt(1, ab);
            ResultSet rs1 = pst1.executeQuery();
            while(rs1.next())
            {
                addcontact = "Update: "+rs1.getString(3);
                place_firstname = rs1.getString(3);
                place_lastname = rs1.getString(4);
                place_city = rs1.getString(5);
                place_tnumber = rs1.getString(6);
                place_email = rs1.getString(7);
                
                
            }
        }
        catch(SQLException se)
        {
            se.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
        boolean update1 =(request.getParameter("update1") == null);
        if(!update1)
        {
            out.println(request.getParameter("update1"));
            out.println("update İŞLEMLERİ");
   
        }
    

%>
<%
        
        //VERİTABANINA YENİ BİR KAYIT EKLEMEK İÇİN BU KISIM
        //out.println(session.getAttribute("update"));
        //out.println(session.getAttribute("id"));
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
            out.println(gonder);
            new_Contact.setFirstname(firstname);
            new_Contact.setLastname(lastname);
            new_Contact.setCity(city);
            new_Contact.setTnumber(tnumber);
            new_Contact.setEmail(email);
            kayıt_mesaj_kontrol = true;
            new_Contact.create( kullanıcı_id,firstname,lastname,city,tnumber,email);
            //response.sendRedirect("index.jsp");
            out.print(gonder);
            
        }
        

%>
<%
    //VERİTABANINDAN İLGİLİ KULLANICININ REHBERİNİ ÇEKMEK İÇİN BU KISIM VE EN AŞŞAĞIDAKİ KISIM VAR DEVAMI
    Database db = new Database();
    Connection conn = db.connection();
    Statement stmt = null;
    try
        {
            stmt = conn.createStatement();
            String sql = "Select * from contacts where kullanıcı_id=?";
            
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, kullanıcı_id);
            ResultSet rs = pst.executeQuery();
    
%>
<%
    //VERİTABANINDAN İLGİLİ NUMARAYI SİLMEK İÇİN DEVAM
        String delete    =request.getParameter("delete");
        //out.println(delete);
        if(delete != null)
        {
            int delete_int = Integer.parseInt(delete);
            //ut.println(delete_int);
            String sql1 = "delete  from contacts where id=?";
            PreparedStatement pst1 = conn.prepareStatement(sql1);
            pst1.setInt(1, delete_int);
            pst1.execute();
            response.sendRedirect("index.jsp");
        }
%>


    <div class="header">
        <a href="#default" class="logo">Contacts Manager</a>
        <div class="header-right">
            <a class="active" href="index.jsp">Home</a>
            <a href="login.jsp">Logout</a>
            <a href="About">About</a>
        </div>
    </div>
    
  
    <div class="sol">
        <div class="form" style="padding: 20px;">
            <form action="index.jsp" method="POST">
                <center><h1><%=addcontact%></h1></center>
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="firstname" placeholder="<%=place_firstname%>">

                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lastname" placeholder="<%=place_lastname%>">

                <label for="city">City</label>
                <input type="text" id="city" name="city" placeholder="<%=place_city%>">

                <label for="telephone">Telephone Number</label>
                <input type="text" id="tnumber" name="tnumber" placeholder="<%=place_tnumber%>">

                <label for="email">E Mail</label>
                <input type="text" id="email" name="email" placeholder="<%=place_email%>">
                    
                <input type="submit" value="<%=kontrol%>" name="<%=kontrol%>">
                    
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
            <td class="a">First Name</td>
            <td class="a">Last Name</td>
            <td class="a">City</td>
            <td class="a">Telephone Number</td>
            <td class="a">E Mail</td>
           
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
            <td><button class="button" type="submit" name="delete" onclick="return confirm('Are you sure you want to delete this contact?');"  value="<%=a%>">DELETE</button></td>
        </form>
        <form action="index.jsp">
            <td><button class="button" type="submit" name="update" value="<%=a%>">UPDATE<%=a%></button></td>
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
        

                
  
    
    
    
    </body>
</html>
