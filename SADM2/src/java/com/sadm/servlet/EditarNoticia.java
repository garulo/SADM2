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
public class EditarNoticia extends HttpServlet {

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
        
        String uid = request.getParameter("uid");
        String edit_id_not = request.getParameter("edit_id_not");
        String edit_urlimagenmini_1 = request.getParameter("edit_urlimagenmini");
        String edit_tit_not = request.getParameter("edit_tit_not");
        String edit_encab_not = request.getParameter("edit_encab_not");
        String edit_con_pag = request.getParameter("edit_con_pag");
        String edit_fech_not = request.getParameter("edit_fech_not");
        String edit_activo_not = request.getParameter("edit_activo_not");
        String usuario = request.getParameter("editUserNot");
        Consultas co = new Consultas();
        
        if(co.editarNoticia(uid,edit_id_not,edit_urlimagenmini_1,edit_tit_not,edit_encab_not,edit_con_pag,edit_fech_not,edit_activo_not, usuario)){

            response.sendRedirect("/SADM/AdminPrensa.jsp");
        }else{
        response.sendRedirect("/SADM/AdminPrensa.jsp");
        
       
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
