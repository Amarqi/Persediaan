/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author AMARQI
 */
public class baranghlg {
    private String no_hilang;
    private String kd_barang;
    private String tanggal;
    private String ket_hlg;
    private double jml_hlg;
    private double hpp;
    private double total_hlg;

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public double getHpp() {
        return hpp;
    }

    public void setHpp(double hpp) {
        this.hpp = hpp;
    }

    public String getNo_hilang() {
        return no_hilang;
    }

    public void setNo_hilang(String no_hilang) {
        this.no_hilang = no_hilang;
    }

    public String getKd_barang() {
        return kd_barang;
    }

    public void setKd_barang(String kd_barang) {
        this.kd_barang = kd_barang;
    }

    public String getKet_hlg() {
        return ket_hlg;
    }

    public void setKet_hlg(String ket_hlg) {
        this.ket_hlg = ket_hlg;
    }

    public double getJml_hlg() {
        return jml_hlg;
    }

    public void setJml_hlg(double jml_hlg) {
        this.jml_hlg = jml_hlg;
    }

    public double getTotal_hlg() {
        return total_hlg;
    }

    public void setTotal_hlg(double total_hlg) {
        this.total_hlg = total_hlg;
    }
    
    
}
