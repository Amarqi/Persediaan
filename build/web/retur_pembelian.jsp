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
<td colspan="4">
    <form action="beranda2.jsp?hal=retur-pembelian" method="post">
    <input type="text" name="cari" value="" />
    <input type="submit" value="Cari" class="button"/>
    </form>
</td>
    </tr>
    <tr class="head">
        <td>NO Masuk</td>
        <td>Barcode</td>
        <td>Tanggal masuk</td>
        <td>User</td>
        <td>Supplier</td>
        <td>Jumlah</td>
        <td>harga</td>
        <td>Total</td>
        <td>Action</td>
    </tr>
    <%
        String cari = request.getParameter("cari");
        ResultSet rs = null;
        koneksi kon = new koneksi();
        rs = kon.stmt.executeQuery("SELECT * from barang_msk, detail_msk where barang_msk.no_masuk=detail_msk.no_masuk and barang_msk.no_masuk like '%"+cari+"%'");
         while (rs.next()){
               out.println("<tr class=isi>"
               + "<td>" + rs.getString("no_masuk") +"</a></td>"
               + "<td>" + rs.getString("barcode") + "</td>"
               + "<td>" + rs.getString("tgl_msk") + "</td>"
               + "<td>" + rs.getString("id_user") + "</td>"
               + "<td>" + rs.getString("kode_supp") + "</td>"
               + "<td>" + rs.getString("jml_msk") + "</td>"
               + "<td>" + rs.getString("harga_msk") + "</td>"
               + "<td>" + rs.getString("total_msk") + "</td>"
               + "<td><a href=beranda2.jsp?hal=retur-pem&no_masuk=" + rs.getString(1) + ">Return Pembelian</a></td>"
               + "</tr>");
         }
    %>
</table>
<br>
<table>
    <tr class="head">
    <th colspan="6"><center>Return pembelian</center></th>
    </tr>
    <tr class="head">
        <td>No Return</td>
        <td>No masuk</td>
        <td>Keterangan</td>
        <td>Tanggal Return</td>
        <td>Total Return</td>
        <td>Detail</td>
    </tr>
    <%
        rs = kon.stmt.executeQuery("SELECT * from returpem order by no_returpem desc");
         while (rs.next()){
               out.println("<tr class=isi>"
               + "<td>" + rs.getString(1) +"</a></td>"
               + "<td>" + rs.getString(2) + "</td>"
               + "<td>" + rs.getString(3) + "</td>"
               + "<td>" + rs.getString(4) + "</td>"
               + "<td>" + rs.getString(5) + "</td>"
               + "<td><a href=beranda2.jsp?hal=detail-retpem&no_returpem=" + rs.getString(1) + ">Lihat Detail</a></td>"
               + "</tr>");
         }
    %>
</table>