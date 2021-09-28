
package com.sadm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GreenSpinner extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       try {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset='utf-8' />");
            out.println("<meta http-equiv='X-UA-Compatible' content='IE=edge' />");
            out.println("<meta name='viewport' content='width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no' />");
            out.println("<meta name='description' content='Description' />");
            out.println("<meta name='keywords' content='Keywords' />");
            out.println("<meta name=\"theme-color\" content=\"#4285f4\" />");
            out.println("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>");
            out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>");
            out.println("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>");
            out.println("<script src=\"js/index.js\"></script>");
            out.println("<link rel=\"stylesheet\" href=\"css/index.css\" >");
            out.println("</head>");
            out.println(" <body>");
            out.println("<div class=\"modal fade bd-example-modal-xl\" id=\"loadMe\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"loadMeLabel\">");
            out.println("<div class=\"modal-dialog modal-xl modal-dialog-centered\" role=\"document\">");
            out.println("<div class=\"modal-content\">");
            out.println("<div class=\"modal-header\">");
            out.println("<h5 class=\"modal-title title-txt\" id=\"exampleModalCenterTitle\">Procesando tu pago</h5>");
            out.println("</div>");
            out.println("<div class=\"modal-body text-center\">");
            out.println("<div class=\"loader\"></div>");
            out.println("<div class=\"loader-txt\">");
            out.println("<p>Espera  por favor estamos trabajando.<br><br><small>Servicios de Agua y Drenaje de Monterrey I. P. D. #AyD_ParaTi.</small></p>");
            out.println("</div></div></div></div></div>");
            out.println("</body>");
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
