<%-- 
    Document   : detail_sewa
    Created on : Dec 7, 2019, 10:58:14 AM
    Author     : AMARQI
--%>

<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%@page import="model.returpem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String tgl_returpem=null;
String total_returpem=null;
returpem retpem = new returpem();
retpem.setNo_returpem(request.getParameter("no_returpem"));
ResultSet rs = null;
koneksi kon = new koneksi();
rs = kon.stmt.executeQuery("SELECT * FROM returpem where no_returpem='"+retpem.getNo_returpem()+"'");
             if(rs.next())
             {
                 tgl_returpem=rs.getString("tgl_returpem");
                 total_returpem=rs.getString("total_returpem");
             }
%>
<table border="2" cellpadding="0" cellspacing="0">
    <tr>
    <td colspan="6"><h3>Tanggal Masuk: <%out.print(tgl_returpem);%></h3></td>
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
        rs = kon.stmt.executeQuery("SELECT detail_returpem.no_returpem, detail_returpem.barcode, detail_returpem.jml_returpem, detail_returpem.harga_returpem, barang.nama_barang "
                 + "FROM detail_returpem, barang "
                 + "where detail_returpem.barcode=barang.barcode and detail_returpem.no_returpem='"+retpem.getNo_returpem()+"'");
        while (rs.next()) {
               out.println("<tr class=isi>"
                             + "<td>" + rs.getString("no_returpem") + "</td>"
                             + "<td>" + rs.getString("barcode") + "</td>"
                             + "<td>" + rs.getString("nama_barang") + "</td>"
                             + "<td>" + rs.getString("jml_returpem") + "</td>"
                             + "<td>" + rs.getString("harga_returpem") + "</td>"
                             );
        }
    %>
<td><% out.print(total_returpem); %></td>
</tr>
<tr>
    <td colspan="6"><center> <a href="beranda2.jsp?hal=retur-pembelian">Kembali</a></center></td>
</tr>
</table>