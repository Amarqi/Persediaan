<%-- 
    Document   : barang_klr
    Created on : Jul 9, 2020, 8:57:35 PM
    Author     : AMARQI
--%>

<%@page import="model.persediaan"%>
<%@page import="control.koneksi"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
       koneksi kon = new koneksi();
       ResultSet rs = null;
       persediaan per = new persediaan();
       ResultSet qrybrg = null;
%>
<script type="text/javascript"> 
           function showEmp(emp_value) 
           {         
               if (document.getElementById("emp_id").value != "-1")
               {             xmlHttp = GetXmlHttpObject()
                   if (xmlHttp == null)
                   {                 alert("Browser does not support HTTP Request")
                       return             
                   }             
                   var url = "getbarang.jsp"
                   url = url + "?emp_id=" + emp_value 
 
            xmlHttp.onreadystatechange = stateChanged
            xmlHttp.open("GET", url, true)
            xmlHttp.send(null)
        } else         
        {             
            alert("Pilih Barang");         
        }     
    } 
 
    function stateChanged()
    {         
        document.getElementById("ename").value = "";
        document.getElementById("emp_id").value = "";
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
        { 
 
            var showdata = xmlHttp.responseText;
            var strar = showdata.split(":"); 
 
            if (strar.length == 1)
            {                 document.getElementById("emp_id").focus();
                alert("Pilih Barang");
                document.getElementById("ename").value = " ";
                document.getElementById("emp_id").value = " ";
            } else if (strar.length > 1)
            {                 
                document.getElementById("ename").value = strar[1];             } 
 
        }
    } 
 
    function GetXmlHttpObject()
    {
        var xmlHttp = null;
        try
        {
            xmlHttp = new XMLHttpRequest();
        } catch (e)
        {
            try
            {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e)
            {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
        }
        return xmlHttp;
    }
       </script>
<h1>Barang Keluar</h1>
<form action="BarangklrServlet" method="post">
    <table border="0">
        <tr>
            <td>NO Keluar</td>
            <td>:</td>
            <td>
                <%
                try {
                    ResultSet nos = null;
                    nos = kon.stmt.executeQuery("Select max(right(no_keluar,8)) as no FROM barang_klr");
                    while (nos.next()){
                          if (nos.first() == false){
                              out.println("<input type='hidden' name='no_keluar' value='BK00000001'/>");
                              out.println("<input type='text' disabled='disabled' value='BK00000001'/>");
                          } else {
                              nos.last();
                              int autonosewa = nos.getInt(1) + 1;
                              String nosewa = String.valueOf(autonosewa);
                              int noLong = nosewa.length();
                              
                              for (int a = 1; a < 9 - noLong; a++) {
                                   nosewa = "0" + nosewa;
                              }
                              String nomsewa = "BK" + nosewa;
                              out.println("<input type='hidden' name='no_keluar' value='"+ nomsewa +"'/>");
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
                 <select name="barang" onchange="showEmp(this.value);">
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
                 <input  type="hidden" name="emp_id" id="emp_id" value="">
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
            <td>Tanggal Keluar</td>
            <td>:</td>
            <td><input type="date" name="tgl_klr"/></td>
        </tr>
        <tr>
            <td>Harga Satuan</td>
            <td>:</td>
            <td><input  type="text" name="hpp" id="ename" value="" readonly="readonly" onkeyup="sum();"></td>
        </tr>
        <tr>
            <td>Jumlah barang keluar</td>
            <td>:</td>
            <td><input type="text" name="jml_klr" id="jml" onkeyup="sum();"></td>
        </tr>
        <tr>
            <td>Total Barang Keluar</td>
            <td>:</td>
            <td><input type="text" name="sub" id="subtotal" readonly="readonly"></td>
        </tr>
        <script>
     function sum() {
         var txtFirstNumberValue = document.getElementById('ename').value;
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
        <td>NO Keluar</td>
        <td>User</td>
        <td>Tanggal Keluar</td>
        <td>Total Barang Keluar</td>
        <td>Aksi</td>
    </tr>
    <%
        rs = kon.stmt.executeQuery("SELECT * from barang_klr order by no_keluar desc");
         while (rs.next()){
               out.println("<tr class=isi>"
               + "<td>" + rs.getString(1) +"</a></td>"
               + "<td>" + rs.getString(2) + "</td>"
               + "<td>" + rs.getString(3) + "</td>"
               + "<td>" + rs.getString(4) + "</td>"
               + "<td><a href=beranda.jsp?hal=detail-klr&no_keluar=" + rs.getString(1) + ">Lihat Detail</a></td>"
               + "</tr>");
         }
    %>
</table>