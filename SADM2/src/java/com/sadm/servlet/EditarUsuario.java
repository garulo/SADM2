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
public class EditarUsuario extends HttpServlet {

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
        String editar_idUsuario = request.getParameter("editar_idUsuario");
        String editar_Usuario = request.getParameter("editar_Usuario");
        String editar_Password = request.getParameter("editar_Password");
        String editar_Activo = request.getParameter("editar_Activo");
        String editar_Nombres = request.getParameter("editar_Nombres");
        String editar_A_Paterno = request.getParameter("editar_A_Paterno");
        String editar_A_Materno = request.getParameter("editar_A_Materno");
        Consultas co = new Consultas();
        if(co.editarUsuario(txtusredit,editar_idUsuario,editar_Usuario,editar_Password,editar_Activo,editar_Nombres,editar_A_Paterno,editar_A_Materno)){

            response.sendRedirect("/SADM/AdminU.jsp");
        }else{
        response.sendRedirect("/SADM/AdminU.jsp");
        
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
