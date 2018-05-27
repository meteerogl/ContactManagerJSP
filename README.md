Maven kullandım pom.xml dosyası içerisinde gerekli olan kütüphaneler mevcut.
Yapılması gereken sadece bir web server herneyse kurup çalıştırmak.
Ek olarak kullanılan veritabanı contactmanager.sql dosyası mevcut.

Birde src/main/java/model/Database.java dosyası içerisinden kullandığınız veritabanı bilgilerini güncellemeniz gerekiyor.


    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/contactmanager?useUnicode=yes&characterEncoding=UTF-8"; 
    static final String USER = "mete";      
    static final String PASS = "metemete";  
    
    
 Ayrıca dosya içerisinde veritabanı işlemlerini test etmek için yazdığım methodlar ve değişkenler var kullanılmayanlar var
 ama bırakmak istedim kullanırsınız belki :) 
