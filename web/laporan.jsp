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
        <form action="beranda.jsp?hal=laporan" method="post">
                 Masukan Barcode :
                <input type="text" name="cari" value="" />
                <input type="submit" value="Cari" class="button"/>
            </form>
        <center>
        <table border="1">
            <tbody>
                <tr>
                    <th>ID Gudang</th>
                    <th>Barcode</th>
                    <th>Stok Akhir</th>
                    <th>HPP</th>
                    <th>Total</th>
                </tr>
                <%
                   String id_gudang=null, barcode=null, stok=null, hpp=null, total=null, cari=request.getParameter("cari");
                   if (cari==null){cari="";}
                   ResultSet rs=null;
                   
                   koneksi kon=new koneksi();
                   rs = kon.stmt.executeQuery("SELECT * FROM gudang where barcode like '%"+cari+"%'");
                   while(rs.next()) {
                       id_gudang=rs.getString(1);
                       barcode=rs.getString(2);
                       stok=rs.getString(3);
                       hpp=rs.getString(4);
                       total=rs.getString(5);
                 %>   
                <tr>
                    <td><% out.println(id_gudang);%></td>
                    <td><% out.println(barcode);%></td>
                    <td><% out.println(stok);%></td>
                    <td>Rp.<% out.println(hpp);%></td>
                    <td>Rp.<% out.println(total);%></td>
                </tr>
                <% } %>
                <% String semua=null;
                    rs = kon.stmt.executeQuery("SELECT SUM(total) as semua FROM gudang where barcode like '%"+cari+"%'");
                   while(rs.next()) {
                       semua=rs.getString("semua");%>
                       <tr>
                       <th colspan="4"> Total Nilai Barang Dagang</th>
                       <th>Rp.<% out.println(semua);%></th>
                       </tr>
                       <% } %>
            </tbody>
        </table>
        </center>
        <%kon.close();%>
    </body>
</html>
