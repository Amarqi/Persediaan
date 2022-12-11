<%-- 
    Document   : detail_sewa
    Created on : Dec 7, 2019, 10:58:14 AM
    Author     : AMARQI
--%>

<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%@page import="model.barangmsk"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String tgl_masuk=null;
String total_msk=null;
barangmsk msk = new barangmsk();
msk.setNo_masuk(request.getParameter("no_masuk"));
ResultSet rs = null;
koneksi kon = new koneksi();
rs = kon.stmt.executeQuery("SELECT * FROM barang_msk where no_masuk='"+msk.getNo_masuk()+"'");
             if(rs.next())
             {
                 tgl_masuk=rs.getString("tgl_msk");
                 total_msk=rs.getString("total_msk");
             }
%>
<table border="2" cellpadding="0" cellspacing="0">
    <tr>
    <td colspan="6"><h3>Tanggal Masuk: <%out.print(tgl_masuk);%></h3></td>
    </tr>
    <tr>
    <td><b>No Masuk</b></td>
    <td><b>Kode Barang</b></td>
    <td><b>Nama Barang</b></td>
    <td><b>Jumlah Barang</b></td>
    <td><b>Harga Satuan</b></td>
    <td><b>Total Harga</b></td>
    </tr>
    <%
        rs = kon.stmt.executeQuery("SELECT detail_msk.no_masuk, detail_msk.barcode, detail_msk.jml_msk, detail_msk.harga_msk, barang.nama_barang "
                 + "FROM detail_msk, barang "
                 + "where detail_msk.barcode=barang.barcode and detail_msk.no_masuk='"+msk.getNo_masuk()+"'");
        while (rs.next()) {
               out.println("<tr class=isi>"
                             + "<td>" + rs.getString("no_masuk") + "</td>"
                             + "<td>" + rs.getString("barcode") + "</td>"
                             + "<td>" + rs.getString("nama_barang") + "</td>"
                             + "<td>" + rs.getString("jml_msk") + "</td>"
                             + "<td>" + rs.getString("harga_msk") + "</td>"
                             );
        }
    %>
<td><% out.print(total_msk); %></td>
</tr>
<tr>
    <td colspan="6"><center> <a href="beranda.jsp?hal=barang-msk">Kembali</a></center></td>
</tr>
</table>