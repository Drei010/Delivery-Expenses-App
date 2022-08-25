/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class AppModel {
    public ResultSet retrieveData(String selectDate, Connection conn){
            try { 
             String query = "SELECT * FROM EXPENSES WHERE DATERECIEVED = ?";
             PreparedStatement stmnt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
             stmnt.setString(1, selectDate);
             ResultSet records = stmnt.executeQuery();
           if(records.next()) {
                records.beforeFirst();
                return records;
               
            }stmnt.close();
            }catch (SQLException ex){
                Logger.getLogger(AppModel.class.getName()).log(Level.SEVERE,null,ex);
            }

    return null;
      }
    public String deleteData(int id, Connection conn){
             String sql ="DELETE FROM EXPENSES WHERE ID = ?";
              try {
            PreparedStatement stmnt = conn.prepareStatement(sql);
            stmnt.setInt(1,id);
            stmnt.executeUpdate();
            stmnt.close();
    return "Yes";
                }catch (SQLException ex){
                    Logger.getLogger(AppModel.class.getName()).log(Level.SEVERE,null,ex);
                }
        return null;
          }

     public String insertData(String item, String description, String source, String price, String selectDate, Connection conn) throws SQLException {
           String sql = "INSERT INTO EXPENSES (ITEM, DESCRIPTION, ITEMSOURCE, PRICE, DATERECIEVED) VALUES ( ?, ?, ?, ?, ?)";
         PreparedStatement stmnt = conn.prepareStatement(sql);
         try {
             stmnt.setString(1, item);
             stmnt.setString(2, description);
             stmnt.setString(3, source);
             stmnt.setDouble(4, Double.parseDouble(price));
             stmnt.setString(5, selectDate);
             stmnt.executeUpdate();
             stmnt.close();
    return "Yes";
    }catch (SQLException ex){
                    Logger.getLogger(AppModel.class.getName()).log(Level.SEVERE,null,ex);
                }
            return null;

    }

     public String updateData(int id, String item, String description, String source, String price, String selectDate, Connection conn) throws SQLException {
              String sql = "UPDATE EXPENSES SET ITEM = ?, DESCRIPTION = ?, ITEMSOURCE = ?, PRICE = ?, DATERECIEVED = ? WHERE ID = ?";
            PreparedStatement stmnt = conn.prepareStatement(sql);
             try {
             stmnt.setString(1, item);
             stmnt.setString(2, description);
             stmnt.setString(3, source);
             stmnt.setDouble(4, Double.parseDouble(price));
             stmnt.setString(5, selectDate);
             stmnt.setInt(6, id);
             stmnt.executeUpdate();
             stmnt.close();
             return "Yes";
    }catch (SQLException ex){
                    Logger.getLogger(AppModel.class.getName()).log(Level.SEVERE,null,ex);
                }
            return null;

    }




}

