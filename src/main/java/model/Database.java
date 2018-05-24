/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;


public class Database 
{
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/contactmanager?useUnicode=yes&characterEncoding=UTF-8";
    static final String USER = "mete";
    static final String PASS = "metemete";
    static Connection conn = null;
    static Statement stmt = null;
    //For Add Contacts
    private int kullanıcı_id;
    private String firstname    ;
    private String lastname     ;
    private String city         ;
    private String tnumber      ;
    private String email        ;
    //For User Account
    private String username     ;
    private String password     ;
    private String name         ;
    private String soyisim      ;
            
    
    
    
    
    public void connection()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            
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
    public void create(int kullanıcı_id,String firstname,String lastname, String city, String tnumber, String email)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            String sql = "INSERT INTO contacts(kullanıcı_id, firstname, lastname, city, tnumber, email) "
                    +    "VALUES (?, ?, ?, ?, ?, ?)";
            
            PreparedStatement preparedStmt = conn.prepareStatement(sql);
            
            preparedStmt.setInt(1, kullanıcı_id);
            preparedStmt.setString(2, firstname);
            preparedStmt.setString(3, lastname);
            preparedStmt.setString(4, city);
            preparedStmt.setString(5,tnumber);
            preparedStmt.setString(6,email);
            
            preparedStmt.executeUpdate();
            conn.close();
            
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
    //String username, String password, String name,String lastname
    public void register(String username, String password, String name,String soyisim)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            String sql = "INSERT INTO users( username, isim, soyisim, sifre) "
                    +    "VALUES (?, ?, ?, ?)";
            
            PreparedStatement preparedStmt = conn.prepareStatement(sql);
            
            
           
            preparedStmt.setString(1, username);
            preparedStmt.setString(2, name);
            preparedStmt.setString(3,soyisim);
            preparedStmt.setString(4,password);
            
            preparedStmt.executeUpdate();
            conn.close();
            
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
    
    public int login(String username, String password)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            PreparedStatement pst = conn.prepareStatement("Select * from users where username=? and sifre=?");
            pst.setString(1, username);
            pst.setString(2, password);
            
            ResultSet rs = pst.executeQuery();
            
            rs.next();
            int foundType = rs.getInt(1);
            System.out.print(foundType);
            
            return foundType;
            
        }
        catch(SQLException se)
        {
            se.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return 0;
    }
    
   public static void main(String[] args) 
   {
       Database db = new Database();
       
       
       db.login("asdasdasd", "sadasdasdasd");
      
       
   
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTnumber() {
        return tnumber;
    }

    public void setTnumber(String tnumber) {
        this.tnumber = tnumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getKullanıcı_id() {
        return kullanıcı_id;
    }

    public void setKullanıcı_id(int kullanıcı_id) {
        this.kullanıcı_id = kullanıcı_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSoyisim() {
        return soyisim;
    }

    public void setSoyisim(String soyisim) {
        this.soyisim = soyisim;
    }
 



   
}
