<%-- 
    Document   : tampil_user
    Created on : Apr 14, 2020, 10:28:43 PM
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
        <form action="beranda2.jsp?hal=tampil-user" method="post">
            Masukan Id User :
                <input type="text" name="cari" value="" />
                <input type="submit" value="Cari" class="button"/>
            </form>
        <table border="1">
            <tbody>
                <tr>
                    <th>ID User</th>
                    <th>Nama User</th>
                    <th>Hak Akses</th>
                    <th>Password</th>
                    <th>AKSI</th>
                </tr>
                <%
                   String id_user=null, nm_user=null, hak_akses=null, pass=null, cari=request.getParameter("cari");
                   if (cari==null) {cari="";}
                   ResultSet rs=null;
                   
                   koneksi kon=new koneksi();
                   rs = kon.stmt.executeQuery("SELECT * FROM user where id_user like '%"+cari+"%'");
                   while(rs.next()) {
                       id_user=rs.getString("id_user");
                       nm_user=rs.getString(2);
                       hak_akses=rs.getString(3);
                       pass=rs.getString(4);
                   
                 %>   
                <tr>
                    <td><% out.println(id_user);%></td>
                    <td><% out.println(nm_user);%></td>
                    <td><% out.println(hak_akses);%></td>
                    <td><% out.println(pass);%></td>
                    <td><a href="beranda2.jsp?hal=edituser&id_user=<% out.print(id_user);%>">EDIT</a>
                        || <a href="userServlet?aksi=Delete&id_user=<% out.print(id_user);%>">HAPUS</a></td>
                </tr>
                <% } %>
                <tr>
                    <td colspan="6" align="center"><h3><a href="beranda2.jsp?hal=input-user">Tambah Data</a></h3></td>
                </tr>
            </tbody>
        </table>
        <%kon.close();%>
    </body>
</html>
