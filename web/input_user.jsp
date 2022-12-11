<%-- 
    Document   : input_user
    Created on : Apr 14, 2020, 10:12:32 PM
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
        <form method="POST" action="userServlet">
            <h2>Input Data Master User</h2>
            <table border="0">
                <tr>
                    <td>ID User</td>
                    <td>:</td>
                        <td><input type="text" name="id_user"/></td>
                </tr>
                <tr>
                    <td>Nama User</td>
                    <td>:</td>
                    <td><input type="text" name="nm_user"></td>
                </tr>
                <tr>
                    <td>Hak Akses</td>
                    <td>:</td>
                    <td><select name="hak_akses">
                    <option>-Pilih-</option>
                    <option>User</option>
                    <option>Admin</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>:</td>
                    <td><input type="text" name="pass"></td>
                </tr>
                <tr>
                    <td colspan="3">
                <center><input type="reset" value="Batal">
                    <input type="submit" name="aksi" value="Simpan">
                    <a href="beranda2.jsp?hal=tampil-user">[Lihat data]</a>
                </center>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
