<%@page import="java.io.File"%>
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
        <title>Administración de Archivos</title>
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" name="description" />
        <meta content="Servicios de Agua y Drenaje de Monterrey I.P.D." property="og:title" />
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" property="og:description" />

        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <!--[if lt IE 9]><script src="archivos/js/html5shiv.min.js" type="text/javascript"></script><![endif]-->
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tblImagenesedit tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
               
            });
        </script>
    </head>
    <body data-ix="show-up-on-load" class="body">
        <!-- -->  


        <div style="min-height:150px;padding-top:40px;background-image:url(/SADM/archivos/uploaded_files/5c50c22234f7c43f1513d8cc_presa_el_cuchillo-p-1080.jpeg);background-position:50% 50%;background-size:cover">
            <div style="text-align: center;">
                <div style="text-align: center;" >
                    <h1 id="dash_heading_h1" style="text-align: center;color: white;font-family: sans-serif;" title="Panel del Administrador">Administración de Archivos</h1>
                    <div>
                        <form action="salir"   method="post" id="formsalir" >

                            <button type="button" class="btn btn-outline-warning" data-toggle="modal" onclick="location = '/SADM/DashBoard.jsp'" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\regresar.png" title="Regresar al DashBoard"/></button>
                            <button type="submit"  class="btn btn-outline-danger" data-toggle="modal" title="Cerrar Sesión"   style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\salir.png" /></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="content-section" >
            <div class="fondoHeadHome row text-center"  align="center" >
                <div  align="center" id="pagina_admin" style="alignment-adjust: central;width: 100%;" >
                    <video muted autoplay loop style="background-image:url(/SADM/archivos/uploaded_files/5c50c22234f7c43f1513d8cc_presa_el_cuchillo-p-1080.jpeg)" >
                        <source src="archivos/uploaded_files/video_base.mp4" > 
                    </video>
                    <div class="form-group" style="text-align:center;background-color: white;" >
                        <div  >
                            <form id="editimg" name="editimg" action="FileUploadHandler" enctype="multipart/form-data" method="post">
                                <table class="table table-bordered" style="min-height:250px;">
                                    <thead style="background-color: #F2F5A9;">
                                        
                                        <tr>
                                            <th>
                                    <div >
                                        <h1 title="En este apartado se facilita subir archivos al portal para permitir su referencia en los contenidos del Portal SADM 2020"><strong>Importar archivos al Proyecto </strong></h1> 
                                    </div>
                                    </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr  ><td>
                                                <div >
                                                    <input onchange="vArch()" id="arch"  title="Selecciona los archivos que deseas importar desde tu equipo. Se recomienda solo utilizar formatos: TXT, MP4, PNG, JPG y PDF. Al terminar da un clic fuera del componente para confirmar y aparecerá el botón para guardar tu selección. " id="in_urlimagenmini2" class="btn btn-outline-warning" type="file"  name="archivossubidos[]" multiple >
                                                </div><div > 
                                                    <script>
                                                        function vArch(){
                                                            if(document.getElementById("arch").value ===''){
                                                                //alert("Debes seleccionar algun archivo para continuar.");
                                                                document.getElementById("btnGuardar").hidden=true;
                                                            }else{
                                                                  document.getElementById("btnGuardar").hidden=false;
                                                            }
                                                        }
                                                    </script>
                                                    <button  hidden id="btnGuardar" type="button" class="btn btn-outline-success" onclick="submit()" style="width: 20%;height: 5%;margin: 5px;"><img style="width: 25%;" src="archivos\uploaded_files\savebtn.png" title="Guardar archivos en proyecto."/></button>
                                                </div>
                                                <div>
                                                    
                                                </div></td>
                                        </tr>
                                      
                                   
                                    </tbody>
                                </table>
                                
                            </form>
                        </div>   
                        <button class="btn btn-outline-success" onclick="document.getElementById('tblImagenesedit').hidden=false;" title="Presiona el botón para mostrar un listado de los archivos existentes el servidor">Mostrar archivos almacenados</button>
                        <button class="btn btn-outline-success" onclick="document.getElementById('tblImagenesedit').hidden=true;" title="Presiona el botón para ocultar un listado de los archivos existentes el servidor" >Ocultar archivos almacenados</button>
    <div style="overflow: scroll;">
  <table class="table table-striped" hidden id='tblImagenesedit'style="text-align: center;">
  <thead>
        <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 30px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
         <input id="myInput" title="Teclea un criterio de búsqueda." style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 300px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda ."></label>
    <tr>
      <th scope="col">Imagen</th>
      <th scope="col">Nombre</th>
    </tr>
  </thead>
  <tbody style="background-color: white;">
        <%
            Consultas consultas = new Consultas();
            Config confO = consultas.obtenerConfig();
            
            File carpet = new File(confO.getUrlUploaded_Files());
            String[] listad = carpet.list();
            if (listad == null || listad.length == 0) {
                System.out.println("No hay elementos dentro de la carpeta actual");
                return;
            } else {
                for (int i = 0; i < listad.length; i++) {
                    %>
  <tr><td><img src='<%="archivos/uploaded_files/"+listad[i]%>' width="100" height="100" onclick="d2('<%=listad[i]%>'),vistaIIGedit.close()" ><br>
  </td>
  <td><Label  ><%=listad[i]%></label>
  </td></tr><%
                }
                
            }
        %>
        </tbody>
        </table>
            <script>
                function d2(p) {
                    
                    document.getElementById('din_urlimagenmini_1').value = "archivos/uploaded_files/" + p;

                }</script>
        </div>
                    </div> 
                </div> </div>
</div>
        





      <%
      
      Config confObj = consultas.obtenerConfig();
      consultas.getConexion().close();
      %>

<div style="text-align: center;position: fixed;bottom: 0;float: left;width: 100%;margin-bottom: 10px;"  ><label style="color: black;" > <%=confObj.getCopyRigth()%></label></div>

    </body>
</html>
