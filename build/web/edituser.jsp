<%-- 
    Document   : edituser
    Created on : Apr 14, 2020, 10:36:33 PM
    Author     : AMARQI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%
    String id_user=request.getParameter("id_user");;
    String nm_user=null;
    String hak_akses=null;
    String pass=null;
    ResultSet rs = null;
    koneksi kon = new koneksi();
    rs = kon.stmt.executeQuery("SELECT * FROM user where id_user = '" + id_user + "'");
          if (rs.next()) 
          {
              id_user=rs.getString("id_user");
              nm_user=rs.getString(2);
              hak_akses=rs.getString(3);
              pass=rs.getString(4);
          }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="userServlet">
            <table border="0">
                <tr>
                    <td colspan="3"><h3>Ubah data barang</h3></td>
                </tr>
                <tr>
                    <td>Id User</td>
                    <td>:</td>
                    <td>
                        <input type="text" value="<%=id_user%>" readonly>
                        <input type="hidden" name="id_user" value="<%=id_user%>"/>
                    </td>
                </tr>
                <tr>
                    <td>Nama User</td>
                    <td>:</td>
                    <td><input type="text" name="nm_user" value="<%=nm_user%>"/></td>
                </tr>
                <tr>
                    <td>Hak Akses</td>
                    <td>:</td>
                    <%
                                if (hak_akses.equalsIgnoreCase("User"))
                                {  %>
                                <td><select name="hak_akses">
                                <option value="User" selected="User">User</option>
                                <option value="Admin">Admin</option>
                                    </select></td>
                            <% } else
                            if (hak_akses.equalsIgnoreCase("Admin"))
                            { %>
                            <td><select name="hak_akses">
                                <option value="User">User</option>
                                <option value="Admin" selected="Admin">Admin</option>
                                </select></td>
                            <% } %>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>:</td>
                    <td><input type="text" name="pass" value="<%=pass%>"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="aksi" value="Update">
                        <a href="beranda2.jsp?hal=tampil-user">[Lihat data]</a>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
