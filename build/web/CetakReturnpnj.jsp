<%@page import="java.sql.ResultSet"%>
<%@page import="control.koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Pilih Transaksi</h3>
        <table>
    <tr>
    <form action="beranda2.jsp?hal=laporan-returpnj" method="post">
    <input type="text" name="cari" value="" />
    <input type="submit" value="Cari" class="button"/>
    </form>
                </tr>
    <tr class="head">
        <td>No Return</td>
        <td>No Keluar</td>
        <td>Keterangan</td>
        <td>Tanggal Return</td>
        <td>Total Return</td>
        <td>Aksi</td>
    </tr>
    <form action="TampilLapReturpnj.jsp">
    <%
        ResultSet rs = null;
        koneksi kon = new koneksi();
        String cari = request.getParameter("cari");
        if (cari==null){cari="";} 
        rs = kon.stmt.executeQuery("SELECT * from returpnj where no_returpnj like '%"+cari+"%'");
         while (rs.next()){
               out.println("<tr class=isi>"
               + "<td>" + rs.getString(1) +"</a></td>"
               + "<td>" + rs.getString(2) + "</td>"
               + "<td>" + rs.getString(3) + "</td>"
               + "<td>" + rs.getString(4) + "</td>"
               + "<td>" + rs.getString(5) + "</td>"
               + "<input type='hidden' name='no_returpnj' value=" + rs.getString(1) + ">"
               + "<td><input type='submit' value='Tampil'></td>"
               + "</tr>"); 
         }
    %>
</table>
    </form>
    </body>
</html>
