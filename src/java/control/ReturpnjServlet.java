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
import model.barangmsk;
import model.returpnj;

/**
 *
 * @author HELLO
 */
public class ReturpnjServlet extends HttpServlet {

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
            returpnj rpnj = new returpnj();
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
                        rpnj.setNo_returpnj(request.getParameter("no_returpnj"));
                        rpnj.setNo_keluar(request.getParameter("no_keluar"));
                        rpnj.setKet_returpnj(request.getParameter("ket_pnj"));
                        rpnj.setBarcode(request.getParameter("barcode"));
                        rpnj.setHarga_returpnj(Double.parseDouble(request.getParameter("harga")));
                        rpnj.setTgl_returpnj(request.getParameter("tgl_retur"));
                        rpnj.setJml_returpnj(Double.parseDouble(request.getParameter("jml_return")));
                        rpnj.setTotal_returpnj(Double.parseDouble(request.getParameter("sub")));
                        String barcode = rpnj.getBarcode();
                        ResultSet rs = null;
                        String total=null;
                        String stok=null;
    rs = kon.stmt.executeQuery("SELECT * FROM gudang where barcode = '" + barcode + "'");
          if (rs.next()) 
          {
              total=rs.getString("total");
              stok=rs.getString("stok");
          }
          double hasil_stok = Double.parseDouble(stok) + rpnj.getJml_returpnj();
          double hasil_tot = Double.parseDouble(total) + rpnj.getTotal_returpnj();
          double hasil_hpp = hasil_tot/hasil_stok;
          msk.setHpp(Math.ceil(hasil_hpp));
          msk.setStok(hasil_stok);
          msk.setTotal(hasil_tot);
                        pstmt = kon.conn.prepareStatement
        ("INSERT INTO returpnj values ('" + rpnj.getNo_returpnj()+ "','"
                                +rpnj.getNo_keluar()+ "','"
                                +rpnj.getKet_returpnj()+ "','"
                                +rpnj.getTgl_returpnj()+ "','"
                                +rpnj.getTotal_returpnj()+ "')");
                        result = pstmt.executeUpdate();
                        pstmt1 = kon.conn.prepareStatement
        ("INSERT INTO detail_returpnj values ('" + rpnj.getNo_returpnj()+ "','"
                                +rpnj.getBarcode()+ "','"
                                +rpnj.getJml_returpnj()+ "','"
                                +rpnj.getHarga_returpnj()+ "')");
                        result1 = pstmt1.executeUpdate();
                        pstmt2=kon.conn.prepareStatement
        ("UPDATE gudang SET stok='"
                +msk.getStok()+"',hpp='"
                +msk.getHpp()+"',total='"
                +msk.getTotal()+"'where barcode='"
                +rpnj.getBarcode()+"'");
                
                        result2 = pstmt2.executeUpdate();
                        if (result + result1 + result2 > 0) {
                            out.println("<script>"
                            +"alert('Data Telah Ditambahkan');"
                            +"document.location='beranda2.jsp?hal=retur-penjualan';"
                            +"</script>");
                        }
                        break;
                default:
                }
            }
            else { out.println ("<script>"
                     +"alert('Gagal Eksekusi');"
                     +"document.location='beranda2.jsp?hal=retur-penjualan';"
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
            Logger.getLogger(ReturpnjServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReturpnjServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ReturpnjServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReturpnjServlet.class.getName()).log(Level.SEVERE, null, ex);
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
