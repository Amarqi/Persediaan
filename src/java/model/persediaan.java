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
public class persediaan {
    private String barcode;
    private String id_gudang;
    private String nama;
    private String jenis;
    private double stok;
    private double hpp;
    private double total;

    public String getId_gudang() {
        return id_gudang;
    }

    public void setId_gudang(String id_gudang) {
        this.id_gudang = id_gudang;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getJenis() {
        return jenis;
    }

    public void setJenis(String jenis) {
        this.jenis = jenis;
    }

    public double getStok() {
        return stok;
    }

    public void setStok(double stok) {
        this.stok = stok;
    }

    public double getHpp() {
        return hpp;
    }

    public void setHpp(double hpp) {
        this.hpp = hpp;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
  
    
}
