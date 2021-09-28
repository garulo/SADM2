/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sadm.dao;

/**
 *
 * @author marco
 */
public class Menu {

    private String id;
    private String nombre;
    private String valor;
    private String tipo;
    private String menu_padre;
    private String href;
    private String target;
    private String activo;
    private String val1;
    private String val2;
    private String val3;
    private String desc_modif;
    private String user_modif;
    private String f_modif;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getMenu_padre() {
        return menu_padre;
    }

    public void setMenu_padre(String menu_padre) {
        this.menu_padre = menu_padre;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public String getVal1() {
        return val1;
    }

    public void setVal1(String val1) {
        this.val1 = val1;
    }

    public String getVal2() {
        return val2;
    }

    public void setVal2(String val2) {
        this.val2 = val2;
    }

    public String getVal3() {
        return val3;
    }

    public void setVal3(String val3) {
        this.val3 = val3;
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

}
