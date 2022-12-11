<%-- 
    Document   : detail_sewa
    Created on : Dec 7, 2019, 10:58:14 AM
    Author     : AMARQI
--%>

<%@page import="model.barangklr"%>
<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%@page import="model.barangmsk"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String tgl_klr=null;
String total_klr=null;
barangklr klr = new barangklr();
klr.setNo_keluar(request.getParameter("no_keluar"));
ResultSet rs = null;
koneksi kon = new koneksi();
rs = kon.stmt.executeQuery("SELECT * FROM barang_klr where no_keluar='"+klr.getNo_keluar()+"'");
             if(rs.next())
             {
                 tgl_klr=rs.getString("tgl_klr");
                 total_klr=rs.getString("total_klr");
             }
%>
<table border="2" cellpadding="0" cellspacing="0">
    <tr>
    <td colspan="6"><h3>Tanggal Masuk: <%out.print(tgl_klr);%></h3></td>
    </tr>
    <tr>
    <td><b>No Keluar</b></td>
    <td><b>Kode Barang</b></td>
    <td><b>Nama Barang</b></td>
    <td><b>Jumlah Barang</b></td>
    <td><b>Harga Satuan</b></td>
    <td><b>Total Harga</b></td>
    </tr>
    <%
        rs = kon.stmt.executeQuery("SELECT detail_klr.no_keluar, detail_klr.barcode, detail_klr.jml_klr, detail_klr.harga_klr, barang.nama_barang "
                 + "FROM detail_klr, barang "
                 + "where detail_klr.barcode=barang.barcode and detail_klr.no_keluar='"+klr.getNo_keluar()+"'");
        while (rs.next()) {
               out.println("<tr class=isi>"
                             + "<td>" + rs.getString("no_keluar") + "</td>"
                             + "<td>" + rs.getString("barcode") + "</td>"
                             + "<td>" + rs.getString("nama_barang") + "</td>"
                             + "<td>" + rs.getString("jml_klr") + "</td>"
                             + "<td>" + rs.getString("harga_klr") + "</td>"
                             );
        }
    %>
<td><% out.print(total_klr); %></td>
</tr>
<tr>
    <td colspan="6"><center> <a href="beranda.jsp?hal=barang-klr">Kembali</a></center></td>
</tr>
</table>