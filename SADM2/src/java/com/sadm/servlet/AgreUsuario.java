
package com.sadm.servlet;

import com.sadm.controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AgreUsuario extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String detalle_Usuario = request.getParameter("detalle_Usuario");
        String detalle_Password = request.getParameter("detalle_Password");
        String detalle_Activo = request.getParameter("detalle_Activo");
        String detalle_Nombres = request.getParameter("detalle_Nombres");
        String detalle_A_Paterno = request.getParameter("detalle_A_Paterno");
        String detalle_A_Materno = request.getParameter("detalle_A_Materno");
        String detalle_User_Modif = request.getParameter("detalle_User_Modif");
        Consultas co = new Consultas();
        if(co.insertarUsuario(detalle_Usuario,detalle_Password,detalle_Activo,detalle_Nombres,detalle_A_Paterno,detalle_A_Materno,detalle_User_Modif)){

            response.sendRedirect("/SADM/AdminU.jsp");
        }else{
        response.sendRedirect("/SADM/AdminU.jsp");
        
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
