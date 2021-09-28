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
public class AgregarPagina extends HttpServlet {

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
        
                    
        String agregar_id_Pagina = request.getParameter("agregar_id_Pagina");
        String agregar_nom_pag = request.getParameter("agregar_nom_pag");
        String agregar_ref_pag = request.getParameter("agregar_ref_pag");
        String agregar_val_pag = request.getParameter("agregar_val_pag");
        String ag_con_pag = request.getParameter("ag_con_pag");
        String agregar_target = request.getParameter("agregar_target");
        String agregar_activo = request.getParameter("agregar_activo");
        String agregar_path_pag = request.getParameter("agregar_path_pag");
        String agregar_url_pag = request.getParameter("agregar_url_pag");
        String agregar_id_pag_html = request.getParameter("agregar_id_pag_html");
        String agregar_pagina_desc = request.getParameter("agregar_pagina_desc");
        String agregar_val1_pag = request.getParameter("agregar_val1_pag");
        String agregar_val2_pag = request.getParameter("agregar_val2_pag");
        String agregar_val3_pag = request.getParameter("agregar_val3_pag");
         String usuario = request.getParameter("agregar_val3_pag");
        
        Consultas co = new Consultas();
          if(co.insertarPagina(agregar_id_Pagina,agregar_nom_pag,agregar_ref_pag,agregar_val_pag,ag_con_pag,agregar_target,agregar_activo,agregar_path_pag,agregar_url_pag,agregar_id_pag_html,agregar_pagina_desc,agregar_val1_pag,agregar_val2_pag,agregar_val3_pag,usuario)){

            response.sendRedirect("/SADM/AdminPagina.jsp");
        }else{
        response.sendRedirect("/SADM/AdminPagina.jsp");
        
        } }
       

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
