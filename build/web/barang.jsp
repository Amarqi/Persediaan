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
        <form action="persediaanServlet" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <th colspan="3">Input Data Barang</th>
                    </tr>
                    <tr>
            <td>ID Gudang</td>
            <td>:</td>
            <td>
                <%
                try {
                    koneksi kon = new koneksi();
                    ResultSet nos = null;
                    nos = kon.stmt.executeQuery("Select max(right(id_gudang,8)) as no FROM gudang");
                    while (nos.next()){
                          if (nos.first() == false){
                              out.println("<input type='hidden' name='id_gudang' value='PB00000001'/>");
                              out.println("<input type='text' disabled='disabled' value='PB00000001'/>");
                          } else {
                              nos.last();
                              int autonosewa = nos.getInt(1) + 1;
                              String nosewa = String.valueOf(autonosewa);
                              int noLong = nosewa.length();
                              
                              for (int a = 1; a < 9 - noLong; a++) {
                                   nosewa = "0" + nosewa;
                              }
                              String nomsewa = "PB" + nosewa;
                              out.println("<input type='hidden' name='id_gudang' value='"+ nomsewa +"'/>");
                              out.println("<input type='text' disabled='disabled' value='"+ nomsewa +"'/>");
                          }
                    }
                } catch (Exception e) {
                        out.println(e);
                }
                %>
            </td>
        </tr>
                    <td>Barcode</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="barcode" value="" />
                        </td>
                    </tr>
                    <tr>
                    <td>Nama Barang</td>
                        <td>:</td>
                        <td>
                         <input type="text" name="nama" value="" />   
                        </td>   
                    </tr>
                    <tr>
                        <td>Jenis Barang</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="jenis" value="" />
                        </td>
                    </tr>
                <input type="hidden" name="stok" value="0" />
                <input type="hidden" name="hpp" value="0" />
                <input type="hidden" name="total" value="0" />
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
