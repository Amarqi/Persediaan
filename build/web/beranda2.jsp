<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    Document   : beranda2
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
                    <li><a href="beranda2.jsp">Home</a></li>
                    <li><a href="beranda2.jsp?hal=about">About</a></li>
                    <li><a href="Login?proses=logout">Logout</a></li>
                    <li>User : <%=username%></li>
                </ul>
            </div>
            <div id="content">
                <div class="left">
                    <h2>Master Data</h2>
                    <ul>
                        <li><a href="beranda2.jsp?hal=tampil-user">User</a></li>
                    </ul>
                    <h2>Transaksi</h2>
                    <ul>
                        <li><a href="beranda2.jsp?hal=retur-pembelian">Retur Pembelian </a> </li>
                        <li><a href="beranda2.jsp?hal=retur-penjualan">Retur Penjualan </a> </li>
                        <li><a href="beranda2.jsp?hal=barang-hilang">Penyesuaian Barang</a> </li>
                    </ul>
                    <h2>Hapus Persediaan</h2>
                    <ul>
                        <li><a href="beranda2.jsp?hal=laporan2">Hapus Persediaan</a></li>
                    </ul>
                    <h2>Cetak Laporan</h2>
                    <ul>
                        <li><a href="beranda2.jsp?hal=laporan-returpem">Cetak Return Pembelian</a></li>
                        <li><a href="beranda2.jsp?hal=laporan-returpnj">Cetak Return Penjualan</a></li>
                        <li><a href="beranda2.jsp?hal=penyesuaian">Laporan Penyesuaian</a></li>
                        <li><a href="TampilLap.jsp">Laporan Persediaan</a></li>
                    </ul>
                </div>
                <div class="right">
                    <table width="100%">
                        <tr>
                            <td valign="top width=110%">
                        <c:choose>
                            <c:when test="${param.hal=='laporan-returpem'}">
                                <%@include file="CetakReturnpem.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='penyesuaian'}">
                                <%@include file="CetakLaporanPny.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='laporan-returpnj'}">
                                <%@include file="CetakReturnpnj.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='barang-hilang'}">
                                <%@include file="barang_hlg.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='about'}">
                                <%@include file="about.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='tampil-user'}">
                                <%@include file="tampil_user.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='input-user'}">
                                <%@include file="input_user.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='edituser'}">
                                <%@include file="edituser.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='laporan2'}">
                                <%@include file="laporan2.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='hapus'}">
                                <%@include file="hapus_data.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='retur-pembelian'}">
                                <%@include file="retur_pembelian.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='retur-pem'}">
                                <%@include file="retur_pem.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='detail-retpem'}">
                                <%@include file="detail_returpem.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='detail-retpnj'}">
                                <%@include file="detail_returpnj.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='retur-penjualan'}">
                                <%@include file="retur_penjualan.jsp" %>
                            </c:when>
                            <c:when test="${param.hal=='retur-pnj'}">
                                <%@include file="retur_pnj.jsp" %>
                            </c:when>
                            <c:otherwise>
                                <%@include file="home2.jsp" %>
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
