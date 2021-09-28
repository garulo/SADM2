
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
public class AgreMenu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String agregar_uid_Menu = request.getParameter("agregar_uid_Menu");
        String agregar_menu_nombre = request.getParameter("agregar_menu_nombre");
        String agregar_menu_tipo = request.getParameter("agregar_menu_tipo");
        String agregar_menu_padre = request.getParameter("agregar_menu_padre");
        String agregar_menu_href = request.getParameter("agregar_menu_href");
        String agregar_menu_target = request.getParameter("agregar_menu_target");
        String agregar_menu_activo = request.getParameter("agregar_menu_activo");
        String agregar_menu_val1 = request.getParameter("agregar_menu_val1");
        String detalle_idRol = request.getParameter("detalle_idRol");
        String detalle_User_Modif = request.getParameter("detalle_User_Modif");
         String agregar_menu_valor = request.getParameter("agregar_menu_valor");
        Consultas co = new Consultas();
        if(co.insertarMenu(agregar_uid_Menu,agregar_menu_nombre,agregar_menu_tipo,agregar_menu_padre,agregar_menu_href,agregar_menu_target,agregar_menu_activo,agregar_menu_val1,detalle_idRol,detalle_User_Modif,agregar_menu_valor)){

            response.sendRedirect("/SADM/AdminM.jsp");
        }else{
        response.sendRedirect("/SADM/AdminM.jsp");
        
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
