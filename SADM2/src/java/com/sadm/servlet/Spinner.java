package com.sadm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Spinner extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
            out.println("<title>Loading...</title>");
            out.println("<link href=\"archivos/uploaded_files/5b1ddbe400c01d95eb9dd383_IconoSADM.png\" rel=\"shortcut icon\" type=\"image/x-icon\" />");
            out.println("<link href=\"archivos/uploaded_files/5b6afb8e41c61684eb69bcee_logo_sadm_color.png\" rel=\"apple-touch-icon\" />");
            out.println("</head>");
            out.println("<body onLoad=\"redireccionar()\">");
            out.println("<div class=\"div-block-12\"><img src=\"archivos/uploaded_files/loading.gif\" alt=\"\" class=\"image-26\"/></div>");
            out.println("</body>");
            out.println("<script language=\"JavaScript\">");
            out.println(" function redireccionar() {");
            out.println("setTimeout(\"location.href='default.html'\", 2000);");
            out.println("}");
            out.println(" </script>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

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
