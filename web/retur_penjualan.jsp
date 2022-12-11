<%--
    Document   : retur_pembelian
    Created on : Oct 27, 2020, 9:54:25 PM
    Author     : HELLO
--%>
<%@page import="model.returpem"%>
<%@page import="control.koneksi"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table>
    <tr class="head">
    <th colspan="5"><center>Cari Transaksi</center></th>
<td colspan="3">
    <form action="beranda2.jsp?hal=retur-penjualan" method="post">
    <input type="text" name="cari" value="" />
    <input type="submit" value="Cari" class="button"/>
    </form>
    </td>
    </tr>
    <tr class="head">
        <td>NO Keluar</td>
        <td>Barcode</td>
        <td>Tanggal keluar</td>
        <td>User</td>
        <td>Jumlah</td>
        <td>harga</td>
        <td>Total</td>
        <td>Action</td>
    </tr>
    <%
        String cari = request.getParameter("cari");
        ResultSet rs = null;
        koneksi kon = new koneksi();
        rs = kon.stmt.executeQuery("SELECT * from barang_klr, detail_klr where barang_klr.no_keluar=detail_klr.no_keluar and barang_klr.no_keluar like '%"+cari+"%'");
         while (rs.next()){
               out.println("<tr class=isi>"
               + "<td>" + rs.getString("no_keluar") +"</a></td>"
               + "<td>" + rs.getString("barcode") + "</td>"
               + "<td>" + rs.getString("tgl_klr") + "</td>"
               + "<td>" + rs.getString("id_user") + "</td>"
               + "<td>" + rs.getString("jml_klr") + "</td>"
               + "<td>" + rs.getString("harga_klr") + "</td>"
               + "<td>" + rs.getString("total_klr") + "</td>"
               + "<td><a href=beranda2.jsp?hal=retur-pnj&no_keluar=" + rs.getString(1) + ">Return Penjualan</a></td>"
               + "</tr>");
         }
    %>
</table>
<br>
<table>
    <tr class="head">
    <th colspan="6"><center>Return penjualan</center></th>
    </tr>
    <tr class="head">
        <td>No Return</td>
        <td>No keluar</td>
        <td>Keterangan</td>
        <td>Tanggal Return</td>
        <td>Total Return</td>
        <td>Detail</td>
    </tr>
    <%
        rs = kon.stmt.executeQuery("SELECT * from returpnj order by no_returpnj desc");
         while (rs.next()){
               out.println("<tr class=isi>"
               + "<td>" + rs.getString(1) +"</a></td>"
               + "<td>" + rs.getString(2) + "</td>"
               + "<td>" + rs.getString(3) + "</td>"
               + "<td>" + rs.getString(4) + "</td>"
               + "<td>" + rs.getString(5) + "</td>"
               + "<td><a href=beranda2.jsp?hal=detail-retpnj&no_returpnj=" + rs.getString(1) + ">Lihat Detail</a></td>"
               + "</tr>");
         }
    %>
</table>