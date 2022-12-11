/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import control.koneksi;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author HELLO
 */
public class user {
    private String id_user;
    private String nm_user;
    private String hak_akses;
    private String pass;
    koneksi db = null;
    
    public user() {
            try {
        db = new koneksi();
        } catch (ClassNotFoundException ex) {
    Logger.getLogger(user.class.getName()).log(Level.SEVERE,null,ex);
       }
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getNm_user() {
        return nm_user;
    }

    public void setNm_user(String nm_user) {
        this.nm_user = nm_user;
    }

    public String getHak_akses() {
        return hak_akses;
    }

    public void setHak_akses(String hak_akses) {
        this.hak_akses = hak_akses;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public List LoginUser(String user, String password) {
        List data = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM user where id_user='" + user + "'"
                          + "and pass='" + password + "'";
            rs = db.ambildata(sql);
            
            while (rs.next()) {
                user am = new user();
                am.setId_user(rs.getString("id_user"));
                am.setPass(rs.getString("pass"));
                am.setHak_akses(rs.getString("hak_akses"));
                data.add(am);
            }
            db.diskonek(rs);
        } catch (Exception a) {
            System.out.println("Terjadi Kesalahan cari Login user, pada :\n" + a);
        }
        return data;
    }
}
