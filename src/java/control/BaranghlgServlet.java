/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.baranghlg;
import model.barangmsk;

/**
 *
 * @author AMARQI
 */
public class BaranghlgServlet extends HttpServlet {

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
            baranghlg hlg = new baranghlg();
            barangmsk msk = new barangmsk();
            koneksi kon=new koneksi();
            PreparedStatement pstmt=null;
            PreparedStatement pstmt1=null;
            int result = 0;
            int result1 = 0;
            String aksi = request.getParameter("aksi");
            if (aksi !=null) {
                switch (aksi) {
                    case "Simpan":
                        hlg.setNo_hilang(request.getParameter("no_hilang"));
                        hlg.setKd_barang(request.getParameter("barang"));
                        hlg.setTanggal(request.getParameter("tgl_pny"));
                        hlg.setKet_hlg(request.getParameter("ket_hlg"));
                        hlg.setJml_hlg(Double.parseDouble(request.getParameter("jml_hlg")));
                        hlg.setHpp(Double.parseDouble(request.getParameter("hpp")));
                        hlg.setTotal_hlg(Double.parseDouble(request.getParameter("sub")));
                        String barcode = hlg.getKd_barang();
                        ResultSet rs = null;
                        String total=null;
                        String stok=null;
    rs = kon.stmt.executeQuery("SELECT * FROM gudang where barcode = '" + barcode + "'");
          if (rs.next()) 
          {
              total=rs.getString("total");
              stok=rs.getString("stok");
          }
          double hasil_stok = Double.parseDouble(stok) - hlg.getJml_hlg();
          double hasil_tot = Double.parseDouble(total) - hlg.getTotal_hlg();
          double hasil_hpp = hasil_tot/hasil_stok;
          if (hasil_stok==0) {hasil_tot=0; hasil_hpp=0;}
          msk.setHpp(Math.ceil(hasil_hpp));
          msk.setStok(hasil_stok);
          msk.setTotal(hasil_tot);
                        pstmt = kon.conn.prepareStatement
        ("INSERT INTO pny_barang values ('" + hlg.getNo_hilang()+ "','"
                                +hlg.getKd_barang()+ "','"
                                +hlg.getTanggal()+ "','"
                                +hlg.getKet_hlg()+ "','"
                                +hlg.getHpp()+ "','"
                                +hlg.getJml_hlg()+ "','"
                                +hlg.getTotal_hlg()+ "')");
                        result = pstmt.executeUpdate();
                        pstmt1=kon.conn.prepareStatement
        ("UPDATE gudang SET stok='"
                +msk.getStok()+"',hpp='"
                +msk.getHpp()+"',total='"
                +msk.getTotal()+"'where barcode='"
                +hlg.getKd_barang()+"'");
                
                        result1 = pstmt1.executeUpdate();
                        if (result + result1 > 0) {
                            out.println("<script>"
                            +"alert('Data Telah Ditambahkan');"
                            +"document.location='beranda2.jsp?hal=barang-hilang';"
                            +"</script>");
                        }
                        break;
                default:
                }
            }
            else { out.println ("<script>"
                     +"alert('Gagal Eksekusi');"
                     +"document.location='beranda2.jsp?hal=barang-hilang';"
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
            Logger.getLogger(BaranghlgServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BaranghlgServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(BaranghlgServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BaranghlgServlet.class.getName()).log(Level.SEVERE, null, ex);
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
