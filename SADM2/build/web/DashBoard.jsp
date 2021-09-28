<%@page import="com.sadm.dao.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sadm.controlador.Consultas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.sadm.dao.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSession = request.getSession(false);
    String usuario = (String) objSession.getAttribute("usuario");
    if (null == usuario) {
        response.sendRedirect("Restringido.jsp");
    } else if (usuario.equals("")) {
        response.sendRedirect("Admin099.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Dash Board Admin</title>
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" name="description" />
        <meta content="Servicios de Agua y Drenaje de Monterrey I.P.D." property="og:title" />
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" property="og:description" />
        <meta content="summary" name="twitter:card" />
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <link href="archivos/css/sadm2021.a2257165c.min.css" rel="stylesheet" type="text/css" />
        <script src="js/webfont.js" type="text/javascript"></script>
        <script type="text/javascript">
            WebFont.load({
                google: {
                    families: ["Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic", "Roboto:100,100italic,300,300italic,regular,500italic,700,700italic,900,900italic"]
                }
            });</script>
        <!--[if lt IE 9]><script src="archivos/js/html5shiv.min.js" type="text/javascript"></script><![endif]-->

        <link href="archivos/uploaded_files/5b1ddbe400c01d95eb9dd383_IconoSADM.png" rel="shortcut icon" type="image/x-icon" />
        <link href="archivos/uploaded_files/5b6afb8e41c61684eb69bcee_logo_sadm_color.png" rel="apple-touch-icon" />
        <link rel="stylesheet" href="archivos/css/jquery-ui.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"  crossorigin="anonymous"></script>        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

        <script>
            UPLOADCARE_LOCALE = "es";
            UPLOADCARE_TABS = "file url facebook gdrive dropbox instagram flickr skydrive";
            UPLOADCARE_PUBLIC_KEY = "25c8982f9a85d38dd413";</script>
        <script charset="utf-8" src="//ucarecdn.com/libs/widget/3.3.0/uploadcare.full.min.js"></script>

    </head>
    <body data-ix="show-up-on-load" >

        <!-- -->
        <div style="display:flex;min-height:150px;padding-top:40px;background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca-p-1080.jpeg);background-position:50% 50%;background-size:cover">
          <div style="text-align: center;">
                <div style="text-align: center;" >
                    <h1 id="dash_heading_h1" style="text-align: center;color: white;font-family: sans-serif;" title="Panel del Administrador">Panel del Administrador</h1>
                    <div>
                        <form action="salir"   method="post" id="formsalir" >
                            <button type="submit"  class="btn btn-outline-danger" data-toggle="modal" title="Cerrar Sesión"   style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\salir.png" /></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="content-section" >




            <!-- -->

            <style type="text/css">
                .boton_personalizado{
                    text-decoration: none;
                    padding: 10px;
                    font-weight: 500;
                    font-size: 20px;
                    color: #ffffff;
                    background-color: #1883ba;
                    border-radius: 15px;
                    border: 2px solid #0016b0;
                    margin: 10px;
                }
                .fondoHeadHome { height: 400px;}
                .fondoHeadHome>h1 { font-family: 'Lato', sans-serif; font-size: 35px; font-weight: bold; color: white; text-shadow: 0 0 1em black;  padding-bottom: 0px; padding-top: 140px;}
                .fondoHeadHome>p  { font-family: 'Lato', sans-serif; font-size: 25px; color:white; text-shadow: 0 0 1em black; padding-top: 10px; }
                .fondoHeadHome    { /*background-image: url("banner-1920x400-1.jpg");*/ background-position: center;  background-size: 1920px 400px;}


                video { 
                    position: fixed;
                    min-width: 100%;
                    min-height: 100%;
                    left: 50%;
                    top: 50%;
                    transform: translateX(-50%) translateY(-50%);
                    z-index: -1;
                    /*-webkit-filter:sepia(100%);*/
                }
            </style>
            <div class="container">
                <div class="fondoHeadHome row text-center"  align="center" >
                    <div  align="center" id="pagina_admin" style="alignment-adjust: central;" >
                        <video muted autoplay loop style="background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca.jpeg)" >
                            <source src="archivos/uploaded_files/video_base.mp4" > 
                        </video>



                        <table style="text-align: center;width: 100%;alignment-adjust: central;">
                            <thead style="text-align: center;width: 100%;">

                            <th colspan="2">
                            <div data-ix="move-up-on-load" class="header-box" >

                                <h1 id="dash_print_user" title="Bienvenido <%=usuario%>" > Bienvenido <strong> <%=usuario%></strong></h1>
                                <br>
                            </div>
                            </th>



                            </thead>
                            <tbody  >
                                <tr style="text-align: center;" >
                                    <td ><a title="Selecciona para accesar al tabulador de Colaboradores." href="/SADM/AdminU.jsp"  style="margin: 15px;" align="center" class="boton_personalizado">Colaborador </a></td>
                                    <td><a title="Selecciona para accesar al tabulador de Menús." href="/SADM/AdminM.jsp" style="margin: 15px" align="center" class="boton_personalizado">Menú</a></td>
                                    <td><a title="Selecciona para accesar al tabulador de Páginas." href="/SADM/AdminPagina.jsp" style="margin: 15px" align="center" class="boton_personalizado">Página</a></td>
                                    <td><a title="Selecciona para accesar al administrador de Archivos." href="/SADM/AdminArchivos.jsp" style="margin: 15px" align="center" class="boton_personalizado">Archivos</a></td>
                                    <td><a title="Selecciona para accesar al tabulador de Prensa." href="/SADM/AdminPrensa.jsp" style="margin: 15px" align="center" class="boton_personalizado">Prensa</a></td>

                                    <td><a title="Selecciona para accesar al administrador de configuracion." href="/SADM/AdminConfig.jsp" style="margin: 15px" align="center" class="boton_personalizado">Configuración</a></td>
                                </tr>
                                <tr  style="text-align: center;"  >
                                    <td><img  style="margin: 15px;" src="archivos/uploaded_files/colaboradores.png" title="Administración de Colaboradores" ></td>
                                    <td><img style="margin: 15px" src="archivos/uploaded_files/menu.png" title="Administración de Menús"></td>
                                    <td><img style="margin: 15px" src="archivos/uploaded_files/paginas.png" title="Administración de Páginas"></td>
                                    <td><img style="margin: 15px" src="archivos/uploaded_files/archivo.png" title="Administración de Archivos"></td>
                                    <td><img style="margin: 15px" src="archivos/uploaded_files/prensa.png" title="Administración de Prensa"></td>

                                    <th><img style="margin: 15px" src="archivos/uploaded_files/configuracion.png" title="Configuraciones del Portal"></th>
                                </tr>
                            </tbody>
                        </table><br> </div></div></div>


            <!-- -->           
        </div>
                                <%
        Consultas consultas = new Consultas();
        Config confObj = consultas.obtenerConfig();
        consultas.getConexion().close();
    %>
        <div style="text-align: center;position: fixed;bottom: 0;float: left;width: 100%;margin-bottom: 10px;"  ><label style="color: black;" ><%=confObj.getCopyRigth()%></label></div>




        <!-- -->

        <!-- -->            
        <script src="archivos/js/jquery-3.4.1.min.220afd743d.js" type="text/javascript"></script>
        <script src="archivos/js/sadm2021.51f485010.js" type="text/javascript"></script>
        <!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->


    </body>
</html>
