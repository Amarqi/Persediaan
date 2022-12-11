<%-- 
    Document   : pengembalian
    Created on : May 19, 2020, 8:26:58 PM
    Author     : AMARQI
--%>

<%@page import="control.koneksi"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                   String id, barcode=null, stok=null, hpp=null, total=null;
                   id=request.getParameter("id");
                   ResultSet rs=null;
                   
                   koneksi kon=new koneksi();
                   rs = kon.stmt.executeQuery("SELECT * from gudang where id_gudang='"+ id +"'");
                   if(rs.next()) {
                       id=rs.getString("id_gudang");
                       barcode=rs.getString("barcode");
                       stok=rs.getString("stok");
                       hpp=rs.getString("hpp");
                       total=rs.getString("total");
                   }
                 %>
                 <form action="persediaanServlet" method="post">
                     <table border="0">
                         <tr align="center">
                         <td colspan="3">PERINGATAN !!!</td>
                         </tr>
                         <tr align="center">
                         <td colspan="3">DATA YANG DI HAPUS TIDAK AKAN BISA KEMBALI !!!</td>
                         </tr>
            <tr>
            <td>Id Gudang</td>
            <td>:</td>
            <td>
                <input type="text" value="<%=id%>" readonly/>
                <input type="hidden" name="id" value="<%=id%>" />
            </td>
        </tr>
        <tr>
            <td>Barcode</td>
            <td>:</td>
            <td>
                <input type="text" value="<%=barcode%>" readonly/>
                <input type="hidden" name="barcode" value="<%=barcode%>" />
            </td>
        </tr>
        <tr>
            <td>Stok</td>
            <td>:</td>
            <td>
                <input type="text" value="<%=stok%>" readonly/>
                <input type="hidden" name="stok" value="<%=stok%>" />
            </td>
        </tr>
        <tr>
            <td>HPP</td>
            <td>:</td>
            <td>
                <input type="text" value="<%=hpp%>" readonly/>
                <input type="hidden" name="harga" value="<%=hpp%>" />
            </td>
        </tr>
        <tr>
            <td>Total</td>
            <td>:</td>
            <td>
                <input type="text" value="<%=total%>" readonly/>
                <input type="hidden" name="total" value="<%=total%>" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <input type="submit" name="aksi" value="Delete" class="button"/>
                <a href="beranda2.jsp?hal=laporan2">Kembali</a>
            </td>
        </tr>
    </table>
    </form>
    </body>
</html>
