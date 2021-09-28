/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sadm.servlet;

import com.sadm.controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author marco
 */
public class EditarPagina extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
          
        
        String detalle_id_Pagina = request.getParameter("detalle_id_Pagina");
        String detalle_nom_pag = request.getParameter("detalle_nom_pag");
        String detalle_ref_pag = request.getParameter("detalle_ref_pag");
        String detalle_val_pag = request.getParameter("detalle_val_pag");
        String de_con_pag = request.getParameter("de_con_pag");
        String detalle_target = request.getParameter("detalle_target");
        String detalle_activo = request.getParameter("detalle_activo");
        String detalle_path_pag = request.getParameter("detalle_path_pag");
        String detalle_url_pag = request.getParameter("detalle_url_pag");
        String detalle_id_pag_html = request.getParameter("detalle_id_pag_html");
        String detalle_pagina_desc = request.getParameter("detalle_pagina_desc");
        String detalle_val1_pag = request.getParameter("detalle_val1_pag");
        String usuario = request.getParameter("detalle_val1_pag");
        
        
        Consultas co = new Consultas();
        if(co.editarPagina(detalle_id_Pagina,detalle_nom_pag,detalle_ref_pag,detalle_val_pag,de_con_pag,detalle_target,detalle_activo,detalle_path_pag,detalle_url_pag,detalle_id_pag_html,detalle_pagina_desc,detalle_val1_pag,usuario)){

            response.sendRedirect("/SADM/AdminPagina.jsp");
        }else{
        response.sendRedirect("/SADM/AdminPagina.jsp");
        
        }}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
