<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    Document   : beranda
    Created on : Apr 12, 2020, 10:56:00 AM
    Author     : AMARQI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persediaan</title>
        <link rel="stylesheet" type="text/css" href="config/style.css">
    </head>
    <body>
        <div id="wrap">
            <div id="header">
                <img src="image/logo-ubsi.png">
                <h1>Aplikasi Persediaan Metode Average</h1>
                <h2>Universitas Bina Sarana Informatika</h2>
                <h2>Jl. Ciledug Raya No 168. Kelurahan Ulujami Pesanggrahan Jakarta Selatan</h2>
                <h2>Project BY: Amarqi Junior</h2>
            </div>
            <%
                String username=(String)
                session.getAttribute("username");
                if(username==null) username="";
            
            %>
            <div id="menu">
                <ul>
                    <li><a href="beranda.jsp">Home</a></li>
                    <li><a href="beranda.jsp?hal=about">About</a></li>
                    <li><a href="Login?proses=logout">Logout</a></li>
                    <li>User : <%=username%></li>
                </ul>
            </div>
            <div id="content">
                <div class="left">
                    <h2>Master Data</h2>
                    <ul>
                        <li><a href="beranda.jsp?hal=tampil-brg">Barang</a></li>
                        <li><a href="beranda.jsp?hal=tampil-supp">Supplier</a></li>
                    </ul>
                    <h2>Transaksi</h2>
                    <ul>
                        <li><a href="beranda.jsp?hal=barang-msk">Barang Masuk</a></li>
                        <li><a href="beranda.jsp?hal=barang-klr">Barang Keluar </a> </li>
                    </ul>
                    <h2>Stock Opname</h2>
                    <ul>
                        <li><a href="beranda.jsp?hal=laporan">Persediaan Barang</a></li>
                    </ul>
                    <h2>Cetak Laporan</h2>
                    <ul>
                        <li><a href="beranda.jsp?hal=laporan-brgmsk">Laporan Barang Masuk</a></li>
                        <li><a href="beranda.jsp?hal=laporan-brgklr">Laporan Barang Keluar</a></li>
                        <li><a href="TampilLap.jsp">Laporan Persediaan</a></li>
                    </ul>
                </div>
                <div class="right">
                    <table width="100%">
                        <tr>
                            <td valign="top width=110%">
                        <c:choose>
                            <c:when test="${param.hal=='about'}">
                                <%@include file="about.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='barang'}">
                                <%@include file="barang.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='ubah-barang'}">
                                <%@include file="ubah_barang.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='tampil-brg'}">
                                <%@include file="tampil_brg.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='barang-msk'}">
                                <%@include file="barang_msk.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='laporan-brgmsk'}">
                                <%@include file="CetakLaporanBarangmsk.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='laporan-brgklr'}">
                                <%@include file="CetakLaporanBarangklr.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='barang-klr'}">
                                <%@include file="barang_klr.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='barang-hlg'}">
                                <%@include file="barang_hlg.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='detail-msk'}">
                                <%@include file="detail_msk.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='detail-klr'}">
                                <%@include file="detail_klr.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='laporan'}">
                                <%@include file="laporan.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='input-supp'}">
                                <%@include file="input_supp.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='ubah-supp'}">
                                <%@include file="ubah_supp.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='tampil-supp'}">
                                <%@include file="tampil_supp.jsp" %>
                            </c:when>
                            <c:otherwise>
                                <%@include file="home.jsp" %>
                            </c:otherwise>
                        </c:choose>

                            </td>
                        </tr>
                    </table>
                            <div class="footer">
                                support by <a href="http://bsi.ac.id/">
                                Junior Programmer Mahasiswa Program Studi
                                Sistem Informasi Akuntansi </a>
                            </div>
                </div>
                            <div style="clear:both;"></div>
            </div>
        </div>
    </body>
</html>
