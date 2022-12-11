<%-- 
    Document   : editbarang
    Created on : Apr 5, 2020, 10:47:22 PM
    Author     : AMARQI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%
    String kode_supp=request.getParameter("kode_supp");;
    String nama_supp=null;
    String alamat=null;
    String telp=null;
    ResultSet rs = null;
    koneksi kon = new koneksi();
    rs = kon.stmt.executeQuery("SELECT * FROM supplier where kode_supp = '" + kode_supp + "'");
          if (rs.next()) 
          {
              kode_supp=rs.getString("kode_supp");
              nama_supp=rs.getString(2);
              alamat=rs.getString(3);
              telp=rs.getString(4);
          }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="supplierServlet">
            <table border="2">
                <tr>
                    <td colspan="3"><h3>Ubah data Supplier</h3></td>
                </tr>
                <tr>
                    <td>Kode supplier</td>
                    <td>:</td>
                    <td>
                        <input type="text" value="<%=kode_supp%>" readonly>
                        <input type="hidden" name="kode_supp" value="<%=kode_supp%>"/>
                    </td>
                </tr>
                <tr>
                    <td>Nama Supplier</td>
                    <td>:</td>
                    <td><input type="text" name="nama_supp" value="<%=nama_supp%>"/></td>
                </tr>
                <tr>
                    <td>Alamat</td>
                    <td>:</td>
                    <td><textarea name="alamat" rows="4" cols="20">
                         <%=alamat%>
                        </textarea></td>
                </tr>
                <tr>
                    <td>Telpon</td>
                    <td>:</td>
                    <td><input type="text" name="telp" value="<%=telp%>"/></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="submit" name="aksi" value="Update">
                        <a href="beranda.jsp?hal=tampil-supp">[Lihat data]</a>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
