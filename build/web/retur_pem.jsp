<%-- 
    Document   : retur_pem
    Created on : Nov 5, 2020, 8:41:22 PM
    Author     : HELLO
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
        <%
                   String no_masuk, barcode=null, harga=null;
                   no_masuk=request.getParameter("no_masuk");
                   ResultSet rs=null;
                   
                   koneksi kon=new koneksi();
                   rs = kon.stmt.executeQuery("SELECT * from barang_msk, detail_msk where barang_msk.no_masuk=detail_msk.no_masuk and detail_msk.no_masuk='"+ no_masuk +"'");
                   if(rs.next()) {
                       no_masuk=rs.getString("no_masuk");
                       barcode=rs.getString("barcode");
                       harga=rs.getString("harga_msk");
                   }
                 %>
                 <form action="ReturpemServlet" method="post">
                     <table border="0">
            <tr>
            <td>No Return Pembelian</td>
            <td>:</td>
            <td>
                <%
                try {
                    ResultSet nos = null;
                    nos = kon.stmt.executeQuery("Select max(right(no_returpem,8)) as no FROM returpem");
                    while (nos.next()){
                          if (nos.first() == false){
                              out.println("<input type='hidden' name='no_returpem' value='RB00000001'/>");
                              out.println("<input type='text' disabled='disabled' value='RB00000001'/>");
                          } else {
                              nos.last();
                              int autonosewa = nos.getInt(1) + 1;
                              String nosewa = String.valueOf(autonosewa);
                              int noLong = nosewa.length();
                              
                              for (int a = 1; a < 9 - noLong; a++) {
                                   nosewa = "0" + nosewa;
                              }
                              String nomsewa = "RB" + nosewa;
                              out.println("<input type='hidden' name='no_returpem' value='"+ nomsewa +"'/>");
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
            <td>No masuk</td>
            <td>:</td>
            <td>
            <input type="text" value="<%=no_masuk%>" readonly/>
            <input type="hidden" name="no_masuk" value="<%=no_masuk%>" />
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
            <td>Harga Barang Masuk</td>
            <td>:</td>
            <td>
                <input type="text" value="<%=harga%>" readonly/>
                <input type="hidden" name="harga" value="<%=harga%>" id="harga" onkeyup="sum();" />
            </td>
        </tr>
        <tr>
            <td>Keterangan</td>
            <td>:</td>
            <td><textarea name="ket_pem" rows="4" cols="20">
                </textarea></td>
        </tr>
        <tr>
            <td> Tanggal Transaksi</td>
            <td>:</td>
            <td><input type="date" name="tgl_retur"/></td>
        </tr>
        <tr>
            <td>Jumlah Return</td>
            <td>:</td>
            <td><input type="text" name="jml_return" id="jml" onkeyup="sum();"></td>
        </tr>
        <tr>
            <td>Total</td>
            <td>:</td>
            <td><input type="text" name="sub" id="subtotal" readonly="readonly"></td>
        </tr>
        <script>
     function sum() {
         var txtFirstNumberValue = document.getElementById('harga').value;
         var txtSecondNumberValue = document.getElementById('jml').value;
         var result = parseFloat(txtFirstNumberValue) * parseFloat(txtSecondNumberValue);
         if (!isNaN(result)) {
             document.getElementById('subtotal').value = result;
         }
     }
      </script>
        <tr>
            <td align="center" colspan="3"><input type="submit" name="aksi" value="Simpan" class="button"/></td>
        </tr>
    </table>
    </form>
    </body>
</html>
