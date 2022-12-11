/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.user;

/**
 *
 * @author HELLO
 */
public class userServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            user user = new user();
            koneksi kon = new koneksi();
            PreparedStatement pstmt = null;
            int result = 0;
            
            String aksi = request.getParameter("aksi");
            if (aksi !=null) {
                switch (aksi) {
                    case "Simpan":
                        user.setId_user(request.getParameter("id_user"));
                        user.setNm_user(request.getParameter("nm_user"));
                        user.setHak_akses(request.getParameter("hak_akses"));
                        user.setPass(request.getParameter("pass"));
                        pstmt = kon.conn.prepareStatement("INSERT INTO user values('" + user.getId_user()+ "','"
                                 + user.getNm_user()+ "','" 
                                 + user.getHak_akses()+ "','" 
                                 + user.getPass()+ "')");
                        result = pstmt.executeUpdate();
                        if (result > 0) {
                            out.println("<script>"
                        + "alert('Data Berhasil Disimpan');"
                        +"document.location='beranda2.jsp?hal=tampil-user';"
                        +"</script>");
                        }
                        break;
                
                    case "Delete":
                        user.setId_user(request.getParameter("id_user"));
                        pstmt=kon.conn.prepareStatement
        ("DELETE FROM user where id_user='"+user.getId_user()+"'");
                        result = pstmt.executeUpdate();
                        if (result >0) {
                        out.println("<script>"
                            +"alert('Data Telah dihapus');"
                            +"document.location='beranda2.jsp?hal=tampil-user';"
                            +"</script>");    
                        }
                        break;
                        
                        
                    case "Update":
                        user.setId_user(request.getParameter("id_user"));
                        user.setNm_user(request.getParameter("nm_user"));
                        user.setHak_akses(request.getParameter("hak_akses"));
                        user.setPass(request.getParameter("pass"));
                        pstmt = kon.conn.prepareStatement("UPDATE user SET nm_user='"
                                + user.getNm_user()+ "',hak_akses='"
                                + user.getHak_akses()+ "',pass='"
                                + user.getPass()+ "'where id_user='"
                                + user.getId_user()+ "'");
                        result = pstmt.executeUpdate();
                        if (result > 0) {
                            out.println("<script>"
                        + "alert('Data Berhasil ubah');"
                        +"document.location='beranda2.jsp?hal=tampil-user';"
                        +"</script>");
                        }
                    default:
                        break;
                }
            
            } else {
                out.println("<script>"
                        + "alert('Gagal Eksekusi');"
                        +"document.location='beranda2.jsp?hal=tampil-user';"
                        +"</script>");
            }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
