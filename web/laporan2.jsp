<%-- 
    Document   : kembali
    Created on : Mar 21, 2020, 3:49:22 PM
    Author     : AMARQI
--%>

<%@page import="model.persediaan"%>
<%@page import="control.koneksi"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <form action="beranda2.jsp?hal=laporan2" method="post">
                Masukan Barcode :
                <input type="text" name="cari" value="" />
                <input type="submit" value="Cari" class="button"/>
            </form>
<table border="0">
    <tr class="head">
    <th colspan="6"><center>Pilih Persediaan</center></th>
    </tr>
    <tr class="head">
        <td>Id Gudang</td>
        <td>Barcode</td>
        <td>Stok</td>
        <td>HPP</td>
        <td>Total</td>
        <td>Action</td>
    </tr>
    <%
        String cari=request.getParameter("cari");
        if (cari==null){cari="";}
        ResultSet rs = null;
        koneksi kon = new koneksi();
        rs = kon.stmt.executeQuery("SELECT * from gudang where barcode like '%"+cari+"%'");
         while (rs.next()){
               out.println("<tr class=isi>"
               + "<td>" + rs.getString(1) +"</a></td>"
               + "<td>" + rs.getString(2) + "</td>"
               + "<td>" + rs.getString(3) + "</td>"
               + "<td>" + rs.getString(4) + "</td>"
               + "<td>" + rs.getString(5) + "</td>"
               + "<td><a href=beranda2.jsp?hal=hapus&id=" + rs.getString(1) + ">Hapus Data</a></td>"
               + "</tr>");
         }
    %>
</table>