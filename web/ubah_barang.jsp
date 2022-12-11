<%-- 
    Document   : editbarang
    Created on : Apr 5, 2020, 10:47:22 PM
    Author     : AMARQI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%
    String barcode=request.getParameter("barcode");;
    String nama_brg=null;
    String jenis_brg=null;
    ResultSet rs = null;
    koneksi kon = new koneksi();
    rs = kon.stmt.executeQuery("SELECT * FROM barang where barcode = '" + barcode + "'");
          if (rs.next()) 
          {
              barcode=rs.getString("barcode");
              nama_brg=rs.getString(2);
              jenis_brg=rs.getString(3);
          }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="persediaanServlet">
            <table border="2">
                <tr>
                    <td colspan="3"><h3>Ubah data Barang</h3></td>
                </tr>
                <tr>
                    <td>Barcode</td>
                    <td>:</td>
                    <td>
                        <input type="text" value="<%=barcode%>" readonly>
                        <input type="hidden" name="barcode" value="<%=barcode%>"/>
                    </td>
                </tr>
                <tr>
                    <td>Nama Barang</td>
                    <td>:</td>
                    <td><input type="text" name="nama" value="<%=nama_brg%>"/></td>
                </tr>
                <tr>
                    <td>Jenis Barang</td>
                    <td>:</td>
                    <td><input type="text" name="jenis" value="<%=jenis_brg%>"/></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="submit" name="aksi" value="Update">
                        <a href="beranda.jsp?hal=tampil-brg">[Lihat data]</a>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
