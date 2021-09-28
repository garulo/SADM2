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
public class EditarMenu extends HttpServlet {

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
        String txtusredit = request.getParameter("txtusredit");
        String detalle_uid_Menu = request.getParameter("detalle_uid_Menu");
        String detalle_menu_nombre = request.getParameter("detalle_menu_nombre");
        String detalle_menu_valor = request.getParameter("detalle_menu_valor");
        String detalle_menu_padre = request.getParameter("detalle_menu_padre");
        String detalle_menu_tipo = request.getParameter("detalle_menu_tipo");
        String detalle_menu_href = request.getParameter("detalle_menu_href");
        String detalle_menu_target = request.getParameter("detalle_menu_target");
        String detalle_menu_activo = request.getParameter("detalle_menu_activo");
        String detalle_menu_val1 = request.getParameter("detalle_menu_val1");
        String usuario = request.getParameter("usuario");
        Consultas co = new Consultas();
        if(co.editarMenu(txtusredit, detalle_uid_Menu, detalle_menu_nombre, detalle_menu_valor, detalle_menu_padre, detalle_menu_tipo, detalle_menu_href, detalle_menu_target, detalle_menu_activo, detalle_menu_val1, usuario)){

            response.sendRedirect("/SADM/AdminM.jsp");
        }else{
        response.sendRedirect("/SADM/AdminM.jsp");
        
       
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
