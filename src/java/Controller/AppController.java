/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;
import Model.AppModel;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author x3me9
 */
public class AppController extends HttpServlet {

Connection conn;



    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
            Class.forName(config.getInitParameter("jdbcClassName"));
            String username = config.getInitParameter("dbUserName");
            String password = config.getInitParameter("dbPassword");
           String url = config.getInitParameter("jdbcDriverURL") 
                + "://" 
                + config.getInitParameter("dbHostName") 
                + ":" 
                + config.getInitParameter("dbPort") 
                + "/" 
                + config.getInitParameter("databaseName")
                + config.getInitParameter("useSSL");
            conn = DriverManager.getConnection(url, username, password); 
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }
    }




    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
String item;
String description;
String source;
String price;
String selectDate;
 int instruction = Integer.parseInt(request.getParameter("instruction"));
switch(instruction) {
  case 1:
    selectDate = request.getParameter("selectDate");
               if (conn != null) {
                 AppModel db = new AppModel();     
                 ResultSet records = db.retrieveData(selectDate, conn);
                if (records != null){
                    request.setAttribute("results", records);
                    request.getRequestDispatcher("ExpensesTable.jsp?selectDate="+selectDate).forward(request, response);
                       }
                else{ response.sendRedirect("NoItemsPage.jsp?selectDate="+selectDate);
                      }


  } else {
               response.sendRedirect("ErrorConnection.jsp");
            
                    } 
    break;
  case 2:
         item = request.getParameter("item"); 
         description = request.getParameter("description"); 
         source = request.getParameter("source"); 
         price = request.getParameter("price"); 
         selectDate = request.getParameter("selectDate").replace("%0D%0A", "").replaceAll("\\s", "");
         if (conn != null) {
                AppModel insertEntry = new AppModel();    
                 try {
           String Yes = insertEntry.insertData(item, description, source, price, selectDate, conn);

if("Yes".equals(Yes)){
 response.sendRedirect("AppController?instruction=1&selectDate="+selectDate);
                 }
else{
 response.sendRedirect("ProcessUnsuccessful.jsp");
}  


            } catch (SQLException ex) {
                Logger.getLogger(AppController.class.getName()).log(Level.SEVERE, null, ex);
            }
           } else {
               response.sendRedirect("ErrorConnection.jsp");
            
                    } 
           
    break;
  case 3:
         item = request.getParameter("item"); 
         description = request.getParameter("description"); 
         source = request.getParameter("source"); 
         price = request.getParameter("price"); 
         selectDate = request.getParameter("selectDate").replace("%0D%0A", "").replaceAll("\\s", "");
         int id = Integer.parseInt(request.getParameter("idNumber"));
         if (conn != null) {
                AppModel updateEntry = new AppModel();    
               try {
           String Yes = updateEntry.updateData(id, item, description, source, price, selectDate, conn);

if("Yes".equals(Yes)){
 response.sendRedirect("AppController?instruction=1&selectDate="+selectDate);
                 }
else{
 response.sendRedirect("ProcessUnsuccessful.jsp");
}  


            } catch (SQLException ex) {
                Logger.getLogger(AppController.class.getName()).log(Level.SEVERE, null, ex);
            }
           
           } else {
               response.sendRedirect("ErrorConnection.jsp");
            
                    } 

      
    break;
  case 4:
          id = Integer.parseInt(request.getParameter("idNumber"));
     selectDate = request.getParameter("selectDate");
          
            if (conn != null) { 
               AppModel deleteEntry = new AppModel();    
               String Yes =  deleteEntry.deleteData(id, conn);
           if( "Yes".equals(Yes)){
 response.sendRedirect("AppController?instruction=1&selectDate="+selectDate);
                 }
else{
response.sendRedirect("ProcessUnsuccessful.jsp");
}
           
            } else {
               response.sendRedirect("ErrorConnection.jsp");
            
                    } 
    break;
  default:
    response.sendRedirect("ProcessUnsuccessful.jsp");
}

    }


 // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}