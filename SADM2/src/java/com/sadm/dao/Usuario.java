/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sadm.dao;

/**
 *
 * @author marco garulo
 */
public class Usuario {
    
    private String idusuario;
    private String usuario;
    private String password;
    private String nombres;
    private String apellido_p;
    private String apellido_m;
    private String idrol;
    private String activo;
    private String desc_modif;
    private String user_modif;
    private String f_modif;

    
      public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }
    
    public String getDesc_modif() {
        return desc_modif;
    }

    public void setDesc_modif(String desc_modif) {
        this.desc_modif = desc_modif;
    }

    public String getUser_modif() {
        return user_modif;
    }

    public void setUser_modif(String user_modif) {
        this.user_modif = user_modif;
    }

    public String getF_modif() {
        return f_modif;
    }

    public void setF_modif(String f_modif) {
        this.f_modif = f_modif;
    }
   

    public String getIdrol() {
        return idrol;
    }

    public void setIdrol(String idrol) {
        this.idrol = idrol;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellido_p() {
        return apellido_p;
    }

    public void setApellido_p(String apellido_p) {
        this.apellido_p = apellido_p;
    }

    public String getApellido_m() {
        return apellido_m;
    }

    public void setApellido_m(String apellido_m) {
        this.apellido_m = apellido_m;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }
    private String rfc;
    private String curp;


}
