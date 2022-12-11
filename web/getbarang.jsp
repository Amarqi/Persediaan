<%-- 
    Document   : getbarang
    Created on : Jul 9, 2020, 9:39:32 PM
    Author     : AMARQI
--%>

<%@page import="java.sql.Statement"%>
<%@page import="control.koneksi"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    koneksi kon = new koneksi();
    ResultSet rs = null;
    String emp_id = request.getParameter("emp_id").toString();
    String data = null;
    Statement st;
    rs = kon.stmt.executeQuery("SELECT * from gudang where barcode='" + emp_id + "'");
    while (rs.next()) {
        data = ":" + rs.getString(4) + ":" + emp_id;
    }
    out.println(data);

%>