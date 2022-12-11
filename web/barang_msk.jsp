<%-- 
    Document   : sewa
    Created on : Dec 7, 2019, 8:33:22 AM
    Author     : AMARQI
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="control.koneksi"%>
<%@page import="model.supplier"%>
<%@page import="model.barangmsk"%>
<%@page import="model.persediaan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
       supplier supp = new supplier();
       persediaan per = new persediaan();
       barangmsk msk = new barangmsk();
       koneksi kon = new koneksi();
       ResultSet rs = null;
       ResultSet qrybrg = null;
       ResultSet qrysupp = null;
%>
<h1>Barang Masuk</h1>
<form action="BarangmskServlet" method="post">
    <table border="0">
        <tr>
            <td>NO Masuk</td>
            <td>:</td>
            <td>
                <%
                try {
                    ResultSet nos = null;
                    nos = kon.stmt.executeQuery("Select max(right(no_masuk,8)) as no FROM barang_msk");
                    while (nos.next()){
                          if (nos.first() == false){
                              out.println("<input type='hidden' name='no_masuk' value='BM00000001'/>");
                              out.println("<input type='text' disabled='disabled' value='BM00000001'/>");
                          } else {
                              nos.last();
                              int autonosewa = nos.getInt(1) + 1;
                              String nosewa = String.valueOf(autonosewa);
                              int noLong = nosewa.length();
                              
                              for (int a = 1; a < 9 - noLong; a++) {
                                   nosewa = "0" + nosewa;
                              }
                              String nomsewa = "BM" + nosewa;
                              out.println("<input type='hidden' name='no_masuk' value='"+ nomsewa +"'/>");
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
            <td>Barang</td>
            <td>:</td>
            <td>
                <select name="barang">
                     <option value="-1">Select</option>
                    <%
                        qrybrg = kon.stmt.executeQuery("SELECT barcode, nama_barang "
                                 + "FROM barang ");
                        while (qrybrg.next()){
                             per.setBarcode(qrybrg.getString("barcode"));
                             per.setNama(qrybrg.getString("nama_barang"));
                    %>
                    <option value="<%=per.getBarcode()%>"><%=per.getBarcode()%> <%=per.getNama()%></option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>Supplier</td>
            <td>:</td>
            <td>
                <select name="supplier">
                     <option value="-1">Select</option>
                    <%
                        qrysupp = kon.stmt.executeQuery("SELECT kode_supp, nama_supp "
                                 + "FROM supplier ");
                        while (qrysupp.next()){
                             supp.setKode_supp(qrysupp.getString("kode_supp"));
                             supp.setNama_supp(qrysupp.getString("nama_supp"));
                    %>
                    <option value="<%=supp.getKode_supp()%>"><%=supp.getKode_supp()%> <%=supp.getNama_supp()%></option>
                    <% } %>
                </select>
            </td>
        </tr>
        <tr>
            <td>User</td>
            <td>:</td>
            <td>
                <input type="text" name="user" value="<%=username%>" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td>Tanggal Masuk</td>
            <td>:</td>
            <td><input type="date" name="tgl_msk"/></td>
        </tr>
        <tr>
            <td>Jumlah Barang</td>
            <td>:</td>
            <td><input type="text" name="jml_msk" id="jml" onkeyup="sum();"/></td>
        </tr>
        <tr>
            <td>Harga Satuan</td>
            <td>:</td>
            <td><input type="text" name="harga_msk" id="harga" onkeyup="sum();"/></td>
        </tr>
        <tr>
            <td>Total Harga</td>
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
<br>
<table>
    <tr class="head">
        <td>NO Masuk</td>
        <td>User</td>
        <td>Supplier</td>
        <td>Tanggal Masuk</td>
        <td>Total Barang Masuk</td>
        <td>Aksi</td>
    </tr>
    <%
        rs = kon.stmt.executeQuery("SELECT * from barang_msk ORDER BY no_masuk DESC");
         while (rs.next()){
               out.println("<tr class=isi>"
               + "<td>" + rs.getString(1) +"</a></td>"
               + "<td>" + rs.getString(2) + "</td>"
               + "<td>" + rs.getString(3) + "</td>"
               + "<td>" + rs.getString(4) + "</td>"
               + "<td>" + rs.getString(5) + "</td>"
               + "<td><a href=beranda.jsp?hal=detail-msk&no_masuk=" + rs.getString(1) + ">Lihat Detail</a></td>"
               + "</tr>");
         }
    %>
</table>                