package model;

/**
 *
 * @author mete
 */
import java.sql.*;
import java.util.ArrayList;
import static model.Database.conn;

public class veri_işlemleri {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";    
    static final String DB_URL = "jdbc:mysql://localhost:3306/contactmanager?useUnicode=yes&characterEncoding=UTF-8";
    static final String USER = "mete";
    static final String PASS = "metemete";
    static Connection conn = null;
    static Statement stmt = null;
    
    public void getir(int kullanıcı_id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            String sql = "Select * from contacts where kullanıcı_id=?";
            
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, kullanıcı_id);
            ResultSet rs = pst.executeQuery();
            int sil = 1;
            while (rs.next()) {
                int geçici = rs.getInt(1);
                System.out.print(rs.getInt(1));
                System.out.print(": ");
                System.out.println(rs.getString(2));
                System.out.print(": ");
                System.out.println(rs.getString(3));
                System.out.print(": ");
                System.out.println(rs.getString(4));
                if (sil == 1) {
                    String sql1 = "delete  from contacts where kullanıcı_id=?";
                    PreparedStatement pst1 = conn.prepareStatement(sql1);
                    pst1.setInt(1, geçici);
                    pst1.execute();
                    System.out.print("silindi");
                }
                
            }
            
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {
        veri_işlemleri v = new veri_işlemleri();
        v.getir(2);
    }
}
