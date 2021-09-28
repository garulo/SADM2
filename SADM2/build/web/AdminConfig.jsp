<%-- 
    Document   : AdminConfig
    Created on : Feb 7, 2020, 9:22:30 AM
    Author     : marco
--%>

<%@page import="com.sadm.dao.Config"%>
<%@page import="com.sadm.controlador.Consultas"%>
<%
    HttpSession objSession = request.getSession(false);
    String usuario = (String) objSession.getAttribute("usuario");
    if (null == usuario) {
        response.sendRedirect("Restringido.jsp");
    } else if (usuario.equals("")) {
        response.sendRedirect("Admin099.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Configuración del Portal</title>
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" name="description" />
        <meta content="Servicios de Agua y Drenaje de Monterrey I.P.D." property="og:title" />
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" property="og:description" />
        <meta content="summary" name="twitter:card" />
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <script src="js/webfont.js" type="text/javascript"></script>
        <script type="text/javascript">
            WebFont.load({
                google: {
                    families: ["Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic", "Roboto:100,100italic,300,300italic,regular,500italic,700,700italic,900,900italic"]
                }
            });</script>
        <link href="archivos/css/sadm2021.a2257165c.min.css" rel="stylesheet" type="text/css" />
        <link href="archivos/uploaded_files/5b1ddbe400c01d95eb9dd383_IconoSADM.png" rel="shortcut icon" type="image/x-icon" />
        <link href="archivos/uploaded_files/5b6afb8e41c61684eb69bcee_logo_sadm_color.png" rel="apple-touch-icon" />
        <link rel="stylesheet" href="archivos/css/jquery-ui.css">
        <style>
            .opciones {width: 100%;border: 2px #000000 solid;}
            #agregar_cont_pag {width: 100%;border: 2px #000000 solid;overflow: scroll;}
            #detalle_cont_pag {width: 100%;border: 2px #000000 solid;overflow: scroll;}
        </style>

        <script>
            function formatoFuente(sCmd, sValue) {
                document.execCommand(sCmd, false, sValue);
            }

            function processFiles(files) {
                var file = files[0];
                var reader = new FileReader();
                reader.onload = function (e) {
                    var output = document.getElementById("agregar_cont_pag");
                    var output2 = document.getElementById("detalle_cont_pag");

                    output.innerHTML = "<div>" + e.target.result + "</div>";
                    output2.innerHTML = "<div>" + e.target.result + "</div>";
                };
                reader.readAsText(file);

            }
            var dropBox;
            var dropBox2;
            window.onload = function () {
                dropBox = document.getElementById("agregar_cont_pag");
                dropBox2 = document.getElementById("detalle_cont_pag");
                dropBox.ondragenter = ignoreDrag;
                dropBox2.ondragenter = ignoreDrag;
                dropBox.ondragover = ignoreDrag;
                dropBox2.ondragover = ignoreDrag;
                dropBox.ondrop = drop;
                dropBox2.ondrop = drop;
            }
            function ignoreDrag(e) {
                e.stopPropagation();
                e.preventDefault();
            }
            function drop(e) {
                e.stopPropagation();
                e.preventDefault();
                var data = e.dataTransfer;
                var files = data.files;
                processFiles(files);
            }


        </script>
        <link href="archivos/uploaded_files/5b1ddbe400c01d95eb9dd383_IconoSADM.png" rel="shortcut icon" type="image/x-icon" />
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"  crossorigin="anonymous"></script>        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <style>
            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 20px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);

                z-index: 1;
                margin-right: 10px;
            }

            .dropdown:hover .dropdown-content {
                display: block;
                margin-right: 10px;
            }
            .desc {

                text-align: center;
                margin-right: 10px;

            }
        </style>

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
            .fondoHeadHome { height: 600px;}
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
    </head>
   <body data-ix="show-up-on-load" class="body" >

        <div style="min-height:150px;padding-top:40px;background-image:url(/SADM/archivos/uploaded_files/5c50c22234f7c43f1513d8cc_presa_el_cuchillo-p-1080.jpeg);background-position:50% 50%;background-size:cover">
            <div style="text-align: center;">
                <div style="text-align: center;" >
                    <h1 id="dash_heading_h1" style="text-align: center;color: white;font-family: sans-serif;" title="Panel del Administrador">Configuración del Portal</h1>
                    <div>
                        <form action="salir"   method="post" id="formsalir" >
                            <button type="button" class="btn btn-outline-warning" data-toggle="modal" onclick="location = '/SADM/DashBoard.jsp'" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\regresar.png" title="Regresar al DashBoard"/></button>
                            <button type="submit"  class="btn btn-outline-danger" data-toggle="modal" title="Cerrar Sesión"   style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\salir.png" /></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <div class="content-section">
            <div class="fondoHeadHome row text-center"  align="center" >
                <div  align="center" style="alignment-adjust: central;" >
                    <video muted autoplay loop style="background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca.jpeg)" >
                        <source src="archivos/uploaded_files/video_base.mp4" > 
                    </video>
             <div class="form-group" style="text-align:center;width: 100%;" >
                 <form action="editarportal"  method="post" id="formEditarPortal"  accept-charset="ISO-8859-1" >
             <div class="content-wrapper large w-container" >
                <div class="w-dyn-list" >
                    <div class="w-dyn-items">
                        <div data-ix="move-up-on-load" class="header-box center-no-border" >
                            <div  data-ix="move-up-on-load" class="title-box-3" >
                                <style>
                                    #tblMenu {
                                       
                                        border-collapse: collapse;
                                    }

                                    #tblMenu thead{
                                        display:block;
                                    }

                                    #tblMenu tbody{
                                        position:relative;
                                        max-height:300px;
                                        overflow-y: scroll;
                                        display:block;
                                    }

                                    #tblMenu td,th {
                                        min-width:200px;
                                        text-align: center;
                                    }
                                </style>
                                    
                                    <table id="tblMenu" name="tblMenu" class="table table-striped"  style="text-align: center;background-color: white;">
                                         <thead>
                                        </thead>
                                        <tbody>
                                            <%
                                            Consultas conconf = new Consultas();
                                            Config confObj = conconf.obtenerConfig();
                                            conconf.getConexion().close();
                                            %>
                                            <tr>
                                                <td style="margin: 20px;alignment-adjust: auto;width: 200px;"><strong>CopyRight</strong></td>
                                                <td style="margin: 20px;alignment-adjust: auto;width: 600px;"><input id="copyrigth" name="copyrigth" type="text" value="<%=confObj.getCopyRigth()%>"size="80" ></td>
                                            </tr>
                                            <tr>
                                                <td style="margin: 20px;alignment-adjust: auto;width: 200px;"><strong>URL uploaded_files</strong></td>
                                                <td style="margin: 20px;alignment-adjust: auto;width: 600px;">
                                                    <input id="urlUploaded_Files" name="urlUploaded_Files"  type="text" value="<%=confObj.getUrlUploaded_Files()%>" size="80" >
                                                   
                                                </td>
                                               
                                            
                                            </tr>
                                            <tr hidden>
                                                <td style="margin: 20px;alignment-adjust: auto;width: 200px;"><strong>ID</strong></td>
                                                <td style="margin: 20px;alignment-adjust: auto;width: 600px;">
                                                    <input name="idconfig" value="<%=confObj.getId()%>" hidden> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                     <div style="width: 100%;text-align: center;">
                                                    <button title="Guardar Cambios" type="button" class="btn btn-outline-success" onclick="submit()" style="width: 35%;height: 5%;margin: 5px;"><img style="width: 25%;" src="archivos\uploaded_files\savebtn.png" title="Guardar Cambios"/></button>
                                                     </div>
                                                     </td>
                                            </tr>
                                        
                                        
                                            </tbody>
                                    </table> 
                                   
                            </div>         </div></div></div></div>
                 </form>
             </div></div></div></div>
      
  

<div style="text-align: center;position: fixed;bottom: 0;float: left;width: 100%;margin-bottom: 10px;"  ><label style="color: black;" ><%=confObj.getCopyRigth()%></label></div>

    </body>
</html>
