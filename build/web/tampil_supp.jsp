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
        <form action="beranda.jsp?hal=tampil-supp" method="post">
                  Masukan Nama Supplier :
                <input type="text" name="cari" value="" />
                <input type="submit" value="Cari" class="button"/>
            </form>
        <center>
        <table border="1">
            <tbody>
                <tr>
                    <th>Kode Supplier</th>
                    <th>Nama Supplier</th>
                    <th>Alamat</th>
                    <th>No Telp</th>
                    <th>Aksi</th>
                </tr>
                <%
                   String kode_supp=null, nama_supp=null, alamat=null, telp=null, cari=request.getParameter("cari");
                   if (cari==null){cari="";}
                   ResultSet rs=null;
                   
                   koneksi kon=new koneksi();
                   rs = kon.stmt.executeQuery("SELECT * FROM supplier where nama_supp like '%"+cari+"%'");
                   while(rs.next()) {
                       kode_supp=rs.getString("kode_supp");
                       nama_supp=rs.getString(2);
                       alamat=rs.getString(3);
                       telp=rs.getString(4);
                 %>   
                <tr>
                    <td><% out.println(kode_supp);%></td>
                    <td><% out.println(nama_supp);%></td>
                    <td><% out.println(alamat);%></td>
                    <td><% out.println(telp);%></td>
                    <td><a href="supplierServlet?aksi=Delete&kode_supp=<% out.print(kode_supp);%>">HAPUS</a>
                    || <a href="beranda.jsp?hal=ubah-supp&kode_supp=<% out.print(kode_supp);%>">EDIT</a></td>
                </tr>
                <% } %>
                <tr>
                    <td colspan="5" align="center"><h3><a href="beranda.jsp?hal=input-supp">Tambah Data</a></h3></td>
                </tr>
            </tbody>
        </table></center>
        <%kon.close();%>
    </body>
</html>
