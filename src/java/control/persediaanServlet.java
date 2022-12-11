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
import model.persediaan;

/**
 *
 * @author AMARQI
 */
public class persediaanServlet extends HttpServlet {

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
            persediaan per = new persediaan();
            koneksi kon=new koneksi();
            PreparedStatement pstmt=null;
            PreparedStatement pstmt1=null;
            int result = 0;
            int result1 = 0;
            String aksi = request.getParameter("aksi");
            if (aksi !=null) {
                switch (aksi) {
                    case "Simpan":
                        per.setNama(request.getParameter("nama"));
                        per.setId_gudang(request.getParameter("id_gudang"));
                        per.setBarcode(request.getParameter("barcode"));
                        per.setJenis(request.getParameter("jenis"));
                        per.setStok(Double.parseDouble(request.getParameter("stok")));
                        per.setHpp(Double.parseDouble(request.getParameter("hpp")));
                        per.setTotal(Double.parseDouble(request.getParameter("total")));
                        pstmt = kon.conn.prepareStatement
        ("INSERT INTO barang values ('" + per.getBarcode()+ "','"
                                +per.getNama()+ "','"
                                +per.getJenis()+ "')");
                        result = pstmt.executeUpdate();
                        pstmt1 = kon.conn.prepareStatement
        ("INSERT INTO gudang values ('" + per.getId_gudang()+ "','"
                                +per.getBarcode()+ "','"
                                +per.getStok()+ "','"
                                +per.getHpp()+ "','"
                                +per.getTotal()+ "')");
                        result1 = pstmt1.executeUpdate();
                        if (result + result1 > 0) {
                            out.println("<script>"
                            +"alert('Data Telah Ditambahkan');"
                            +"document.location='beranda.jsp?hal=tampil-brg';"
                            +"</script>");
                        }
                        break;
                
                    case "Delete":
                        per.setId_gudang(request.getParameter("id"));
                        per.setBarcode(request.getParameter("barcode"));
                        pstmt=kon.conn.prepareStatement
        ("DELETE FROM gudang where id_gudang='"+per.getId_gudang()+"'");
                        result = pstmt.executeUpdate();
                        pstmt1=kon.conn.prepareStatement
        ("DELETE FROM barang where barcode='"+per.getBarcode()+"'");
                        result1 = pstmt1.executeUpdate();
                        if (result + result1 > 0) {
                        out.println("<script>"
                            +"alert('Data Telah Dihapus');"
                            +"document.location='beranda2.jsp?hal=laporan2';"
                            +"</script>");    
                        }
                        break;
                    case "Update":
                        per.setBarcode(request.getParameter("barcode"));
                        per.setNama(request.getParameter("nama"));
                        per.setJenis(request.getParameter("jenis"));
                        pstmt=kon.conn.prepareStatement("UPDATE barang SET nama_barang= '"
                                + per.getNama() + "',jenis_brg='"
                                + per.getJenis() + "' where barcode='"
                                + per.getBarcode()+ "'");
                        result = pstmt.executeUpdate();
                    if(result>0) {
                        out.println("<script>"
                        + "alert('Data Berhasil Diubah');"
                        +"document.location='beranda.jsp?hal=tampil-brg';"
                        +"</script>");
                    }
                        break;
                    default:
                        break;
                }
            }
            else { out.println ("<script>"
                     +"alert('Gagal Eksekusi');"
                     +"document.location='sewa.jsp';"
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
            Logger.getLogger(persediaanServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(persediaanServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(persediaanServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(persediaanServlet.class.getName()).log(Level.SEVERE, null, ex);
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
