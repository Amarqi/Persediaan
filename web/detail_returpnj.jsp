<%-- 
    Document   : detail_sewa
    Created on : Dec 7, 2019, 10:58:14 AM
    Author     : AMARQI
--%>

<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%@page import="model.returpnj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String tgl_returpnj=null;
String total_returpnj=null;
returpnj retpnj = new returpnj();
retpnj.setNo_returpnj(request.getParameter("no_returpnj"));
ResultSet rs = null;
koneksi kon = new koneksi();
rs = kon.stmt.executeQuery("SELECT * FROM returpnj where no_returpnj='"+retpnj.getNo_returpnj()+"'");
             if(rs.next())
             {
                 tgl_returpnj=rs.getString("tgl_returpnj");
                 total_returpnj=rs.getString("total_returpnj");
             }
%>
<table border="2" cellpadding="0" cellspacing="0">
    <tr>
    <td colspan="6"><h3>Tanggal Masuk: <%out.print(tgl_returpnj);%></h3></td>
    </tr>
    <tr>
    <td><b>No Return Pembelian</b></td>
    <td><b>Kode Barang</b></td>
    <td><b>Nama Barang</b></td>
    <td><b>Jumlah Barang</b></td>
    <td><b>Harga Satuan</b></td>
    <td><b>Total Harga</b></td>
    </tr>
    <%
        rs = kon.stmt.executeQuery("SELECT detail_returpnj.no_returpnj, detail_returpnj.barcode, detail_returpnj.jml_returpnj, detail_returpnj.harga_returpnj, barang.nama_barang "
                 + "FROM detail_returpnj, barang "
                 + "where detail_returpnj.barcode=barang.barcode and detail_returpnj.no_returpnj='"+retpnj.getNo_returpnj()+"'");
        while (rs.next()) {
               out.println("<tr class=isi>"
                             + "<td>" + rs.getString("no_returpnj") + "</td>"
                             + "<td>" + rs.getString("barcode") + "</td>"
                             + "<td>" + rs.getString("nama_barang") + "</td>"
                             + "<td>" + rs.getString("jml_returpnj") + "</td>"
                             + "<td>" + rs.getString("harga_returpnj") + "</td>"
                             );
        }
    %>
<td><% out.print(total_returpnj); %></td>
</tr>
<tr>
    <td colspan="6"><center> <a href="beranda2.jsp?hal=retur-penjualan">Kembali</a></center></td>
</tr>
</table>