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
import model.supplier;

/**
 *
 * @author AMARQI
 */
public class supplierServlet extends HttpServlet {

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
        koneksi kon= new koneksi();
        PreparedStatement pstmt=null;
        supplier supp = new supplier();
        int Result=0;       
            String aksi=request.getParameter("aksi");
            if(aksi !=null){
                supp.setKode_supp(request.getParameter("kode_supp"));
                supp.setNama_supp(request.getParameter("nama_supp"));
                supp.setAlamat(request.getParameter("alamat"));
                supp.setTelp(request.getParameter("telp"));
                switch(aksi){
                    case "Simpan":
                        pstmt=kon.conn.prepareStatement("INSERT INTO supplier Values('"
                                + supp.getKode_supp()+ "','"
                                + supp.getNama_supp()+ "','"
                                + supp.getAlamat()+ "','"
                                + supp.getTelp() + "')");
                        Result = pstmt.executeUpdate();
                    if(Result>0) {
                        out.println("<script>"
                        + "alert('Data Berhasil Ditambahkan');"
                        +"document.location='beranda.jsp?hal=tampil-supp';"
                        +"</script>");
                    }
                        break;
                    case "Delete":
                        pstmt=kon.conn.prepareStatement("DELETE FROM supplier Where kode_supp='"
                                 + supp.getKode_supp()+ "'");
                    Result = pstmt.executeUpdate();
                    if(Result>0) {
                        out.println("<script>"
                        + "alert('Data Berhasil Dihapus');"
                        +"document.location='beranda.jsp?hal=tampil-supp';"
                        +"</script>");
                    }
                        break;
                    case "Update":
                        pstmt=kon.conn.prepareStatement("UPDATE supplier SET nama_supp= '"
                                + supp.getNama_supp() + "',alamat='"
                                + supp.getAlamat() + "',telp='"
                                + supp.getTelp() + "' where kode_supp='"
                                + supp.getKode_supp()+ "'");
                        Result = pstmt.executeUpdate();
                    if(Result>0) {
                        out.println("<script>"
                        + "alert('Data Berhasil Diubah');"
                        +"document.location='beranda.jsp?hal=tampil-supp';"
                        +"</script>");
                    }
                        break;
                    default:
                        break;
                }
            }else{
                out.println("<script>");
                out.println("alert('Gagal Proses')");
                out.println("document.location='beranda.jsp?hal=tampil-supp'");
                out.println("</script>");
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
            Logger.getLogger(supplierServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(supplierServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(supplierServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(supplierServlet.class.getName()).log(Level.SEVERE, null, ex);
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
