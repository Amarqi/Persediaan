<%-- 
    Document   : barang
    Created on : Apr 12, 2020, 9:38:45 PM
    Author     : AMARQI
--%>

<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="supplierServlet" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <th colspan="3">Input Data Supplier</th>
                    </tr>
                    <tr>
                        <td>Kode Supplier</td>
                        <td>:</td>
                        <td>
                            <%
                try {
                    koneksi kon = new koneksi();
                    ResultSet nos = null;
                    nos = kon.stmt.executeQuery("Select max(right(kode_supp,4)) as no FROM supplier");
                    while (nos.next()){
                          if (nos.first() == false){
                              out.println("<input type='hidden' name='kode_supp' value='S0001'/>");
                              out.println("<input type='text' disabled='disabled' value='S0001'/>");
                          } else {
                              nos.last();
                              int autonosewa = nos.getInt(1) + 1;
                              String nosewa = String.valueOf(autonosewa);
                              int noLong = nosewa.length();
                              
                              for (int a = 1; a < 5 - noLong; a++) {
                                   nosewa = "0" + nosewa;
                              }
                              String nomsewa = "S" + nosewa;
                              out.println("<input type='hidden' name='kode_supp' value='"+ nomsewa +"'/>");
                              out.println("<input type='text' disabled='disabled' value='"+ nomsewa +"'/>");
                          }
                    }
                } catch (Exception e) {
                        out.println(e);
                }
                %>
                        </td>
                    </tr>
                    <tr>
                        <td>Nama Supplier</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="nama_supp" value="" />
                        </td>
                    </tr>
                    <tr>
                    <td>Alamat</td>
                        <td>:</td>
                        <td>
                            <textarea name="alamat" rows="4" cols="20">
                            </textarea>   
                        </td>   
                    </tr>
                    <tr>
                        <td>No Telepon</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="telp" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <input type="submit" value="Simpan" name="aksi" />
                            <input type="reset" value="Batal" name="reset" />
                        </td>                      
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
