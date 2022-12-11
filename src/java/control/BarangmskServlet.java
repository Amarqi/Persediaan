/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.barangmsk;

/**
 *
 * @author AMARQI
 */
public class BarangmskServlet extends HttpServlet {

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
            barangmsk msk = new barangmsk();
            koneksi kon=new koneksi();
            PreparedStatement pstmt=null;
            PreparedStatement pstmt1=null;
            PreparedStatement pstmt2=null;
            int result = 0;
            int result1 = 0;
            int result2 = 0;
            String aksi = request.getParameter("aksi");
            if (aksi !=null) {
                switch (aksi) {
                    case "Simpan":
                        msk.setKode_brg(request.getParameter("barang"));
                        msk.setNo_masuk(request.getParameter("no_masuk"));
                        msk.setKode_supp(request.getParameter("supplier"));
                        msk.setUser(request.getParameter("user"));
                        msk.setTgl_msk(request.getParameter("tgl_msk"));
                        msk.setJml_msk(Double.parseDouble(request.getParameter("jml_msk")));
                        msk.setHarga_msk(Double.parseDouble(request.getParameter("harga_msk")));
                        msk.setTotal_msk(Double.parseDouble(request.getParameter("sub")));
                        String barcode = msk.getKode_brg();
                        ResultSet rs = null;
                        String total=null;
                        String stok=null;
    rs = kon.stmt.executeQuery("SELECT * FROM gudang where barcode = '" + barcode + "'");
          if (rs.next()) 
          {
              total=rs.getString("total");
              stok=rs.getString("stok");
          }
          double hasil_stok = msk.getJml_msk() + Double.parseDouble(stok);
          double hasil_tot = msk.getTotal_msk() + Double.parseDouble(total);
          double hasil_hpp = hasil_tot/hasil_stok;
          msk.setHpp(Math.ceil(hasil_hpp));
          msk.setStok(hasil_stok);
          msk.setTotal(hasil_tot);
                        pstmt = kon.conn.prepareStatement
        ("INSERT INTO barang_msk values ('" + msk.getNo_masuk()+ "','"
                                +msk.getUser()+ "','"
                                +msk.getKode_supp()+ "','"
                                +msk.getTgl_msk()+ "','"
                                +msk.getTotal_msk()+ "')");
                        result = pstmt.executeUpdate();
                        pstmt1 = kon.conn.prepareStatement
        ("INSERT INTO detail_msk values ('" + msk.getNo_masuk()+ "','"
                                +msk.getKode_brg()+ "','"
                                +msk.getJml_msk()+ "','"
                                +msk.getHarga_msk()+ "')");
                        result1 = pstmt1.executeUpdate();
                        pstmt2=kon.conn.prepareStatement
        ("UPDATE gudang SET stok='"
                +msk.getStok()+"',hpp='"
                +msk.getHpp()+"',total='"
                +msk.getTotal()+"'where barcode='"
                +msk.getKode_brg()+"'");
                
                        result2 = pstmt2.executeUpdate();
                        if (result + result1 + result2 > 0) {
                            out.println("<script>"
                            +"alert('Data Telah Ditambahkan');"
                            +"document.location='beranda.jsp?hal=barang-msk';"
                            +"</script>");
                        }
                        break;
                default:
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
            Logger.getLogger(BarangmskServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BarangmskServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(BarangmskServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BarangmskServlet.class.getName()).log(Level.SEVERE, null, ex);
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
