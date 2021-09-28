package com.sadm.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.Session;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet(name = "AltaServicioServlet", urlPatterns = {"/AltaServicioServlet"})
public class AltaServicioServlet extends HttpServlet {

    public static String sha256(String base) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String nir = request.getParameter("nir");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("Servlet consume servicios:::" + nir + " " + email + " " + password);

        
        password = sha256(password.trim());
        String struserName = request.getParameter("struserName");
        String strlastName = request.getParameter("strlastName");
        String strsecondLastName = request.getParameter("strsecondLastName");
        String token = "";

        //Generar la cuenta si no existe
        String REGISTRARSE = "https://ayd.sadm.gob.mx/appiV4/Registrarse";
        URL url = new URL(REGISTRARSE);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json; utf-8");
        con.setDoOutput(true);
        String jsonInputString = "{\n"
                + "  \"StrNombre\": \"" + struserName + "\",\n"
                + "  \"StrApellidoPaterno\": \"" + strlastName + "\",\n"
                + "  \"StrApellidoMaterno\": \"" + strsecondLastName + "\",\n"
                + "  \"StrEmail\": \"" + email.toLowerCase() + "\",\n"
                + "  \"StrPassword\": \"" + password + "\"\n"
                + "}";
        System.out.println("registrarse jsonInputString: " + jsonInputString);
        try (OutputStream os = con.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }
        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(con.getInputStream(), "utf-8"))) {
            String json = new String();
            InputStream inputStream = con.getInputStream();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream), 1);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                json = line;
            }
            System.out.println("jsonregistrar out ::: " + json);
            inputStream.close();
            bufferedReader.close();
            JSONObject jsonObj = new JSONObject(json);
            if (jsonObj.get("success").toString() == "true") {
                System.out.println("se inserto el usuario TRUE:::::");
                out.println("<script type=\"text/javascript\">");
                out.println("location='sweetAlertLogintrue.jsp?email='"+email+"");
                out.println("</script>");
            } else {
                String msg = jsonObj.get("message").toString();
                String strmsg = new String(msg.getBytes("ISO-8859-1"), "UTF-8");
                System.out.println("success FALSE registrar:::::" + strmsg);
//                out.println("<script type=\"text/javascript\">");
//                out.println("location='mC_S4dm.html'");
//                out.println("</script>");
            }

        } catch (JSONException ex) {
            Logger.getLogger(AltaServicioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        //Generar la cuenta si no existe
        

        //Inicia sesión generica
        //Obtener token
        String LOGIN = "https://ayd.sadm.gob.mx/appiV4/Login?Email=";
        URL urlogin = new URL(LOGIN + "mc_s4dm@sadm.com" + "&Password=" + "b524c491a5489654505d8c6498d2c8d1ded0e5ddd668dae4f472a348188ade77" + "&IdSistema=" + "mC_S4dm");
        HttpURLConnection conn = (HttpURLConnection) urlogin.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");

        if (conn.getResponseCode() != 200) {
            System.out.println("Login != 200 :: " + email);
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.location.href='sweetAlertLogin.html'");
            out.println("</script>");
            return ;

        } else {

            try {

                InputStream inputStream = conn.getInputStream();
                String json = new String();
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream), 1);
                String line;
                while ((line = bufferedReader.readLine()) != null) {
                    json = line;
                }
                inputStream.close();
                bufferedReader.close();
                //System.out.println("json ::: " + json);
                JSONObject jsonObj = new JSONObject(json);
                //System.out.println("::jsonObj.get(\"Response\").toString():: "+jsonObj.get("Response").toString());
                if ("null" != jsonObj.get("Response").toString()) {
                    JSONObject jsonObjloginresponse = new JSONObject(jsonObj.get("Response").toString());
                    JSONObject jsonObjloginresponsedata = new JSONObject(jsonObjloginresponse.get("data").toString());
                    JSONObject jsonObjloginresponsedatauser = new JSONObject(jsonObjloginresponsedata.get("Usuario").toString());
                    String tokenlogin = jsonObjloginresponsedata.get("Token").toString();
                    String username = jsonObjloginresponsedatauser.get("StrNombre").toString() + " " + jsonObjloginresponsedatauser.get("StrApellidoPaterno").toString() + " " + jsonObjloginresponsedatauser.get("StrApellidoMaterno").toString();

                    if (jsonObj.get("success").toString() == "true") {
                        System.out.println("success LOGIN TRUE::::: " + email);
                        HttpSession objSession = request.getSession(true);
                        objSession.setAttribute("usuario", email);
                        token = tokenlogin;
                        objSession.setAttribute("token", tokenlogin);
                        objSession.setAttribute("password", password);
                        objSession.setAttribute("nombreusuario", username);
                        objSession.setAttribute("nir", nir);

                    } else {
                        String msg = jsonObj.get("message").toString();
                        msg = msg.replace("Ã±", "ñ");
                        System.out.println("success LOGIN FALSE:::::" + email);
                        out.println("<script type=\"text/javascript\">");
                        out.println("window.parent.location.href='sweetAlertLogin.html'");
                        out.println("</script>");
                        return ;
                        
                        //TODO
                        //restablece contraseña 
                        //generar token de reestablecimiento
                        //restablece cintraseña(repite login)
                        
                    }
                } else {
                    System.out.println("success LOGIN FALSE:::::");
                    out.println("<script type=\"text/javascript\">");
                    out.println("window.parent.location.href='sweetAlertLogin.html'");
                    out.println("</script>");
                    return ;
                }
            } catch (IOException ioe) {
                Logger.getLogger(AltaServicioServlet.class.getName()).log(Level.SEVERE, null, ioe);
            } catch (JSONException ex) {
                Logger.getLogger(AltaServicioServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        
        
        
//        //Inicia sesión



//
        //Asignar contrato a cuenta SAP   
        
        String UPDSERVICIO = "https://ayd.sadm.gob.mx/appiV4/RegistrarContrato700_SAP?contrato=";
        URL urlpostUPDSERVICIO = new URL(UPDSERVICIO+nir+"&correo="+email);
        System.out.println("urlpostUPDSERVICIOSAP:: "+urlpostUPDSERVICIO);
        HttpURLConnection condataUPDSERVICIO = (HttpURLConnection) urlpostUPDSERVICIO.openConnection();
        condataUPDSERVICIO.setRequestMethod("POST");
        condataUPDSERVICIO.setRequestProperty("Content-Type", "application/json; utf-8");
        condataUPDSERVICIO.setRequestProperty("Content-Length", "135");
        condataUPDSERVICIO.setDoOutput(true);
        condataUPDSERVICIO.setRequestProperty("Authorization", "Bearer " + token);
        String jsonInputStringdataUPDSERVICIO = "{\n"
                + "  \"contrato\": \"" + nir + "\",\n"
                + "  \"correo\": \"" + email + "\"\n"
                + "}";
        //System.out.println("jsonInputStringdataUPDSERVICIO registrar servicio ::: "+jsonInputStringdata);
        try (OutputStream osUPDSERVICIO = condataUPDSERVICIO.getOutputStream()) {
            byte[] input = jsonInputStringdataUPDSERVICIO.getBytes("utf-8");
            osUPDSERVICIO.write(input, 0, input.length);
        }
        try (BufferedReader bdataUPDSERVICIO = new BufferedReader(
                new InputStreamReader(condataUPDSERVICIO.getInputStream(), "utf-8"))) {
            String jsondataUPDSERVICIO = new String();
            InputStream inputStreamdataUPDSERVICIO = condataUPDSERVICIO.getInputStream();
            BufferedReader bufferedReaderdataUPDSERVICIO = new BufferedReader(new InputStreamReader(inputStreamdataUPDSERVICIO), 1);
            String lineuserdataUPDSERVICIO;
            while ((lineuserdataUPDSERVICIO = bufferedReaderdataUPDSERVICIO.readLine()) != null) {
                jsondataUPDSERVICIO = lineuserdataUPDSERVICIO;
            }
            System.out.println("jsondataUPDSERVICIOSAP servicio registrar::: " + jsondataUPDSERVICIO);
            inputStreamdataUPDSERVICIO.close();
            bufferedReaderdataUPDSERVICIO.close();
            JSONObject jsonObjdataUPDSERVICIO = new JSONObject(jsondataUPDSERVICIO);
//            System.out.println("jsonObjdata.get(\"success\").toString(): "+jsonObjdata.get("success").toString());
            String jsonResponseUPDSERVICIO = jsonObjdataUPDSERVICIO.get("Response").toString(); 
            //System.out.println("jsonResponse : "+jsonResponse);
            
            jsonResponseUPDSERVICIO = jsonResponseUPDSERVICIO.replace("{\"data\":", "");
            jsonResponseUPDSERVICIO =jsonResponseUPDSERVICIO.substring(0,jsonResponseUPDSERVICIO.length()-1);
            JSONObject jsonObjdatasUPDSERVICIO = new JSONObject(jsonResponseUPDSERVICIO);
            String CodRetornoUPDSERVICIO = jsonObjdatasUPDSERVICIO.get("EstatusSQl").toString(); 
            String MensajeUPDSERVICIO = jsonObjdatasUPDSERVICIO.get("Mensaje").toString(); 
             System.out.println("jsonResponse : "+jsonResponseUPDSERVICIO);
            if (CodRetornoUPDSERVICIO.equalsIgnoreCase("true")) {
                //String msg = jsonObjdata.get("message").toString();
                //msg = msg.replace("Ã±", "ñ");
                System.out.println("success service mC_S4dm registrar TRUE:::::");
                out.println("<html>\n"
                                + "<head>\n"
                                + "<meta name=\"tipo_contenido\"  content=\"text/html;\" http-equiv=\"content-type\" charset=\"utf-8\">\n"
                                + "<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>\n"
                                + "</head>\n"
                                + "<body>\n"
                                + "<script>\n"
                                + "swal(\"Contrato registrado con éxito!\", \"" + MensajeUPDSERVICIO + ".\", \"success\").then((value) => {window.parent.location.href='mC_S4dm.html'});\n"
                                + "\n"
                                + "</script>\n"
                                + "</body>\n"
                                + "</html>");
                
               

            } else {
                System.out.println("success service mC_S4dm registrar FALSE:::::");
                out.println("<html>\n"
                                + "<head>\n"
                                + "<meta name=\"tipo_contenido\"  content=\"text/html;\" http-equiv=\"content-type\" charset=\"utf-8\">\n"
                                + "<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>\n"
                                + "</head>\n"
                                + "<body>\n"
                                + "<script>\n"
                                + "swal(\"Servicio no registrado!\", \"" + MensajeUPDSERVICIO + ".\", \"error\").then((value) => {window.parent.location.href='mC_S4dm.html'});\n"
                                + "\n"
                                + "</script>\n"
                                + "</body>\n"
                                + "</html>");
            }
        } catch (JSONException ex) {
            System.out.println("UPDSERVICIO mC_S4dm JSONException: "+ex);
        }

        //Asignar contrato a cuenta SAP  
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
