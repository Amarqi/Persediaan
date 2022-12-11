<%-- 
    Document   : laporan
    Created on : Apr 12, 2020, 10:05:10 PM
    Author     : AMARQI
--%>

<%@page import="control.koneksi"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="beranda.jsp?hal=tampil-brg" method="post">
                 Masukan Barcode :
                <input type="text" name="cari" value="" />
                <input type="submit" value="Cari" class="button"/>
            </form>
        <center>
        <table border="1">
            <tbody>
                <tr>
                    <th>Barcode</th>
                    <th>Nama Barang</th>
                    <th>Jenis Barang</th>
                    <th>Pilihan</th>
                </tr>
                <%
                   String barcode=null, namabarang=null, jenis=null, cari=request.getParameter("cari");
                   if (cari==null){cari ="";}
                   ResultSet rs=null;
                   
                   koneksi kon=new koneksi();
                   rs = kon.stmt.executeQuery("SELECT * FROM barang where barcode like '%"+cari+"%' ");
                   while(rs.next()) {
                       barcode=rs.getString("barcode");
                       namabarang=rs.getString(2);
                       jenis=rs.getString(3);
                 %>   
                <tr>
                    <td><% out.println(barcode);%></td>
                    <td><% out.println(namabarang);%></td>
                    <td><% out.println(jenis);%></td>
                    <td><a href="beranda.jsp?hal=ubah-barang&barcode=<% out.print(barcode);%>">EDIT</a></td>
                </tr>
                <% } %>
                <tr>
                    <td colspan="5" align="center"><h3><a href="beranda.jsp?hal=barang">Tambah Data</a></h3></td>
                </tr>
            </tbody>
        </table></center>
        <%kon.close();%>
    </body>
</html>
